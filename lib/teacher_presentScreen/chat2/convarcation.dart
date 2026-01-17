// // import 'package:first_project/teacher_presentScreen/chat2/msg_controller.dart';
// // import 'package:first_project/teacher_presentScreen/chat2/msgmodel.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';
// //
// // class ConversationScreen extends StatelessWidget {
// //   ConversationScreen({super.key});
// //
// //   // Initialize the controller
// //   final ChatController chatControllerInstance = Get.put(ChatController());
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0.5,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.sp),
// //           onPressed: () => Get.back(),
// //         ),
// //         titleSpacing: 0,
// //         title: Row(
// //           children: [
// //             Image.asset('assets/backround/Frame 91.png', height: 32, width: 32),
// //
// //             SizedBox(width: 10.w),
// //             Text(
// //               "Tutor name",
// //               style: TextStyle(
// //                 color: Colors.black,
// //                 fontSize: 16.sp,
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //           ],
// //         ),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.more_vert, color: Colors.blue),
// //             onPressed: () {
// //               // Show the "More" modal from the design
// //               _showMoreModal(context);
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           // chat Message List
// //           Expanded(
// //             child: Obx(() {
// //               return ListView.builder(
// //                 padding: EdgeInsets.all(16.w),
// //                 itemCount: chatControllerInstance.messages.length,
// //                 itemBuilder: (context, index) {
// //                   final msg = chatControllerInstance.messages[index];
// //                   bool isMe = msg.senderId == 'me';
// //
// //                   return _buildMessageBubble(msg, isMe);
// //                 },
// //               );
// //             }),
// //           ),
// //
// //           // Input Field Area
// //           _buildInputArea(),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Widget for individual message bubbles
// //   Widget _buildMessageBubble(MessageModel msg, bool isMe) {
// //     return Padding(
// //       padding: EdgeInsets.only(bottom: 12.h),
// //       child: Row(
// //         mainAxisAlignment: isMe
// //             ? MainAxisAlignment.end
// //             : MainAxisAlignment.start,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           if (!isMe) ...[
// //             CircleAvatar(
// //               radius: 20, // This will define the radius of the circle
// //               backgroundColor:
// //                   Colors.white, // Background color of the CircleAvatar
// //               child: ClipOval(
// //                 // This ensures the image inside the circle is clipped to a perfect circle
// //                 child: Image.asset(
// //                   'assets/backround/Frame 91.png',
// //                   fit: BoxFit
// //                       .cover, // Ensures the image covers the circular area
// //                 ),
// //               ),
// //             ),
// //
// //             // CircleAvatar(
// //             //   radius: 12.r,
// //             //   backgroundImage: const NetworkImage("https://i.pravatar.cc/150?img=12"),
// //             // ),
// //             SizedBox(width: 8.w),
// //           ],
// //           Flexible(
// //             child: Container(
// //               padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
// //               decoration: BoxDecoration(
// //                 color: isMe
// //                     ? const Color(0xFF2563EB)
// //                     : const Color(0xFFF3F4F6), // Blue for me, Grey for others
// //                 borderRadius: BorderRadius.only(
// //                   topLeft: Radius.circular(12.r),
// //                   topRight: Radius.circular(12.r),
// //                   bottomLeft: isMe ? Radius.circular(12.r) : Radius.zero,
// //                   bottomRight: isMe ? Radius.zero : Radius.circular(12.r),
// //                 ),
// //               ),
// //               child: Text(
// //                 msg.message,
// //                 style: TextStyle(
// //                   color: isMe ? Colors.white : Colors.black87,
// //                   fontSize: 14.sp,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Widget for the text input area
// //   Widget _buildInputArea() {
// //     return Container(
// //       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
// //       color: Colors.white,
// //       child: Row(
// //         children: [
// //           Expanded(
// //             child: Container(
// //               height: 45.h,
// //               decoration: BoxDecoration(
// //                 color: const Color(0xFFF9FAFB),
// //                 borderRadius: BorderRadius.circular(24.r),
// //               ),
// //               child: TextField(
// //                 controller: chatControllerInstance.msgController,
// //                 decoration: InputDecoration(
// //                   hintText: "Write a message...",
// //                   hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
// //                   border: InputBorder.none,
// //                   contentPadding: EdgeInsets.symmetric(
// //                     horizontal: 16.w,
// //                     vertical: 8.h,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           SizedBox(width: 10.w),
// //           GestureDetector(
// //             onTap: chatControllerInstance.sendMessage,
// //             child: Icon(
// //               Icons.send,
// //               color: const Color(0xFF2563EB),
// //               size: 28.sp,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Popup Modal for options (Delete, Report, Block)
// //   void _showMoreModal(BuildContext context) {
// //     Get.dialog(
// //       Align(
// //         alignment: Alignment.topRight,
// //         child: Container(
// //           width: 150.w,
// //           margin: EdgeInsets.only(top: 60.h, right: 10.w),
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.circular(8.r),
// //             boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
// //           ),
// //           child: Material(
// //             color: Colors.transparent,
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 ListTile(
// //                   title: Text("Delete", style: TextStyle(fontSize: 12.sp)),
// //                   onTap: () {},
// //                 ),
// //                 ListTile(
// //                   title: Text("Report", style: TextStyle(fontSize: 12.sp)),
// //                   onTap: () {},
// //                 ),
// //                 ListTile(
// //                   title: Text("Block", style: TextStyle(fontSize: 12.sp)),
// //                   onTap: () {},
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// // Check your import paths
// import 'package:first_project/Services/Controller_view/chartmsg.dart';
// import 'package:first_project/Services/model_class/chatmodel.dart';
//
// class ConversationScreen extends StatefulWidget {
//   final int conversationId;
//   final String name;
//   final String image;
//
//   const ConversationScreen({
//     super.key,
//     required this.conversationId,
//     required this.name,
//     required this.image,
//   });
//
//   @override
//   State<ConversationScreen> createState() => _ConversationScreenState();
// }
//
// class _ConversationScreenState extends State<ConversationScreen> {
//   // Find the existing controller initialized in Chat2
//   final Chartmsg controller = Get.find<Chartmsg>();
//
//   @override
//   void initState() {
//     super.initState();
//     // Connect to specific chat room
//     controller.initChat(widget.conversationId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.sp),
//           onPressed: () => Get.back(),
//         ),
//         titleSpacing: 0,
//         title: Row(
//           children: [
//             CircleAvatar(
//               radius: 16.r,
//               backgroundColor: Colors.grey.shade200,
//               backgroundImage: (widget.image.isNotEmpty)
//                   ? NetworkImage(widget.image)
//                   : const AssetImage('assets/backround/Frame 91.png') as ImageProvider,
//             ),
//             SizedBox(width: 10.w),
//             Text(
//               widget.name,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.more_vert, color: Colors.blue),
//             onPressed: () => _showMoreModal(context),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Chat Message List
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               if (controller.messageList.isEmpty) {
//                 return const Center(child: Text("Say Hello!"));
//               }
//
//               return ListView.builder(
//                 padding: EdgeInsets.all(16.w),
//                 reverse: true, // Start from bottom
//                 itemCount: controller.messageList.length,
//                 itemBuilder: (context, index) {
//                   final msg = controller.messageList[index];
//                   // Check if message is mine using user_id from token
//                   bool isMe = msg.senderId == controller.myUserId;
//                   return _buildMessageBubble(msg, isMe);
//                 },
//               );
//             }),
//           ),
//
//           // Input Field Area
//           _buildInputArea(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMessageBubble(ChatMessage msg, bool isMe) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12.h),
//       child: Row(
//         mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (!isMe) ...[
//             CircleAvatar(
//               radius: 20.r,
//               backgroundColor: Colors.white,
//               child: ClipOval(
//                 child: (widget.image.isNotEmpty)
//                     ? Image.network(
//                   widget.image,
//                   fit: BoxFit.cover,
//                   width: 40.r,
//                   height: 40.r,
//                   errorBuilder: (c,e,s) => Image.asset('assets/backround/Frame 91.png'),
//                 )
//                     : Image.asset(
//                   'assets/backround/Frame 91.png',
//                   fit: BoxFit.cover,
//                   width: 40.r,
//                   height: 40.r,
//                 ),
//               ),
//             ),
//             SizedBox(width: 8.w),
//           ],
//           Flexible(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
//               decoration: BoxDecoration(
//                 color: isMe ? const Color(0xFF2563EB) : const Color(0xFFF3F4F6),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(12.r),
//                   topRight: Radius.circular(12.r),
//                   bottomLeft: isMe ? Radius.circular(12.r) : Radius.zero,
//                   bottomRight: isMe ? Radius.zero : Radius.circular(12.r),
//                 ),
//               ),
//               child: Text(
//                 msg.content, // Using 'content' from model
//                 style: TextStyle(
//                   color: isMe ? Colors.white : Colors.black87,
//                   fontSize: 14.sp,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInputArea() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//       color: Colors.white,
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               height: 45.h,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF9FAFB),
//                 borderRadius: BorderRadius.circular(24.r),
//               ),
//               child: TextField(
//                 controller: controller.textController,
//                 decoration: InputDecoration(
//                   hintText: "Write a message...",
//                   hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 10.w),
//           GestureDetector(
//             onTap: controller.sendMessage,
//             child: Icon(Icons.send, color: const Color(0xFF2563EB), size: 28.sp),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showMoreModal(BuildContext context) {
//     Get.dialog(
//       Align(
//         alignment: Alignment.topRight,
//         child: Container(
//           width: 150.w,
//           margin: EdgeInsets.only(top: 60.h, right: 10.w),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8.r),
//             boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
//           ),
//           child: Material(
//             color: Colors.transparent,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(title: Text("Delete", style: TextStyle(fontSize: 12.sp)), onTap: () {}),
//                 ListTile(title: Text("Report", style: TextStyle(fontSize: 12.sp)), onTap: () {}),
//                 ListTile(title: Text("Block", style: TextStyle(fontSize: 12.sp)), onTap: () {}),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:first_project/Services/Controller_view/chartmsg.dart';
import 'package:first_project/Services/model_class/chatmodel.dart';

class ConversationScreen extends StatefulWidget {
  final int conversationId;
  final String name;
  final String image;

  const ConversationScreen({
    super.key,
    required this.conversationId,
    required this.name,
    required this.image,
  });

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final Chartmsg controller = Get.find<Chartmsg>();

  @override
  void initState() {
    super.initState();
    if(widget.conversationId != 0) {
      controller.initChat(widget.conversationId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.sp),
          onPressed: () => Get.back(),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16.r,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: (widget.image.isNotEmpty)
                  ? NetworkImage(widget.image) as ImageProvider
                  : const AssetImage('assets/backround/Frame 91.png'),
            ),
            SizedBox(width: 10.w),
            Text(
              widget.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // ================= CHAT LIST =================
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              // মেসেজ লিস্ট
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                // 🔥 REVERSE TRUE: এর মানে লিস্ট নিচ থেকে শুরু হবে (Index 0 = Bottom)
                reverse: true,
                itemCount: controller.messageList.length,
                itemBuilder: (context, index) {
                  final msg = controller.messageList[index];
                  bool isMe = msg.senderId == controller.myUserId;
                  return _buildMessageBubble(msg, isMe);
                },
              );
            }),
          ),

          // ================= INPUT FIELD =================
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage msg, bool isMe) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // অপর পাশের ইউজারের ছবি (বাম পাশে)
          if (!isMe) ...[
            CircleAvatar(
              radius: 14.r,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: (widget.image.isNotEmpty)
                  ? NetworkImage(widget.image) as ImageProvider
                  : const AssetImage('assets/backround/Frame 91.png'),
            ),
            SizedBox(width: 8.w),
          ],

          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                // Color Logic: আমি পাঠালে নীল, অন্য কেউ পাঠালে সাদা/ধূসর
                color: isMe ? const Color(0xFF2563EB) : const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                  bottomLeft: isMe ? Radius.circular(12.r) : Radius.zero,
                  bottomRight: isMe ? Radius.zero : Radius.circular(12.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    msg.content,
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black87,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  // টাইম ফরম্যাট
                  Text(
                    _formatTime(msg.createdAt),
                    style: TextStyle(
                      color: isMe ? Colors.white70 : Colors.black38,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: TextField(
                controller: controller.textController,
                decoration: InputDecoration(
                  hintText: "Write a message...",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: controller.sendMessage,
            child: Icon(Icons.send, color: const Color(0xFF2563EB), size: 28.sp),
          ),
        ],
      ),
    );
  }

  String _formatTime(String time) {
    if (time.isEmpty) return "";
    try {
      final dt = DateTime.parse(time).toLocal();
      return DateFormat('hh:mm a').format(dt);
    } catch (e) { return ""; }
  }
}





