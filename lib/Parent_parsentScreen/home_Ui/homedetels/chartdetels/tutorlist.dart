// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:first_project/Services/Controller_view/chartmsg.dart';
//
// class ChatConnectionTeacher extends StatefulWidget {
//   final int conversationId;
//   final String name;
//   final String image;
//
//   const ChatConnectionTeacher({super.key, required this.conversationId, required this.name, required this.image});
//
//   @override
//   State<ChatConnectionTeacher> createState() => _ChatConnectionTeacherState();
// }
//
// class _ChatConnectionTeacherState extends State<ChatConnectionTeacher> {
//   final Chartmsg controller = Get.put(Chartmsg());
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.initChat(widget.conversationId);
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
//         leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.black), onPressed: () => Get.back()),
//         title: Row(
//           children: [
//             CircleAvatar(radius: 18.r, backgroundImage: widget.image.isNotEmpty ? NetworkImage(widget.image) : const AssetImage("assets/backround/teacher.png") as ImageProvider),
//             SizedBox(width: 10.w),
//             Text(widget.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp)),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value) return const Center(child: CircularProgressIndicator());
//               return ListView.builder(
//                 padding: EdgeInsets.all(16.w),
//                 reverse: true,
//                 itemCount: controller.messageList.length,
//                 itemBuilder: (context, index) {
//                   final msg = controller.messageList[index];
//                   bool isMe = msg.senderId == controller.myUserId;
//                   return _buildBubble(msg.content, isMe);
//                 },
//               );
//             }),
//           ),
//           _buildInput(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBubble(String text, bool isMe) {
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: EdgeInsets.only(bottom: 10.h),
//         padding: EdgeInsets.all(12.w),
//         decoration: BoxDecoration(
//           color: isMe ? Colors.blue : Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         child: Text(text, style: TextStyle(color: isMe ? Colors.white : Colors.black)),
//       ),
//     );
//   }
//
//   Widget _buildInput() {
//     return Container(
//       padding: EdgeInsets.all(12.w),
//       child: Row(
//         children: [
//           Expanded(child: TextField(controller: controller.textController, decoration: const InputDecoration(hintText: "Message..."))),
//           IconButton(icon: const Icon(Icons.send, color: Colors.blue), onPressed: () => controller.sendMessage()),
//         ],
//       ),
//     );
//   }
// }