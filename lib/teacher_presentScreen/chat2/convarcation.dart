//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'msg_controller.dart';
//
// class ConversationScreen extends StatefulWidget {
//   const ConversationScreen({super.key});
//
//   @override
//   State<ConversationScreen> createState() => _ConversationScreenState();
// }
//
// class _ConversationScreenState extends State<ConversationScreen> {
//   final ChatController chatController = Get.find<ChatController>();
//   final TextEditingController textController = TextEditingController();
//
//   late String convId, name, image;
//
//   @override
//   void initState() {
//     super.initState();
//     final args = Get.arguments ?? {};
//     convId = (args['conversationId'] ?? 0).toString();
//     name = args['name'] ?? "Tutor";
//     image = args['image'] ?? "";
//
//     if (convId != "0") {
//       chatController.loadChatHistory(convId);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Row(
//           children: [
//             CircleAvatar(radius: 16.r, backgroundImage: NetworkImage(image)),
//             SizedBox(width: 10.w),
//             Text(name, style: TextStyle(fontSize: 16.sp, color: Colors.black)),
//           ],
//         ),
//         backgroundColor: Colors.white, elevation: 0.5,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() => ListView.builder(
//               reverse: true,
//               padding: EdgeInsets.all(15.w),
//               itemCount: chatController.messages.length,
//               itemBuilder: (context, index) {
//                 final msg = chatController.messages[index];
//                 bool isMe = msg.senderId == chatController.myUserId;
//                 return _buildBubble(msg.content, isMe);
//               },
//             )),
//           ),
//           _buildInputArea(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBubble(String text, bool isMe) {
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 5.h),
//         padding: EdgeInsets.all(12.r),
//         decoration: BoxDecoration(
//           color: isMe ? const Color(0xff2563EB) : const Color(0xffF3F4F6),
//           borderRadius: BorderRadius.circular(15.r),
//         ),
//         child: Text(text, style: TextStyle(color: isMe ? Colors.white : Colors.black87)),
//       ),
//     );
//   }
//
//   Widget _buildInputArea() {
//     return Container(
//       padding: EdgeInsets.all(10.r),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: textController,
//               decoration: InputDecoration(hintText: "Type...", border: InputBorder.none),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.send, color: Color(0xff2563EB)),
//             onPressed: () {
//               chatController.sendMessage(textController.text.trim(), convId);
//               textController.clear();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }