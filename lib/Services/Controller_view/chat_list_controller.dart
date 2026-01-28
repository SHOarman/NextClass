import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Parent_parsentScreen/profile_Screen/profileController/profile_controller.dart';
import '../model_class/chat_models.dart';
import '../api_Services/api_Services.dart';

class ChatListController extends GetxController {
  //==================== STATE VARIABLES ====================
  var conversations = <ChatConversationModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // ইনিশিয়াল চেক: প্রোফাইল কন্ট্রোলার মেমোরিতে না থাকলে তৈরি করে নেওয়া
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }
    fetchConversations();
  }

  // ১. সম্পূর্ণ চ্যাট লিস্ট সার্ভার থেকে নিয়ে আসা (HTTP GET)
  Future<void> fetchConversations() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null) {
        debugPrint("❌ Token not found!");
        return;
      }

      final response = await http.get(
        Uri.parse(ApiServices.conversationsBase),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        // results কী যদি নাল হয় তবে খালি লিস্ট পাঠানো
        List<dynamic> listData = decoded['results'] ?? [];

        final profileController = Get.find<ProfileController>();
        final int myId = profileController.userId.value;

        final parsedList = listData
            .map((e) => ChatConversationModel.fromJson(e, currentUserId: myId))
            .toList();

        _sortConversations(parsedList);
        conversations.assignAll(parsedList);

        debugPrint("📥 Inbox Loaded: ${conversations.length} conversations.");
      } else {
        debugPrint("❌ Server Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("❌ Fetch Conversations Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ২. সকেট থেকে মেসেজ আসলে ইনবক্স লিস্ট রিয়েল-টাইম আপডেট করা
  void updateConversationFromSocket(ChatMessageModel newMessage, int convId) {
    try {
      final profileController = Get.find<ProfileController>();
      final int myId = profileController.userId.value;

      final index = conversations.indexWhere((c) => c.id == convId);

      if (index != -1) {
        final oldConv = conversations[index];

        // নতুন ডাটা দিয়ে চ্যাট অবজেক্ট আপডেট
        final updatedConv = ChatConversationModel(
          id: oldConv.id,
          otherUser: oldConv.otherUser,
          lastMessage: newMessage.content,
          // নিজের পাঠানো মেসেজ না হলে আনরিড কাউন্ট ১ বাড়ানো
          unreadCount: (newMessage.sender != myId)
              ? oldConv.unreadCount + 1
              : oldConv.unreadCount,
          updatedAt: newMessage.createdAt,
        );

        // লিস্ট থেকে পুরাতন পজিশন সরিয়ে সবার উপরে বসানো
        conversations.removeAt(index);
        conversations.insert(0, updatedConv);

        // পুনরায় সর্টিং নিশ্চিত করা
        _sortConversations(conversations);
        conversations.refresh();

        debugPrint("🚀 Inbox Updated: Conv ID $convId moved to top.");
      } else {
        // নতুন কনভারসেশন হলে পুরো লিস্ট রিফ্রেশ
        fetchConversations();
      }
    } catch (e) {
      debugPrint("❌ Socket Update Error: $e");
    }
  }

  // ৩. সর্টিং হেল্পার
  void _sortConversations(List<ChatConversationModel> list) {
    list.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  // ৪. সময় ফরম্যাট করার মেথড
  String formatTime(DateTime? date) {
    if (date == null) return "";
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays > 7) return "${date.day}/${date.month}/${date.year}";
    if (diff.inDays > 0) return "${diff.inDays}d ago";
    if (diff.inHours > 0) return "${diff.inHours}h ago";
    if (diff.inMinutes > 0) return "${diff.inMinutes}m ago";
    return "Just now";
  }

  Future<void> onRefresh() async => await fetchConversations();
}