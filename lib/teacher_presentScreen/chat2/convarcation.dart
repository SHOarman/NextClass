import 'package:first_project/teacher_presentScreen/chat2/msgController.dart';
import 'package:first_project/teacher_presentScreen/chat2/msgmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConversationScreen extends StatelessWidget {
  ConversationScreen({super.key});

  // Initialize the controller
  final ChatController chatController = Get.put(ChatController());

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
            Image.asset('assets/backround/Frame 91.png',height: 32,width: 32,),

            SizedBox(width: 10.w),
            Text(
              "Tutor name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.blue),
            onPressed: () {
              // Show the "More" modal from the design
              _showMoreModal(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat Message List
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final msg = chatController.messages[index];
                  bool isMe = msg.senderId == 'me';

                  return _buildMessageBubble(msg, isMe);
                },
              );
            }),
          ),

          // Input Field Area
          _buildInputArea(),
        ],
      ),
    );
  }

  // Widget for individual message bubbles
  Widget _buildMessageBubble(MessageModel msg, bool isMe) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe) ...[

        CircleAvatar(
        radius: 20, // This will define the radius of the circle
        backgroundColor: Colors.white, // Background color of the CircleAvatar
        child: ClipOval( // This ensures the image inside the circle is clipped to a perfect circle
          child: Image.asset(
            'assets/backround/Frame 91.png',
            fit: BoxFit.cover, // Ensures the image covers the circular area
          ),)),

        // CircleAvatar(
            //   radius: 12.r,
            //   backgroundImage: const NetworkImage("https://i.pravatar.cc/150?img=12"),
            // ),
            SizedBox(width: 8.w),
          ],
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isMe ? const Color(0xFF2563EB) : const Color(0xFFF3F4F6), // Blue for me, Grey for others
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                  bottomLeft: isMe ? Radius.circular(12.r) : Radius.zero,
                  bottomRight: isMe ? Radius.zero : Radius.circular(12.r),
                ),
              ),
              child: Text(
                msg.message,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black87,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for the text input area
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
                controller: chatController.msgController,
                decoration: InputDecoration(
                  hintText: "Write a message...",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: chatController.sendMessage,
            child: Icon(Icons.send, color: const Color(0xFF2563EB), size: 28.sp),
          ),
        ],
      ),
    );
  }

  // Popup Modal for options (Delete, Report, Block)
  void _showMoreModal(BuildContext context) {
    Get.dialog(
      Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 150.w,
          margin: EdgeInsets.only(top: 60.h, right: 10.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(title: Text("Delete", style: TextStyle(fontSize: 12.sp)), onTap: (){}),
                ListTile(title: Text("Report", style: TextStyle(fontSize: 12.sp)), onTap: (){}),
                ListTile(title: Text("Block", style: TextStyle(fontSize: 12.sp)), onTap: (){}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}