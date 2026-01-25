// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../Services/api_Services/api_services.dart';
// import '../../../../Services/model_class/chat_models.dart';
// import '../../../../teacher_presentScreen/chat2/msgmodel.dart';
//
// class ChatControllerTeacher extends GetxController {
//   // Renamed to ChatControllerTeacher to match usage
//   // --- Observables ---
//   var isLoading = false.obs;
//   var inboxList = <ConversationModel>[].obs;
//   var messages = <ChatMessage>[].obs; // Using consistent naming
//   var currentConversationId = 0.obs;
//
//   // --- Socket variables ---
//   WebSocketChannel? _channel;
//   Completer<void>? _socketReady;
//   String? token;
//   int? myUserId;
//
//   // Use consistent naming for UI binding if needed, or map 'messages' to 'messageList' getter if viewed that way
//   List<ChatMessage> get messageList => messages;
//
//   // Additional controller methods like initChat to match usage in ChatConnectionTeacher
//   void initChat(int conversationId) {
//     enterChatRoom(conversationId);
//   }
//
//   // Existing fields...
//   final TextEditingController textController =
//       TextEditingController(); // Added for UI
//
//   @override
//   void onInit() {
//     super.onInit();
//     // fetchInbox(); // Optional: load inbox on init if needed
//   }
//
//   @override
//   void onClose() {
//     disconnectSocket();
//     super.onClose();
//   }
//
//   // --- Auth & Data Loading ---
//   Future<void> loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     token = prefs.getString('token');
//     myUserId = prefs.getInt('user_id');
//   }
//
//   // --- 3. Chat Room Entry & WebSocket Handshake ---
//   Future<void> enterChatRoom(int conversationId) async {
//     currentConversationId.value = conversationId;
//     messages.clear();
//
//     await loadUserData(); // Ensure token is loaded first
//
//     // Step 1: Fetch old messages via API
//     await fetchHistory(conversationId);
//
//     // Step 2: Establish Socket connection for real-time messages
//     connectSocket(conversationId);
//   }
//
//   Future<void> fetchHistory(int conversationId) async {
//     isLoading.value = true;
//     try {
//       final uri = Uri.parse(
//         '${ApiServices.chatMessages}?conversation_id=$conversationId',
//       );
//       final response = await http.get(
//         uri,
//         headers: {'Authorization': 'Bearer $token'},
//       );
//
//       if (response.statusCode == 200) {
//         List data = jsonDecode(response.body);
//         // Ensure ChatMessage.fromJson matches your model structure
//         var history = data
//             .map((e) => ChatMessage.fromJson(e, myUserId: myUserId))
//             .toList();
//         messages.assignAll(history);
//       }
//     } catch (e) {
//       debugPrint("Fetch History Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void connectSocket(int conversationId) async {
//     disconnectSocket();
//     _socketReady = Completer<void>();
//     await loadUserData();
//     if (token == null) return;
//
//     try {
//       // Clean token
//       String cleanToken = token!.replaceAll('#', '').trim();
//
//       // Ensure base URL uses ws/wss
//       String baseUrl = ApiServices.socketBaseUrl;
//       if (baseUrl.startsWith('http://')) {
//         baseUrl = baseUrl.replaceFirst('http://', 'ws://');
//       } else if (baseUrl.startsWith('https://')) {
//         baseUrl = baseUrl.replaceFirst('https://', 'wss://');
//       }
//
//       // Construct properly encoded URI
//       final uri = Uri.parse(
//         '$baseUrl/ws/chat/$conversationId/',
//       ).replace(queryParameters: {'token': cleanToken});
//
//       debugPrint("Connecting WS: $uri");
//       _channel = WebSocketChannel.connect(uri);
//
//       // Handshake initiated
//       if (!_socketReady!.isCompleted) _socketReady!.complete();
//
//       _channel!.stream.listen(
//         (message) {
//           try {
//             final data = jsonDecode(message);
//             // POSTMAN Format Check: {"type": "chat_message", "message": "..."}
//             if (data['type'] == 'chat_message' || data.containsKey('message')) {
//               // Adjust parsing based on actual socket message structure
//               // If socket returns simple structure, map it to ChatMessage
//               // For now assuming it returns compatible JSON
//               messages.insert(
//                 0,
//                 ChatMessage.fromJson(data, myUserId: myUserId),
//               );
//             }
//           } catch (e) {
//             debugPrint("Socket Parse Error: $e");
//           }
//         },
//         onError: (err) {
//           debugPrint("WS Error: $err");
//           disconnectSocket();
//         },
//         onDone: () => disconnectSocket(),
//       );
//     } catch (e) {
//       debugPrint("WS Connection Error: $e");
//       disconnectSocket();
//     }
//   }
//
//   void disconnectSocket() {
//     _channel?.sink.close();
//     _channel = null;
//   }
//
//   // --- 4. Sending Messages ---
//   Future<void> sendMessage({int? receiverId}) async {
//     String text = textController.text.trim();
//     if (text.isEmpty) return;
//
//     // Check if socket needs reconnection
//     if (_channel == null) {
//       debugPrint("Socket dropped. Reconnecting...");
//       connectSocket(currentConversationId.value);
//     }
//
//     // Optimistic UI update
//     // messages.insert(0, ChatMessage(content: text, senderId: myUserId, ...));
//
//     try {
//       // Ensure handshake is finished before adding to sink
//       await _socketReady?.future.timeout(const Duration(seconds: 5));
//
//       // Postman Payload structure
//       final payload = {"type": "chat_message", "message": text};
//
//       _channel?.sink.add(jsonEncode(payload));
//       textController.clear(); // Clear input on success (or optimistic)
//     } catch (e) {
//       debugPrint("Send Error: $e");
//     }
//   }
// }
