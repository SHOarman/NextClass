import 'package:first_project/teacher_presentScreen/Chat2/convarcation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widget/nav_button/nav_button.dart';

class Chartdetels extends StatelessWidget {
  const Chartdetels({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for the chat list (Matches your design)
    final List<Map<String, dynamic>> chats = [
      {
        "name": "Tutor name",
        "msg": "Hi, How are you?",
        "time": "02:40 am",
        "isUnread": true, // Highlight this chat
        "img": "assets/backround/class4.png",
      },
      {
        "name": "Tutor name",
        "msg": "You do not give me the amount...",
        "time": "March 16",
        "isUnread": false,
        "img": "assets/backround/explor2.png",
      },
      {
        "name": "Tutor name",
        "msg": "It's going nice. What about you...",
        "time": "March 12",
        "isUnread": false,
        "img": "assets/backround/teacher.png",
      },
      {
        "name": "Tutor name",
        "msg": "thanks for your help!",
        "time": "11:20 pm",
        "isUnread": false,
        "img": "assets/backround/Rectangle 5040.png",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      // Top App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading:
            false, // Removes back button since it's a main tab
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "chat with parent",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
        ),
      ),

      // Main Body: List of chats
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        itemCount: chats.length,
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
        itemBuilder: (context, index) {
          final chat = chats[index];
          final bool isUnread = chat['isUnread'];

          return GestureDetector(
            // ... inside ListView builder ...
            onTap: () {
              // Use Get.to() instead of Get.toNamed()
              Get.to(
                () => ConversationScreen(),
                transition: Transition
                    .rightToLeft, // Optional: Makes it look like a chat app
                duration: const Duration(milliseconds: 300),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                // Greenish background if unread, Light Grey/White if read
                color: isUnread
                    ? const Color(0xFFF0FDF4)
                    : const Color(0xFFF9FAFB),
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
                            color: Colors.black87,
                            shadows: [
                              Shadow(
                                color: Color(
                                  0xff000000,
                                ).withValues(alpha: 0.12),
                                blurRadius: 19,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          chat['msg'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: isUnread ? Colors.black87 : Colors.grey,
                            fontWeight: isUnread
                                ? FontWeight.w500
                                : FontWeight.normal,
                            fontSize: 13.sp,
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
                      fontWeight: isUnread
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      // Your Navigation Button
      bottomNavigationBar: NavButton(selectIndex: 2),
    );
  }
}
