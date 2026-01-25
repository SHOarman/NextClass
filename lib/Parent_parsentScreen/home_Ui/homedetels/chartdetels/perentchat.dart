import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../Services/Controller_view/ChatListController.dart';

class Perentchat extends StatelessWidget {
  const Perentchat({super.key});

  // সময় ফরম্যাট করার ফাংশন
  String formatChatTime(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return "";
    try {
      DateTime dateTime =
          DateTime.tryParse(dateStr)?.toLocal() ?? DateTime.now();
      return DateFormat('hh:mm a').format(dateTime); // 03:45 PM
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final ChatListController controller = Get.put(ChatListController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Chat with tutor",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: const NavButton(selectIndex: 2),
      body: RefreshIndicator(
        onRefresh: () => controller.onRefresh(),
        child: Obx(() {
          if (controller.isLoading.value && controller.conversations.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          }

          if (controller.conversations.isEmpty) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                const Center(
                  child: Text(
                    "No conversations found",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ],
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: controller.conversations.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 1, color: Color(0xFFF1F1F1)),
            itemBuilder: (context, index) {
              final chat = controller.conversations[index];
              final String name = chat.otherUserName;
              final String profile = chat.otherUserProfile;
              final bool isUnread = chat.unreadCount > 0;

              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                onTap: () {
                  // Navigate with arguments
                  Get.toNamed(
                    AppRoute.chatScreen1,
                    arguments: {
                      'id': chat.id,
                      'name': name,
                      'profile': profile,
                    },
                  );
                },
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.blue.withValues(alpha: 0.1),
                  backgroundImage: profile.isNotEmpty
                      ? NetworkImage(profile)
                      : null,
                  child: profile.isEmpty
                      ? const Icon(Icons.person, color: Colors.blue)
                      : null,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: isUnread
                              ? FontWeight.bold
                              : FontWeight.w600,
                        ),
                      ),
                    ),
                    // Text(
                    //   formatChatTime(chat.createdAt),
                    //   style: TextStyle(
                    //     fontSize: 11,
                    //     color: isUnread ? Colors.blue : Colors.grey,
                    //     fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                    //   ),
                    // ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.lastMessageContent,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: isUnread ? Colors.black : Colors.grey[600],
                            fontWeight: isUnread
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      if (isUnread)
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            chat.unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
