import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Services/api_Services/api_services.dart';
import '../../../../Services/model_class/chat_models.dart';

class ChatController extends GetxController {
  // --- Observables ---
  var isLoading = false.obs;
  var inboxList = <ConversationModel>[].obs;
  var messages = <ChatMessage>[].obs;
  var currentConversationId = 0.obs;

  // --- Socket variables ---
  WebSocketChannel? _channel;
  Completer<void>?
  _socketReady; // Used to prevent sending before connection is established
  String? token;
  int? myUserId;

  @override
  void onInit() {
    super.onInit();
    fetchInbox();
  }

  @override
  void onClose() {
    disconnectSocket();
    super.onClose();
  }

  // --- Auth & Data Loading ---
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    myUserId = prefs.getInt('user_id');
  }

  // --- 1. Inbox Management (List all conversations) ---
  Future<void> fetchInbox() async {
    isLoading.value = true;
    try {
      await loadUserData();
      if (token == null) return;

      final response = await http.get(
        Uri.parse(ApiServices.chatMessages), // POSTMAN: /api/chat/messages/
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        List data = [];
        if (decoded is List) {
          data = decoded;
        } else if (decoded is Map && decoded.containsKey('results')) {
          data = decoded['results'] ?? [];
        } else {
          debugPrint("Inbox Parse Warning: Unexpected format $decoded");
        }

        inboxList.assignAll(
          data.map((e) => ConversationModel.fromJson(e)).toList(),
        );
      }
    } finally {
      isLoading.value = false;
    }
  }

  // --- 2. Start/Get Conversation ID (For the 'Chat' button on Teacher Card) ---
  Future<int?> startConversation(int otherUserId, {int? classListingId}) async {
    try {
      await loadUserData();
      final url = Uri.parse(
        '${ApiServices.conversationsBase}start_conversation/',
      ); // POSTMAN: start_conversation/

      final body = {
        "other_user_id": otherUserId,
        if (classListingId != null) "class_listing_id": classListingId,
      };

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        var id = data['id'];
        if (id is int) return id;
        if (id is String) return int.tryParse(id);
        return null;
      }
    } catch (e) {
      debugPrint("Start Conv Error: $e");
    }
    return null;
  }

  // --- 3. Chat Room Entry & WebSocket Handshake ---
  Future<void> enterChatRoom(int conversationId) async {
    currentConversationId.value = conversationId;
    messages.clear();

    // Step 1: Fetch old messages via API
    await fetchHistory(conversationId);

    // Step 2: Establish Socket connection for real-time messages
    connectSocket(conversationId);
  }

  Future<void> fetchHistory(int conversationId) async {
    isLoading.value = true;
    try {
      final uri = Uri.parse(
        '${ApiServices.chatMessages}?conversation_id=$conversationId',
      );
      final response = await http.get(
        uri,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        var history = data
            .map((e) => ChatMessage.fromJson(e, myUserId: myUserId))
            .toList();
        messages.assignAll(
          history,
        ); // Note: Assuming index 0 is latest for reversed ListView
      }
    } finally {
      isLoading.value = false;
    }
  }

  void connectSocket(int conversationId) async {
    disconnectSocket();
    _socketReady = Completer<void>();
    await loadUserData();

    // ws://10.10.7.51:8000/ws/chat/{id}/?token={token}
    String baseUrl = ApiServices.baseUrl.replaceFirst('http', 'ws');
    final wsUrl = '$baseUrl/ws/chat/$conversationId/?token=$token';

    try {
      debugPrint("Connecting WS: $wsUrl");
      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));

      // Handshake initiated
      if (!_socketReady!.isCompleted) _socketReady!.complete();

      _channel!.stream.listen(
        (message) {
          final data = jsonDecode(message);
          // POSTMAN Format Check: {"type": "chat_message", "message": "..."}
          if (data['type'] == 'chat_message' || data.containsKey('message')) {
            messages.insert(0, ChatMessage.fromJson(data, myUserId: myUserId));
          }
        },
        onError: (err) => disconnectSocket(),
        onDone: () => disconnectSocket(),
      );
    } catch (e) {
      debugPrint("WS Error: $e");
      disconnectSocket();
    }
  }

  void disconnectSocket() {
    _channel?.sink.close();
    _channel = null;
  }

  // --- 4. Sending Messages (Postman Format) ---
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Check if socket needs reconnection
    if (_channel == null) {
      debugPrint("Socket dropped. Reconnecting...");
      connectSocket(currentConversationId.value);
    }

    try {
      // Ensure handshake is finished before adding to sink
      await _socketReady?.future.timeout(const Duration(seconds: 5));

      // Postman Payload structure
      final payload = {"type": "chat_message", "message": text.trim()};

      _channel?.sink.add(jsonEncode(payload));
    } catch (e) {
      debugPrint("Send Error: $e");
    }
  }
}
