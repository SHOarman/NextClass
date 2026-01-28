import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Parent_parsentScreen/profile_Screen/profileController/profile_controller.dart';
import '../model_class/chat_models.dart';
import '../api_Services/api_Services.dart';
import 'chat_list_controller.dart';

class InboxController extends GetxController {
  //==================== STATE VARIABLES ====================
  var messages = <ChatMessageModel>[].obs;
  var isLoading = false.obs;
  var isConnected = false.obs;
  var isOtherUserTyping = false.obs;

  var userName = "User".obs;
  var userProfile = "".obs;
  var conversationId = 0.obs;
  var receiverId = 0.obs;

  // Stored for easy access by UI to determine message side (Left/Right)
  var currentUserId = 0.obs;

  WebSocketChannel? channel;
  Timer? _reconnectTimer;

  @override
  void onInit() {
    super.onInit();
    // Load User ID Immediately
    _loadUserId();

    if (Get.arguments != null) {
      final args = Get.arguments;
      conversationId.value = args['id'] ?? 0;
      userName.value = args['name'] ?? "User";
      userProfile.value = args['profile'] ?? "";
      receiverId.value = args['receiverId'] ?? 0;

      debugPrint("📩 InboxController Init: Conv ID ${conversationId.value}");

      if (conversationId.value > 0) {
        initChat(conversationId.value);
      } else if (receiverId.value > 0) {
        _createConversationIfNeeded();
      }
    }
  }

  void _loadUserId() {
    // Try to get from ProfileController first
    if (Get.isRegistered<ProfileController>()) {
      currentUserId.value = Get.find<ProfileController>().userId.value;
    }

    // If 0, try SharedPrefs as fallback
    if (currentUserId.value == 0) {
      SharedPreferences.getInstance().then((prefs) {
        currentUserId.value = prefs.getInt('user_id') ?? 0;
        debugPrint("👤 InboxController: Loaded User ID ${currentUserId.value}");
      });
    }

    // Listen to ProfileController changes if it updates later
    if (Get.isRegistered<ProfileController>()) {
      ever(Get.find<ProfileController>().userId, (int id) {
        if (id > 0) currentUserId.value = id;
      });
    }
  }

  //==================== INITIALIZATION ====================
  Future<void> initChat(int convId) async {
    try {
      isLoading.value = true;
      messages.clear();

      // 1. Load History
      await loadChatHistory(convId);

      // 2. Connect Socket
      await connectToChatSocket(convId);

      // 3. Mark as Read (Initial)
      await markAsRead(convId);
    } catch (e) {
      debugPrint("❌ Initialization Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  //==================== HISTORY & API ====================
  Future<void> loadChatHistory(int convId) async {
    try {
      var response = await ApiServices.getChatMessages(convId);
      if (response != null && response['results'] != null) {
        List<dynamic> results = response['results'];
        final List<ChatMessageModel> history = results
            .map((e) => ChatMessageModel.fromJson(e))
            .where((m) => m.conversation == convId)
            .toList();

        // Sort Descending (Newest first) for Reverse ListView
        history.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        messages.assignAll(history);
        messages.refresh();
      }
    } catch (e) {
      debugPrint("❌ History API Error: $e");
    }
  }

  bool _isDisposed = false;

  //==================== SOCKET CONNECTION ====================
  Future<void> connectToChatSocket(int convId) async {
    if (_isDisposed) return; // Stop if disposed
    _reconnectTimer?.cancel();
    if (channel != null) {
      await channel!.sink.close();
    }

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) return;

    String socketUrl =
        "${ApiServices.socketBaseUrl}/ws/chat/$convId/?token=$token";
    final uri = Uri.parse(
      socketUrl.replaceFirst("http", "ws").trim().replaceAll("#", ""),
    );

    try {
      debugPrint("🔌 Connecting to Socket...");
      channel = WebSocketChannel.connect(uri);
      isConnected.value = true;

      channel!.stream.listen(
        (event) {
          if (_isDisposed) return;
          _handleSocketEvent(event, convId);
        },
        onDone: () {
          isConnected.value = false;
          if (!_isDisposed) _scheduleReconnect(convId);
        },
        onError: (err) {
          isConnected.value = false;
          debugPrint("❌ Socket Error: $err");
          if (!_isDisposed) _scheduleReconnect(convId);
        },
      );
    } catch (e) {
      isConnected.value = false;
      if (!_isDisposed) _scheduleReconnect(convId);
    }
  }

  void _scheduleReconnect(int convId) {
    if (_isDisposed || !Get.isRegistered<InboxController>()) return;
    debugPrint("⚠️ Socket Disconnected. Reconnecting in 3s...");
    _reconnectTimer = Timer(const Duration(seconds: 3), () {
      if (!_isDisposed && Get.isRegistered<InboxController>()) {
        connectToChatSocket(convId);
      }
    });
  }

  //==================== SOCKET EVENT HANDLING ====================
  void _handleSocketEvent(dynamic event, int convId) {
    if (!Get.isRegistered<InboxController>()) return;
    try {
      final data = json.decode(event);
      final type = data['type'];

      switch (type) {
        case 'chat_message':
          _handleIncomingMessage(
            ChatMessageModel.fromJson(data['message']),
            convId,
          );
          break;

        case 'typing':
          isOtherUserTyping.value = data['is_typing'] ?? false;
          break;

        case 'message_read':
        case 'read_receipt':
          _markLocalMessagesAsRead();
          break;
      }
    } catch (e) {
      debugPrint("⚠️ Socket Event Parse Error: $e");
    }
  }

  void _handleIncomingMessage(ChatMessageModel newMessage, int convId) {
    if (newMessage.conversation != convId && newMessage.conversation != 0)
      return;

    int myId = currentUserId.value;

    // Filter duplicates
    messages.removeWhere(
      (m) =>
          m.id == newMessage.id ||
          (m.sender == myId &&
              m.content == newMessage.content &&
              m.id > 1000000000),
    );

    messages.insert(0, newMessage);
    messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    messages.refresh();

    // Notify List Controller
    if (Get.isRegistered<ChatListController>()) {
      Get.find<ChatListController>().updateConversationFromSocket(
        newMessage,
        convId,
      );
    }

    if (newMessage.sender != myId) {
      markAsRead(convId);
    }
  }

  void _markLocalMessagesAsRead() {
    for (var msg in messages) {
      if (!msg.isRead) {
        msg.isRead = true;
      }
    }
    messages.refresh();
  }

  //==================== SENDING LOGIC ====================
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) {
      return;
    }

    if (conversationId.value == 0 && receiverId.value > 0) {
      await _createConversationIfNeeded();
    }
    if (conversationId.value == 0) return;

    final content = text.trim();
    final myId = currentUserId.value;

    // Optimistic Msg
    final tempId = DateTime.now().millisecondsSinceEpoch;
    final tempMsg = ChatMessageModel(
      id: tempId,
      conversation: conversationId.value,
      sender: myId,
      content: content,
      messageType: "text",
      isRead: false,
      createdAt: DateTime.now(),
      senderDetails: SenderDetails(
        id: myId,
        fullName: "Me",
        profilePicture: userProfile.value,
        userType: "",
        status: "active",
      ),
    );

    messages.insert(0, tempMsg);
    messages.refresh();

    if (isConnected.value) {
      try {
        channel?.sink.add(
          json.encode({"type": "chat_message", "message": content}),
        );
      } catch (e) {
        await _sendViaHttp(conversationId.value, content, tempId);
      }
    } else {
      await _sendViaHttp(conversationId.value, content, tempId);
    }
  }

  Future<void> _sendViaHttp(int convId, String content, int tempId) async {
    bool success = await ApiServices.sendChatMessage(convId, content);
    if (!success) {
      messages.removeWhere((m) => m.id == tempId);
      Get.snackbar("Error", "Message failed to send!");
    } else {
      loadChatHistory(convId);
    }
  }

  //==================== HELPERS ====================
  Future<void> _createConversationIfNeeded() async {
    isLoading.value = true;
    final response = await ApiServices.startChatConversation(receiverId.value);
    if (response != null && response['id'] != null) {
      conversationId.value = response['id'];
      initChat(conversationId.value);
    }
    isLoading.value = false;
  }

  Future<void> markAsRead(int convId) async {
    try {
      await ApiServices.postMarkAsRead(convId);
    } catch (e) {
      debugPrint("❌ markAsRead Failed: $e");
    }
  }

  void sendTypingStatus(bool isTyping) {
    if (isConnected.value) {
      channel?.sink.add(json.encode({"type": "typing", "is_typing": isTyping}));
    }
  }

  @override
  void onClose() {
    _isDisposed = true; // Mark as disposed
    _reconnectTimer?.cancel();
    channel?.sink.close();
    super.onClose();
  }
}
