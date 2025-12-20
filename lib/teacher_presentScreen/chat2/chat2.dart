import 'package:first_project/teacher_presentScreen/chat2/convarcation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../techerall_widget/nevbutton/nevbutton.dart';

class Chat2 extends StatelessWidget {
  const Chat2({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for the chat list (Matches your design)
    final List<Map<String, dynamic>> chats = [
      {
        "name": "Tutor name",
        "msg": "Hi, How are you?",
        "time": "02:40 am",
        "isUnread": true, // Highlight this chat
        "img": "assets/backround/explor4.png"
      },
      {
        "name": "Tutor name",
        "msg": "You do not give me the amount...",
        "time": "March 16",
        "isUnread": false,
        "img": "assets/backround/Frame 91.png"
      },
      {
        "name": "Tutor name",
        "msg": "It's going nice. What about you...",
        "time": "March 12",
        "isUnread": false,
        "img": "assets/backround/explor5.png"
      },
      {
        "name": "Tutor name",
        "msg": "thanks for your help!",
        "time": "11:20 pm",
        "isUnread": false,
        "img": "assets/backround/explor6.png"
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      // Top App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Removes back button since it's a main tab
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Chat with tutor",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp
            ),
          ),
        ),
      ),

      // Main Body: List of Chats
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        itemCount: chats.length,
        separatorBuilder: (_, __) => SizedBox(height: 10.h),
        itemBuilder: (context, index) {
          final chat = chats[index];
          final bool isUnread = chat['isUnread'];

          return GestureDetector(
            // ... inside ListView builder ...
              onTap: () {
                // Use Get.to() instead of Get.toNamed()
                Get.to(
                      () => ConversationScreen(),
                  transition: Transition.rightToLeft, // Optional: Makes it look like a chat app
                  duration: const Duration(milliseconds: 300),
                );
              },
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                // Greenish background if unread, Light Grey/White if read
                color: isUnread ? const Color(0xFFF0FDF4) : const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: NetworkImage(chat['img']),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  SizedBox(width: 12.w),

                  // Name and Message
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Colors.black87
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          chat['msg'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: isUnread ? Colors.black87 : Colors.grey,
                              fontWeight: isUnread ? FontWeight.w500 : FontWeight.normal,
                              fontSize: 13.sp
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Time
                  Text(
                    chat['time'],
                    style: TextStyle(
                        color: isUnread ? Colors.green : Colors.grey,
                        fontSize: 11.sp,
                        fontWeight: isUnread ? FontWeight.bold : FontWeight.normal
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      // Your Navigation Button
      bottomNavigationBar: Nev_Button2(SelectIndex: 3),
    );
  }
}