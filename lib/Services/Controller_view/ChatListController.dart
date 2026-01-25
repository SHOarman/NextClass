import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model_class/chat_models.dart';
import 'package:first_project/Services/api_Services/api_Services.dart';

class ChatListController extends GetxController {
  var conversations = <ChatConversationModel>[].obs;
  var isLoading = false.obs;
  var hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchConversations();
  }

  Future<void> fetchConversations() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token == null) {
        hasError.value = true;
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
        List<dynamic> listData = [];

        if (decoded is Map) {
          listData = decoded['results'] ??
              decoded['data'] ??
              decoded['conversations'] ??
              [];
        } else if (decoded is List) {
          listData = decoded;
        }

        final parsedList = listData
            .map((e) => ChatConversationModel.fromJson(e))
            .toList();

        // ✅ sort latest message first
        parsedList.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

        conversations.assignAll(parsedList);
      } else {
        hasError.value = true;
        debugPrint(
            "Chat List API Error (${response.statusCode}): ${response.body}");
      }
    } catch (e) {
      hasError.value = true;
      debugPrint("Chat List Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> onRefresh() async {
    await fetchConversations();
  }

  void updateConversation(ChatConversationModel updatedChat) {
    final index = conversations.indexWhere((c) => c.id == updatedChat.id);

    if (index != -1) {
      conversations[index] = updatedChat;
    } else {
      conversations.insert(0, updatedChat);
    }

    conversations.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    conversations.refresh();
  }
}
