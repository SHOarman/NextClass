// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'chat_controller_teacher.dart';
// import 'chat_screen.dart';
// import '../../../../Services/model_class/chat_models.dart';
//
// class ChatInboxScreen extends StatefulWidget {
//   const ChatInboxScreen({super.key});
//
//   @override
//   State<ChatInboxScreen> createState() => _ChatInboxScreenState();
// }
//
// class _ChatInboxScreenState extends State<ChatInboxScreen> {
//   final ChatController controller = Get.put(ChatController());
//
//   @override
//   void initState() {
//     super.initState();
//     controller.fetchInbox();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "Inbox",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value && controller.inboxList.isEmpty) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         if (controller.inboxList.isEmpty) {
//           return Center(
//             child: Text(
//               "No conversations yet",
//               style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//             ),
//           );
//         }
//
//         return ListView.builder(
//           itemCount: controller.inboxList.length,
//           padding: EdgeInsets.symmetric(vertical: 10.h),
//           itemBuilder: (context, index) {
//             final conversation = controller.inboxList[index];
//             return _buildConversationItem(conversation);
//           },
//         );
//       }),
//     );
//   }
//
//   Widget _buildConversationItem(ConversationModel conversation) {
//     return InkWell(
//       onTap: () {
//         // Navigate to Chat Screen
//         Get.to(
//           () => const ConversationScreen(),
//           arguments: [
//             conversation.id,
//             conversation.otherUser.name,
//             conversation.otherUser.profilePicture ?? "",
//           ],
//         );
//         // Also trigger room entry
//         controller.enterChatRoom(conversation.id);
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//         child: Row(
//           children: [
//             // Profile Picture
//             Stack(
//               children: [
//                 CircleAvatar(
//                   radius: 25.r,
//                   backgroundColor: Colors.grey.shade200,
//                   backgroundImage:
//                       (conversation.otherUser.profilePicture != null &&
//                           conversation.otherUser.profilePicture!.isNotEmpty)
//                       ? NetworkImage(conversation.otherUser.profilePicture!)
//                       : const AssetImage("assets/backround/teacher.png")
//                             as ImageProvider,
//                 ),
//                 // Online/Status indicator could go here
//               ],
//             ),
//             SizedBox(width: 12.w),
//
//             // Text Content
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         conversation.otherUser.name,
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Text(
//                         _formatTime(conversation.updatedAt),
//                         style: TextStyle(fontSize: 12.sp, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 4.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           conversation.lastMessage,
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                             color: conversation.unreadCount > 0
//                                 ? Colors.black
//                                 : Colors.grey.shade600,
//                             fontWeight: conversation.unreadCount > 0
//                                 ? FontWeight.w600
//                                 : FontWeight.normal,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       if (conversation.unreadCount > 0)
//                         Container(
//                           padding: EdgeInsets.all(6.w),
//                           decoration: const BoxDecoration(
//                             color: Colors.blue,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Text(
//                             "${conversation.unreadCount}",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 10.sp,
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   String _formatTime(DateTime time) {
//     // Simple time formatting
//     final now = DateTime.now();
//     if (now.day == time.day &&
//         now.month == time.month &&
//         now.year == time.year) {
//       return "${time.hour}:${time.minute.toString().padLeft(2, '0')}";
//     }
//     return "${time.day}/${time.month}";
//   }
// }
