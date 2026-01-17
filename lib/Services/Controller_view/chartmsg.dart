// import 'dart:convert';
// import 'package:first_project/Services/api_Services/api_Services.dart';
// import 'package:first_project/Services/model_class/chatmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Chartmsg extends GetxController {
//   // Common Loading state
//   var isLoading = false.obs;
//
//   // ==================== PART 1: CHAT DETAILS VARIABLES ====================
//   var messageList = <ChatMessage>[].obs;
//   final TextEditingController textController = TextEditingController();
//   WebSocketChannel? channel; // Nullable to avoid initialization error
//   late int conversationId;
//   String? token;
//   int? myUserId;
//
//   // ==================== PART 2: CHAT LIST VARIABLES (NEW) ====================
//   var conversationList = <dynamic>[].obs; // লিস্ট ডাটা রাখার জন্য
//
//   @override
//   void onInit() {
//     super.onInit();
//     // অ্যাপ চালু হলে ইউজার ডাটা লোড করে রাখা ভালো
//     loadUserData();
//   }
//
//   @override
//   void onClose() {
//     try {
//       if (channel != null) channel!.sink.close();
//     } catch (e) {
//       print("Channel close error: $e");
//     }
//     textController.dispose();
//     super.onClose();
//   }
//
//   // Common: Load user data
//   Future<void> loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     token = prefs.getString(
//       'access_token',
//     ); // Check if key is 'token' or 'access_token'
//     myUserId = prefs.getInt('user_id');
//     print("User Data Loaded. ID: $myUserId");
//   }
//
//   // ==================== PART 3: FETCH CHAT LIST (LIST SCREEN) ====================
//   // এই ফাংশনটি Chartdetels পেজে কল হবে
//   Future<void> fetchConversationList() async {
//     isLoading.value = true;
//     try {
//       await loadUserData(); // Ensure token is loaded
//       if (token == null) return;
//
//       final response = await http.get(
//         // ApiServices.conversationsBase ব্যবহার করা হয়েছে
//         Uri.parse(ApiServices.conversationsBase),
//         headers: {'Authorization': 'Bearer $token'},
//       );
//
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//
//         // API রেসপন্স হ্যান্ডেল করা
//         if (data is List) {
//           conversationList.value = data;
//         } else if (data['results'] != null) {
//           conversationList.value = data['results'];
//         }
//       } else {
//         print("List Fetch Failed: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error fetching list: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // ==================== PART 4: CHAT DETAILS LOGIC (DETAILS SCREEN) ====================
//
//   // Initialize specific chat room
//   Future<void> initChat(int convId) async {
//     conversationId = convId;
//     await loadUserData();
//
//     if (token != null && myUserId != null) {
//       fetchHistory();
//       connectSocket();
//       markAsRead();
//     } else {
//       Get.snackbar("Error", "Please login first!");
//     }
//   }
//
//   Future<void> fetchHistory() async {
//     isLoading.value = true;
//     try {
//       final response = await http.get(
//         Uri.parse(
//           '${ApiServices.baseUrl}/api/chat/messages/?conversation_id=$conversationId',
//         ),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         List<dynamic> results = data['results'] ?? [];
//         messageList.value = results
//             .map((e) => ChatMessage.fromJson(e))
//             .toList();
//       }
//     } catch (e) {
//       print("History Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void connectSocket() {
//     try {
//       final wsUrl = '${ApiServices.socketBaseUrl}/ws/chat/$conversationId/';
//       print("Connecting Socket: $wsUrl");
//
//       channel = IOWebSocketChannel.connect(
//         Uri.parse(wsUrl),
//         headers: {'Authorization': 'Bearer $token'},
//       );
//
//       channel!.stream.listen((message) {
//         print("New Message: $message");
//         try {
//           var json = jsonDecode(message);
//           messageList.insert(0, ChatMessage.fromJson(json));
//           messageList.refresh();
//         } catch (e) {
//           print("Parse Error: $e");
//         }
//       }, onError: (error) => print("Socket Error: $error"));
//     } catch (e) {
//       print("Connection Failed: $e");
//     }
//   }
//
//   Future<void> sendMessage() async {
//     String msgContent = textController.text.trim();
//     if (msgContent.isEmpty) return;
//     textController.clear();
//
//     try {
//       await http.post(
//         Uri.parse('${ApiServices.baseUrl}/api/chat/messages/'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'conversation': conversationId,
//           'content': msgContent,
//           'message_type': 'text',
//         }),
//       );
//     } catch (e) {
//       print("Send Error: $e");
//     }
//   }
//
//   Future<void> markAsRead() async {
//     try {
//       await http.post(
//         Uri.parse(
//           '${ApiServices.baseUrl}/api/chat/conversations/$conversationId/mark_read/',
//         ),
//         headers: {'Authorization': 'Bearer $token'},
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:web_socket_channel/io.dart'; // ❌ এটি বাদ দেওয়া হয়েছে
import 'package:web_socket_channel/web_socket_channel.dart'; // ✅ এটি ব্যবহার হবে
import 'package:shared_preferences/shared_preferences.dart';

// API services and models
import 'package:first_project/Services/api_Services/api_Services.dart';
import 'package:first_project/Services/model_class/chatmodel.dart';

class Chartmsg extends GetxController {
  // ==================== STATE VARIABLES ====================

  // Controls loading indicator in UI
  var isLoading = false.obs;

  // Conversation list (Inbox screen)
  var conversationList = <dynamic>[].obs;

  // Message list (Chat details screen)
  var messageList = <ChatMessage>[].obs;

  // Text input controller for sending message
  final TextEditingController textController = TextEditingController();

  // WebSocket channel (nullable)
  WebSocketChannel? channel;

  // Chat and user info
  late int conversationId;
  String? token;
  int? myUserId;

  @override
  void onInit() {
    super.onInit();
    // Load user data when controller starts
    loadUserData();
  }

  @override
  void onClose() {
    // Close socket safely and dispose controllers
    closeSocket();
    textController.dispose();
    super.onClose();
  }

  void closeSocket() {
    if (channel != null) {
      try {
        channel!.sink.close();
      } catch (e) {
        print("Channel close error: $e");
      }
    }
  }

  // ==================== LOAD USER DATA ====================
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    // Read token and user id from local storage
    token = prefs.getString('token');
    myUserId = prefs.getInt('user_id');

    print("User Loaded -> ID: $myUserId, Token: ${token != null}");
  }

  // ==================== 1. FETCH CONVERSATION LIST ====================
  // Used in inbox screen
  Future<void> fetchConversationList() async {
    isLoading.value = true;

    try {
      await loadUserData(); // Ensure token exists

      if (token == null) {
        print("Token is null");
        return;
      }

      final response = await http.get(
        Uri.parse(ApiServices.conversationsBase),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // Handle both list and paginated response
        if (data is List) {
          conversationList.value = data;
        } else if (data['results'] != null) {
          conversationList.value = data['results'];
        }
      } else {
        print("Conversation fetch failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Conversation error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ==================== 2. INIT CHAT ROOM ====================
  // Call when opening chat details screen
  Future<void> initChat(int convId) async {
    conversationId = convId;

    // Clear old messages for fresh load
    messageList.clear();

    // Close previous socket if exists
    closeSocket();

    await loadUserData();

    if (token != null && myUserId != null) {
      fetchHistory();   // Load old messages
      connectSocket();  // Start WebSocket
      markAsRead();     // Mark messages as read
    } else {
      Get.snackbar("Error", "Please login first!");
    }
  }

  // ==================== 3. FETCH MESSAGE HISTORY ====================
  Future<void> fetchHistory() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('${ApiServices.chatMessages}?conversation_id=$conversationId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<dynamic> results = data['results'] ?? [];

        // 🔥 FIX: UI তে reverse: true থাকার কারণে লিস্টটি উল্টে দেওয়া হয়েছে।
        // এতে লেটেস্ট মেসেজ লিস্টের শুরুতে (Index 0) চলে আসবে এবং স্ক্রিনের নিচে দেখাবে।
        messageList.value = results
            .map((e) => ChatMessage.fromJson(e))
            .toList()
            .reversed
            .toList();

      } else {
        print("History fetch failed: ${response.statusCode}");
      }
    } catch (e) {
      print("History exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ==================== 4. WEBSOCKET CONNECTION (UPDATED) ====================
  void connectSocket() {
    try {
      // 🔥 FIX: টোকেন headers এর বদলে URL এ পাঠানো হচ্ছে (Web সাপোর্ট এর জন্য)
      final wsUrl = '${ApiServices.socketBaseUrl}/ws/chat/$conversationId/?token=$token';
      print("Connecting to: $wsUrl");

      // 🔥 FIX: Universal WebSocketChannel ব্যবহার করা হয়েছে
      channel = WebSocketChannel.connect(Uri.parse(wsUrl));

      channel!.stream.listen((message) {
        try {
          print("New Socket Message: $message"); // Debug log
          var json = jsonDecode(message);

          // Add new message to top of list (যা UI তে নিচে দেখাবে)
          messageList.insert(0, ChatMessage.fromJson(json));
          messageList.refresh();
        } catch (e) {
          print("Message parse error: $e");
        }
      }, onError: (error) {
        print("Socket error: $error");
      });
    } catch (e) {
      print("Socket connection failed: $e");
    }
  }

  // ==================== 5. SEND MESSAGE ====================
  Future<void> sendMessage() async {
    String msgContent = textController.text.trim();
    if (msgContent.isEmpty) return;

    // Clear input field
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
        print("Message send failed: ${response.body}");
      }
    } catch (e) {
      print("Send message error: $e");
    }
  }

  // ==================== 6. MARK MESSAGES AS READ ====================
  Future<void> markAsRead() async {
    try {
      await http.post(
        Uri.parse('${ApiServices.conversationsBase}$conversationId/mark_read/'),
        headers: {'Authorization': 'Bearer $token'},
      );
    } catch (e) {
      print(e);
    }
  }
}
