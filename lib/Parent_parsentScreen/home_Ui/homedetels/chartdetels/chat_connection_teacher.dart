// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:first_project/Services/model_class/chatmodel.dart';
// import 'package:first_project/Services/model_class/usershow_model.dart';
// import 'chat_controller_teacher.dart';
//
// class ChatConnectionTeacher extends StatefulWidget {
//   final int conversationId;
//   final String name;
//   final String image;
//
//   const ChatConnectionTeacher({
//     super.key,
//     required this.conversationId,
//     required this.name,
//     required this.image,
//   });
//
//   @override
//   State<ChatConnectionTeacher> createState() => _ChatConnectionTeacherState();
// }
//
// class _ChatConnectionTeacherState extends State<ChatConnectionTeacher> {
//   final ChatControllerTeacher controller = Get.put(ChatControllerTeacher());
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       int activeId = widget.conversationId;
//       // যদি আইডি ০ থাকে তবে আর্গুমেন্ট থেকে চেক করা
//       if (activeId == 0 && Get.arguments != null) {
//         if (Get.arguments is Map) {
//           activeId = Get.arguments['conversationId'] ?? 0;
//         }
//       }
//       controller.initChat(activeId); //
//     });
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
//           icon: Icon(Icons.arrow_back_ios, color: Colors.blue, size: 20.sp),
//           onPressed: () => Get.back(),
//         ),
//         title: Row(
//           children: [
//             CircleAvatar(
//               radius: 18.r,
//               backgroundImage: widget.image.isNotEmpty
//                   ? NetworkImage(widget.image)
//                   : const AssetImage("assets/backround/teacher.png") as ImageProvider,
//             ),
//             SizedBox(width: 10.w),
//             Text(widget.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp)),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value && controller.messageList.isEmpty) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               return ListView.builder(
//                 padding: EdgeInsets.all(16.w),
//                 reverse: true, // নতুন মেসেজ নিচে রাখার জন্য
//                 itemCount: controller.messageList.length,
//                 itemBuilder: (context, index) {
//                   final msg = controller.messageList[index];
//                   bool isMe = msg.senderId == controller.myUserId;
//                   return _buildMessageBubble(msg, isMe);
//                 },
//               );
//             }),
//           ),
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
//         children: [
//           Flexible(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
//               decoration: BoxDecoration(
//                 color: isMe ? const Color(0xFF2563EB) : const Color(0xFFF3F4F6),
//                 borderRadius: BorderRadius.circular(15.r),
//               ),
//               child: Text(
//                 msg.content,
//                 style: TextStyle(color: isMe ? Colors.white : Colors.black87, fontSize: 14.sp),
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
//       decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.grey.shade200))),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: controller.textController,
//               decoration: const InputDecoration(hintText: "Write a message...", border: InputBorder.none),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.send, color: Color(0xFF2563EB)),
//             onPressed: () {
//               final args = Get.arguments;
//               // প্রোফাইল থেকে আসলে receiverId দিয়ে পাঠানো
//               if (controller.conversationId == 0) {
//                 if (args is TutorDetails) {
//                   controller.sendMessage(receiverId: args.id);
//                 } else if (args is Map) {
//                   controller.sendMessage(receiverId: args['id']);
//                 }
//               } else {
//                 controller.sendMessage();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }