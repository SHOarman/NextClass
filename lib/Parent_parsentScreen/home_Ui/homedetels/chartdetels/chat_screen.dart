import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Services/Controller_view/inbox_controller.dart';
import '../../../../Services/model_class/chat_models.dart';
import '../../../profile_Screen/profileController/profile_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final InboxController controller = Get.put(InboxController());
  final ProfileController profileController = Get.put(ProfileController());
  final TextEditingController msgController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // InboxController's onInit handles arguments.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF1F5F9,
      ), // Light background like Messenger
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              // 1. Loading
              if (controller.isLoading.value && controller.messages.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              // 2. Empty State
              if (controller.messages.isEmpty) {
                return const Center(
                  child: Text(
                    "No messages yet. Say hi!",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              // 3. Message List
              return ListView.builder(
                controller: _scrollController,
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];

                  // Use InboxController's trusted currentUserId
                  return Obx(() {
                    final int myId = controller.currentUserId.value;
                    final bool isMe = (msg.sender == myId);

                    // Debug print to trace if alignment issue persists
                    if (index == 0) {
                      // Only log for the latest message to avoid spam
                      // debugPrint("MSG: ${msg.content}, Sender: ${msg.sender}, MyID: $myId, IsMe: $isMe");
                    }

                    return _buildMessageBubble(msg, isMe);
                  });
                },
              );
            }),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leadingWidth: 40.w,
      title: Row(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 18.r,
              backgroundImage: controller.userProfile.value.isNotEmpty
                  ? NetworkImage(controller.userProfile.value)
                  : null,
              child: controller.userProfile.value.isEmpty
                  ? const Icon(Icons.person)
                  : null,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    controller.userName.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    controller.isOtherUserTyping.value
                        ? "typing..."
                        : (controller.isConnected.value
                              ? "Online"
                              : "Connecting..."),
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: controller.isOtherUserTyping.value
                          ? Colors.green
                          : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessageModel msg, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min, // Wrap content width
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // if (!isMe) ...[
          //   CircleAvatar(
          //     radius: 12.r,
          //     backgroundImage: msg.senderDetails.profilePicture.isNotEmpty
          //         ? NetworkImage(msg.senderDetails.profilePicture)
          //         : null,
          //     child: msg.senderDetails.profilePicture.isEmpty
          //         ? Icon(Icons.person, size: 12.r)
          //         : null,
          //   ),
          //   SizedBox(width: 8.w),
          // ],
          Flexible(
            child: Column(
              crossAxisAlignment: isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 10.h,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  decoration: BoxDecoration(
                    color: isMe ? const Color(0xFF0084FF) : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.r),
                      topRight: Radius.circular(18.r),
                      bottomLeft: Radius.circular(isMe ? 18.r : 2.r),
                      bottomRight: Radius.circular(isMe ? 2.r : 18.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    msg.content,
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black87,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  DateFormat('hh:mm a').format(msg.createdAt),
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE2E8F0), width: 1)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: msgController,
                maxLines: 4,
                minLines: 1,
                onChanged: (val) =>
                    controller.sendTypingStatus(val.trim().isNotEmpty),
                decoration: InputDecoration(
                  hintText: "Aa",
                  filled: true,
                  fillColor: const Color(0xFFF1F5F9),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Obx(
              () => IconButton(
                icon: Icon(
                  Icons.send,
                  color: controller.isConnected.value
                      ? const Color(0xFF0084FF)
                      : Colors.grey,
                  size: 28.sp,
                ),
                onPressed: controller.isConnected.value ? _handleSend : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSend() {
    if (msgController.text.trim().isNotEmpty) {
      controller.sendMessage(msgController.text.trim());
      msgController.clear();
      controller.sendTypingStatus(false);
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    msgController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
