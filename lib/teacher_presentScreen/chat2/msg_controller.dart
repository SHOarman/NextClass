// // msg_controller.dart
//
// import 'package:get/get.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
// import '../../Services/api_Services/api_services.dart';
// import 'msgmodel.dart';
//
// class ChatController extends GetxController {
//   WebSocketChannel? channel;
//   var messages = <ChatMessage>[].obs;
//   var conversationList = <ConversationModel>[].obs;
//   var isLoading = false.obs;
//
//   String myUserId = "";
//   String token = "";
//   String conversationId = "";
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadAuthData();
//   }
//
//   @override
//   void onClose() {
//     closeSocket();
//     super.onClose();
//   }
//
//   Future<void> _loadAuthData() async {
//     final prefs = await SharedPreferences.getInstance();
//     token = prefs.getString('token') ?? "";
//     myUserId = (prefs.getInt('user_id') ?? 0).toString();
//     fetchInbox();
//   }
//
//   void closeSocket() {
//     if (channel != null) {
//       channel!.sink.close();
//     }
//   }
//
//   void connectSocket(String convId) {
//     closeSocket();
//     conversationId = convId;
//     if (token.isEmpty || convId.isEmpty) return;
//
//     try {
//       // Clean token and fix URL scheme
//       String cleanToken = token.replaceAll('#', '').trim();
//       String baseUrl = ApiServices.socketBaseUrl.replaceFirst('http', 'ws');
//       final String wsUrl = '$baseUrl/ws/chat/$convId/?token=$cleanToken';
//
//       debugPrint("Connecting to Socket: $wsUrl");
//       channel = WebSocketChannel.connect(Uri.parse(wsUrl));
//
//       channel!.stream.listen((message) {
//         try {
//           var json = jsonDecode(message);
//           messages.insert(0, ChatMessage.fromJson(json));
//           messages.refresh();
//         } catch (e) {
//           debugPrint("Socket message parse error: $e");
//         }
//       }, onError: (err) => debugPrint("Socket Stream Error: $err"));
//     } catch (e) {
//       debugPrint("Socket Connection Error: $e");
//     }
//   }
//
//   Future<void> fetchInbox() async {
//     isLoading.value = true;
//     try {
//       final response = await http.get(
//         Uri.parse(ApiServices.conversationsBase),
//         headers: {'Authorization': 'Bearer $token'},
//       );
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         List listData = [];
//         if (data is List) {
//           listData = data;
//         } else if (data is Map && data.containsKey('results')) {
//           listData = data['results'];
//         }
//
//         conversationList.assignAll(
//           listData.map((e) => ConversationModel.fromJson(e)).toList(),
//         );
//       }
//     } catch (e) {
//       debugPrint("Fetch Inbox Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   Future<void> loadChatHistory(String convId) async {
//     isLoading.value = true;
//     messages.clear();
//     // Connect to socket when entering chat
//     connectSocket(convId);
//
//     try {
//       final response = await http.get(
//         Uri.parse("${ApiServices.conversationsBase}$convId/messages/"),
//         headers: {'Authorization': 'Bearer $token'},
//       );
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         List listData = [];
//         if (data is List) {
//           listData = data;
//         } else if (data is Map && data.containsKey('results')) {
//           listData = data['results'];
//         }
//
//         // Reverse if necessary depending on UI, usually API returns latest first or last first.
//         // Assuming API returns paginated (newest first) or old to new.
//         // ChatMessage.fromJson usually handles it.
//         messages.assignAll(
//           listData.map((m) => ChatMessage.fromJson(m)).toList(),
//         );
//       }
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   Future<void> sendMessage(String content, String convId) async {
//     if (content.isEmpty) return;
//
//     // Optimistic update
//     // var msgData = {
//     //   'conversation': int.tryParse(convId) ?? 0,
//     //   'sender': int.tryParse(myUserId) ?? 0,
//     //   'content': content,
//     //   'timestamp': DateTime.now().toIso8601String(),
//     //   'message_type': 'text'
//     // };
//     // messages.insert(0, ChatMessage.fromJson(msgData));
//
//     try {
//       final response = await http.post(
//         Uri.parse(ApiServices.chatMessages),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'conversation': convId,
//           'content': content,
//           'message_type': 'text',
//         }),
//       );
//
//       if (response.statusCode != 200 && response.statusCode != 201) {
//         debugPrint("Send failed: ${response.body}");
//       }
//     } catch (e) {
//       debugPrint("Send Error: $e");
//     }
//   }
//
//   String formatTime(String time) {
//     if (time.isEmpty) return "";
//     try {
//       return DateFormat('hh:mm a').format(DateTime.parse(time).toLocal());
//     } catch (e) {
//       return "";
//     }
//   }
// }
