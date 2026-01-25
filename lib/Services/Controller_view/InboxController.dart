import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model_class/chat_models.dart';
import '../api_Services/api_Services.dart';

class InboxController extends GetxController {
  //==================== STATE ====================
  var messages = <ChatMessageModel>[].obs;
  var isOtherUserTyping = false.obs;
  var isLoading = false.obs;
  var isConnected = false.obs;

  IOWebSocketChannel? channel;

  //==================== CONNECT SOCKET ====================
  Future<void> connectToChat(int conversationId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) return;

    try {
      // 1. Clean token (remove trailing # and whitespace)
      String cleanToken = token.replaceAll('#', '').trim();

      // 2. Ensure base URL uses ws/wss
      String baseUrl = ApiServices.socketBaseUrl;
      // Safety check if socketBaseUrl still has http
      if (baseUrl.startsWith('http://')) {
        baseUrl = baseUrl.replaceFirst('http://', 'ws://');
      } else if (baseUrl.startsWith('https://')) {
        baseUrl = baseUrl.replaceFirst('https://', 'wss://');
      }

      // 3. Construct properly encoded URI with Query Parameter
      // URL: ws://10.10.7.51:8000/ws/chat/{id}/?token={cleanToken}
      final uri = Uri.parse(
        '$baseUrl/ws/chat/$conversationId/',
      ).replace(queryParameters: {'token': cleanToken});

      debugPrint("Connecting Inbox Socket: $uri");

      // Close pending connection
      closeConnection();

      // Connect
      channel = IOWebSocketChannel.connect(uri);
      isConnected.value = true;

      channel!.stream.listen(
        (event) {
          try {
            final data = json.decode(event);

            switch (data['type']) {
              case 'chat_message':
                if (data['message'] != null) {
                  _handleIncomingMessage(data['message']);
                }
                break;

              case 'typing':
                isOtherUserTyping.value = data['is_typing'] ?? false;
                break;

              case 'read_receipt':
                _handleReadReceipt(data['message_id']);
                break;
            }
          } catch (e) {
            debugPrint("Socket Parse Error: $e");
          }
        },
        onError: (error) {
          debugPrint("Socket Error: $error");
          isConnected.value = false;
        },
        onDone: () {
          debugPrint("Socket Closed");
          isConnected.value = false;
        },
      );
    } catch (e) {
      debugPrint("Socket Exception: $e");
      isConnected.value = false;
    }
  }

  //==================== HANDLE INCOMING MESSAGE ====================
  void _handleIncomingMessage(Map<String, dynamic> messageJson) {
    try {
      final newMessage = ChatMessageModel.fromJson(messageJson);

      // Duplicate check
      if (!messages.any((m) => m.id == newMessage.id)) {
        messages.insert(0, newMessage); // Add to top for reversed list
        // Or if your list is regular: messages.add(newMessage);
        // messages.sort((a, b) => b.timestamp.compareTo(a.timestamp)); // Ensure order
        messages.refresh();

        // Send read receipt if message is from other user
        // Replace 40 with dynamic user ID logic if possible
        if (newMessage.senderId != 40) {
          sendReadReceipt(newMessage.id);
        }
      }
    } catch (e) {
      debugPrint("Message Parse Error: $e");
    }
  }

  //==================== HANDLE READ RECEIPT ====================
  void _handleReadReceipt(dynamic messageId) {
    if (messageId == null) return;
    final id = int.tryParse(messageId.toString()) ?? 0;
    final index = messages.indexWhere((m) => m.id == id);
    if (index != -1) {
      // Update read status if model supports it
      // messages[index].isRead = true;
      messages.refresh();
    }
  }

  //==================== SEND MESSAGE ====================
  void sendMessage(String text) {
    if (isConnected.value && text.trim().isNotEmpty) {
      final payload = {"type": "chat_message", "message": text.trim()};
      channel?.sink.add(json.encode(payload));
    }
  }

  //==================== TYPING STATUS ====================
  void sendTypingStatus(bool isTyping) {
    if (isConnected.value) {
      channel?.sink.add(json.encode({"type": "typing", "is_typing": isTyping}));
    }
  }

  //==================== SEND READ RECEIPT ====================
  void sendReadReceipt(int messageId) {
    if (isConnected.value) {
      channel?.sink.add(
        json.encode({"type": "read_receipt", "message_id": messageId}),
      );
    }
  }

  //==================== CLOSE SOCKET ====================
  void closeConnection() {
    try {
      channel?.sink.close();
    } catch (_) {}
    channel = null;
    isConnected.value = false;
  }

  @override
  void onClose() {
    closeConnection();
    super.onClose();
  }
}
