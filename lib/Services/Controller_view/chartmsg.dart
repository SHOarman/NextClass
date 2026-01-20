import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ==================== API & Models ====================
import 'package:first_project/Services/api_Services/api_services.dart';
import 'package:first_project/Services/model_class/chatmodel.dart';

// ==================== Chat Controller ====================
class Chartmsg extends GetxController {

  // ==================== STATE VARIABLES ====================

  // Controls loading indicator visibility
  var isLoading = false.obs;

  // Conversation list for inbox screen
  var conversationList = <dynamic>[].obs;

  // Message list for chat details screen
  var messageList = <ChatMessage>[].obs;

  // Text controller for message input field
  final TextEditingController textController = TextEditingController();

  // WebSocket channel instance
  WebSocketChannel? channel;

  // Conversation and user information
  late int conversationId;
  String? token;
  int? myUserId;

  // ==================== LIFECYCLE ====================
  @override
  void onInit() {
    super.onInit();
    // Load stored user credentials
    loadUserData();
  }

  @override
  void onClose() {
    // Safely close socket and dispose text controller
    closeSocket();
    textController.dispose();
    super.onClose();
  }

  // ==================== SOCKET CLEANUP ====================
  void closeSocket() {
    if (channel != null) {
      try {
        channel?.sink.close();
      } catch (e) {
        debugPrint("Channel close error: $e");
      }
    }
  }

  // ==================== LOAD USER DATA ====================
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve token and user ID from local storage
    token = prefs.getString('token');
    myUserId = prefs.getInt('user_id');

    debugPrint("User Loaded -> ID: $myUserId, Token Exists: ${token != null}");
  }

  // ==================== 1. FETCH CONVERSATION LIST ====================
  // Used for inbox screen
  Future<void> fetchConversationList() async {
    isLoading.value = true;

    try {
      await loadUserData();

      if (token == null) {
        debugPrint("Token is null");
        return;
      }

      final response = await http.get(
        Uri.parse(ApiServices.conversationsBase),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // Supports both list and paginated API response
        if (data is List) {
          conversationList.value = data;
        } else if (data['results'] != null) {
          conversationList.value = data['results'];
        }
      } else {
        debugPrint("Conversation fetch failed: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Conversation fetch error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ==================== 2. INIT CHAT ====================
  // Called when opening a chat screen
  Future<void> initChat(int convId) async {
    conversationId = convId;

    // Clear previous messages
    messageList.clear();

    // Close any existing socket
    closeSocket();

    await loadUserData();

    if (token != null && myUserId != null) {
      fetchHistory();   // Load previous messages
      connectSocket(); // Open WebSocket connection
      markAsRead();    // Mark messages as read
    } else {
      Get.snackbar("Error", "Please login first!");
    }
  }

  // ==================== 3. FETCH MESSAGE HISTORY ====================
  Future<void> fetchHistory() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse(
          '${ApiServices.chatMessages}?conversation_id=$conversationId',
        ),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<dynamic> results = data['results'] ?? [];

        // Reverse list for correct UI ordering (latest at bottom)
        messageList.value = results
            .where((e) => e != null && e is Map<String, dynamic>)
            .map((e) => ChatMessage.fromJson(e))
            .toList()
            .reversed
            .toList();
      } else {
        debugPrint("History fetch failed: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("History fetch error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ==================== 4. CONNECT WEBSOCKET ====================
  void connectSocket() {
    try {
      // Token passed via URL for web compatibility
      String cleanToken = (token ?? "").replaceAll('#', '').trim();

      final wsUrl =
          '${ApiServices.socketBaseUrl.replaceFirst('http', 'ws')}'
          '/ws/chat/$conversationId/?token=$cleanToken';

      debugPrint("Connecting WebSocket: $wsUrl");

      final socket = WebSocketChannel.connect(Uri.parse(wsUrl));
      channel = socket;

      socket.stream.listen(
            (message) {
          try {
            debugPrint("Socket Message: $message");
            var json = jsonDecode(message);

            // Add message if valid
            if (json is Map<String, dynamic>) {
              messageList.insert(0, ChatMessage.fromJson(json));
              messageList.refresh();
            }
          } catch (e) {
            debugPrint("Socket message parse error: $e");
          }
        },
        onError: (error) {
          debugPrint("Socket error: $error");
        },
      );
    } catch (e) {
      debugPrint("Socket connection failed: $e");
    }
  }

  // ==================== 5. SEND MESSAGE ====================
  Future<void> sendMessage() async {
    final String msgContent = textController.text.trim();
    if (msgContent.isEmpty) return;

    // Clear input immediately
    textController.clear();

    try {
      final response = await http.post(
        Uri.parse(ApiServices.chatMessages),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'conversation': conversationId,
          'content': msgContent,
          'message_type': 'text',
        }),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        debugPrint("Message send failed: ${response.body}");
      }
    } catch (e) {
      debugPrint("Send message error: $e");
    }
  }

  // ==================== 6. MARK MESSAGES AS READ ====================
  Future<void> markAsRead() async {
    try {
      await http.post(
        Uri.parse(
          '${ApiServices.conversationsBase}$conversationId/mark_read/',
        ),
        headers: {'Authorization': 'Bearer $token'},
      );
    } catch (e) {
      debugPrint("Mark read error: $e");
    }
  }
}
