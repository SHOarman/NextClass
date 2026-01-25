import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'msg_controller.dart';
import '../../../../core/route/route.dart';

class ChatInboxScreen extends StatelessWidget {
  const ChatInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // কন্ট্রোলার খুঁজে বের করা বা ইনিশিয়ালাইজ করা
    final ChatController chatController = Get.put(ChatController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Messages",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Obx(() {
        // লোডিং স্টেট
        if (chatController.isLoading.value &&
            chatController.conversationList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // লিস্ট খালি থাকলে
        if (chatController.conversationList.isEmpty) {
          return Center(
            child: Text(
              "No conversations found",
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => chatController.fetchInbox(),
          child: ListView.separated(
            itemCount: chatController.conversationList.length,
            separatorBuilder: (context, index) =>
                Divider(height: 1, color: Colors.grey.shade100),
            itemBuilder: (context, index) {
              final chat = chatController.conversationList[index];
              final otherUser = chat.otherUser; // মডেল অনুযায়ী Map

              return ListTile(
                onTap: () {
                  // চ্যাট স্ক্রিনে যাওয়ার সময় ডাটা পাস
                  Get.toNamed(
                    AppRoute.convarcation,
                    arguments: {
                      'conversationId': chat.id,
                      'name': otherUser['full_name'] ?? "Tutor",
                      'image': otherUser['profile_picture'] ?? "",
                    },
                  );
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 5.h,
                ),
                leading: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage:
                      (otherUser['profile_picture'] != null &&
                          otherUser['profile_picture'] != "")
                      ? NetworkImage(otherUser['profile_picture'])
                      : const AssetImage("assets/placeholder.png")
                            as ImageProvider,
                ),
                title: Text(
                  otherUser['full_name'] ?? "Unknown",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                subtitle: Text(
                  chat.lastMessage ?? "Click to start chatting",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                ),
                trailing: Text(
                  chatController.formatTime(chat.updatedAt),
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
