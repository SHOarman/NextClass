// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// // আপনার সঠিক ফাইল পাথ অনুযায়ী ইম্পোর্ট করুন
// import '../../../../Services/Controller_view/inbox_controller.dart';
// import '../../../../Services/model_class/chat_models.dart';
// import '../../Parent_parsentScreen/profile_Screen/profileController/profile_controller.dart';
//
// class Chat2 extends StatefulWidget {
//   const Chat2({super.key});
//
//   @override
//   State<Chat2> createState() => _Chat2ScreenState();
// }
//
// class _Chat2ScreenState extends State<Chat2> {
//   final InboxController controller = Get.put(InboxController());
//   final ProfileController profileController = Get.put(ProfileController());
//   final TextEditingController msgController = TextEditingController();
//
//   late final int conversationId;
//   late final String name;
//   late final String profile;
//   late final int myId;
//
//   @override
//   void initState() {
//     super.initState();
//     // arguments থেকে ডাটা রিসিভ করা
//     conversationId = Get.arguments['conversationId'];
//     name = Get.arguments['name'];
//     profile = Get.arguments['profile'];
//
//     // প্রোফাইল কন্ট্রোলার থেকে নিজের আইডি নেওয়া (ডিফল্ট ৪০)
//     myId = profileController.userId.value;
//
//     // চ্যাট এবং সকেট ইনিশিয়ালাইজ করা
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.initChat(conversationId);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF1F5F9), // হালকা ব্যাকগ্রাউন্ড
//       appBar: _buildAppBar(),
//       body: Column(
//         children: [
//           // ১. মেসেজ লিস্ট এরিয়া
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value && controller.messages.isEmpty) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               if (controller.messages.isEmpty) {
//                 return const Center(child: Text("No messages yet. Say hello!"));
//               }
//
//               return ListView.builder(
//                 padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
//                 reverse: true, // নতুন মেসেজ নিচে থাকার জন্য
//                 itemCount: controller.messages.length,
//                 itemBuilder: (context, index) {
//                   final msg = controller.messages[index];
//                   final isMe = msg.sender == myId;
//                   return _buildMessageBubble(msg, isMe);
//                 },
//               );
//             }),
//           ),
//
//           // ২. ইনপুট এরিয়া
//           _buildInputArea(),
//         ],
//       ),
//     );
//   }
//
//   // অ্যাপ বার ডিজাইন
//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0.5,
//       leadingWidth: 70,
//       titleSpacing: 0,
//       iconTheme: const IconThemeData(color: Colors.black),
//       title: Row(
//         children: [
//           CircleAvatar(
//             radius: 18.r,
//             backgroundImage: profile.isNotEmpty ? NetworkImage(profile) : null,
//             child: profile.isEmpty ? const Icon(Icons.person) : null,
//           ),
//           SizedBox(width: 10.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyle(
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Obx(
//                   () => Text(
//                     controller.isOtherUserTyping.value ? "typing..." : "Online",
//                     style: TextStyle(
//                       fontSize: 11.sp,
//                       color: controller.isOtherUserTyping.value
//                           ? Colors.green
//                           : Colors.grey,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // মেসেজ বাবল ডিজাইন
//   Widget _buildMessageBubble(ChatMessageModel msg, bool isMe) {
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Column(
//         crossAxisAlignment: isMe
//             ? CrossAxisAlignment.end
//             : CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
//             margin: EdgeInsets.only(top: 8.h, bottom: 2.h),
//             constraints: BoxConstraints(maxWidth: Get.width * 0.75),
//             decoration: BoxDecoration(
//               color: isMe ? Colors.blue : Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15.r),
//                 topRight: Radius.circular(15.r),
//                 bottomLeft: Radius.circular(isMe ? 15.r : 0),
//                 bottomRight: Radius.circular(isMe ? 0 : 15.r),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: 0.05),
//                   blurRadius: 2,
//                 ),
//               ],
//             ),
//             child: Text(
//               msg.content,
//               style: TextStyle(
//                 color: isMe ? Colors.white : Colors.black87,
//                 fontSize: 14.sp,
//               ),
//             ),
//           ),
//           Text(
//             DateFormat('hh:mm a').format(msg.createdAt),
//             style: TextStyle(fontSize: 9.sp, color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ইনপুট বক্স ডিজাইন
//   Widget _buildInputArea() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//       color: Colors.white,
//       child: SafeArea(
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: msgController,
//                 onChanged: (val) =>
//                     controller.sendTypingStatus(val.trim().isNotEmpty),
//                 decoration: InputDecoration(
//                   hintText: "Write a message...",
//                   fillColor: const Color(0xFFF3F4F6),
//                   filled: true,
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 20.w,
//                     vertical: 10.h,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30.r),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 8.w),
//             CircleAvatar(
//               backgroundColor: Colors.blue,
//               child: IconButton(
//                 icon: const Icon(Icons.send, color: Colors.white, size: 20),
//                 onPressed: () {
//                   if (msgController.text.trim().isNotEmpty) {
//                     controller.sendMessage(msgController.text.trim());
//                     msgController.clear();
//                     controller.sendTypingStatus(false);
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// সঠিক পাথগুলো নিশ্চিত করুন
import '../../../../Services/Controller_view/inbox_controller.dart';
import '../../../../Services/model_class/chat_models.dart';
import '../../Parent_parsentScreen/profile_Screen/profileController/profile_controller.dart';

class Chat2 extends StatefulWidget {
  const Chat2({super.key});

  @override
  State<Chat2> createState() => _Chat2ScreenState();
}

class _Chat2ScreenState extends State<Chat2> {
  // কন্ট্রোলার খুঁজে বের করা (Get.find ব্যবহার করা নিরাপদ)
  final InboxController controller = Get.put(InboxController());
  final ProfileController profileController = Get.put(ProfileController());
  final TextEditingController msgController = TextEditingController();

  late int conversationId;
  late String name;
  late String profile;

  @override
  void initState() {
    super.initState();
    // arguments থেকে ডাটা রিসিভ করা
    final dynamic args = Get.arguments;
    conversationId = args['conversationId'] ?? 0;
    name = args['name'] ?? "User";
    profile = args['profile'] ?? "";

    // চ্যাট এবং সকেট ইনিশিয়ালাইজ করা
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (conversationId != 0) {
        controller.initChat(conversationId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // ১. মেসেজ লিস্ট এরিয়া
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.messages.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.messages.isEmpty) {
                return const Center(child: Text("No messages yet. Say hello!"));
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
                reverse: true, // নতুন মেসেজ নিচে থাকার জন্য
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];

                  // ✅ সঠিক সাইড নির্ধারণের জন্য Obx লজিক
                  return Obx(() {
                    final int currentUserId = profileController.userId.value;
                    final bool isMe = msg.sender == currentUserId;
                    return _buildMessageBubble(msg, isMe);
                  });
                },
              );
            }),
          ),

          // ২. ইনপুট এরিয়া (ওভারফ্লো ফিক্সড)
          _buildInputArea(),
        ],
      ),
    );
  }

  // অ্যাপ বার ডিজাইন
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leadingWidth: 70,
      titleSpacing: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Row(
        children: [
          CircleAvatar(
            radius: 18.r,
            backgroundImage: profile.isNotEmpty ? NetworkImage(profile) : null,
            child: profile.isEmpty ? const Icon(Icons.person) : null,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Obx(
                  () => Text(
                    controller.isOtherUserTyping.value ? "typing..." : "Online",
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

  // মেসেজ বাবল ডিজাইন
  Widget _buildMessageBubble(ChatMessageModel msg, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            margin: EdgeInsets.only(top: 8.h, bottom: 2.h),
            constraints: BoxConstraints(maxWidth: Get.width * 0.75),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
                bottomLeft: Radius.circular(isMe ? 15.r : 0),
                bottomRight: Radius.circular(isMe ? 0 : 15.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Text(
              msg.content,
              softWrap: true, // লম্বা টেক্সট নিচে পাঠানোর জন্য
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 14.sp,
              ),
            ),
          ),
          Text(
            DateFormat('hh:mm a').format(msg.createdAt),
            style: TextStyle(fontSize: 9.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ইনপুট বক্স ডিজাইন (মাল্টিলাইন সাপোর্ট ও এরর ফিক্সড)
  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      color: Colors.white,
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: TextField(
                controller: msgController,
                maxLines: 4,
                minLines: 1,
                onChanged: (val) =>
                    controller.sendTypingStatus(val.trim().isNotEmpty),
                decoration: InputDecoration(
                  hintText: "Write a message...",
                  fillColor: const Color(0xFFF3F4F6),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Obx(
              () => CircleAvatar(
                backgroundColor: controller.isConnected.value
                    ? Colors.blue
                    : Colors.grey,
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white, size: 20),
                  onPressed: controller.isConnected.value
                      ? () {
                          if (msgController.text.trim().isNotEmpty) {
                            controller.sendMessage(msgController.text.trim());
                            msgController.clear();
                            controller.sendTypingStatus(false);
                          }
                        }
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
