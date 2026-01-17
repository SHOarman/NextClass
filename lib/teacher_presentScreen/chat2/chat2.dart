// import 'package:first_project/teacher_presentScreen/Chat2/convarcation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../techerall_widget/nav_button/nav_button.dart';
//
// class Chat2 extends StatelessWidget {
//   const Chat2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Dummy data for the chat list (Matches your design)
//     final List<Map<String, dynamic>> chats = [
//       {
//         "name": "Tutor name",
//         "msg": "Hi, How are you?",
//         "time": "02:40 am",
//         "isUnread": true, // Highlight this chat
//         "img": "assets/backround/explor4.png",
//       },
//       {
//         "name": "Tutor name",
//         "msg": "You do not give me the amount...",
//         "time": "March 16",
//         "isUnread": false,
//         "img": "assets/backround/Frame 91.png",
//       },
//       {
//         "name": "Tutor name",
//         "msg": "It's going nice. What about you...",
//         "time": "March 12",
//         "isUnread": false,
//         "img": "assets/backround/explor5.png",
//       },
//       {
//         "name": "Tutor name",
//         "msg": "thanks for your help!",
//         "time": "11:20 pm",
//         "isUnread": false,
//         "img": "assets/backround/explor6.png",
//       },
//     ];
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       // Top App Bar
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading:
//             false, // Removes back button since it's a main tab
//         title: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             "chat with tutor",
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 22.sp,
//             ),
//           ),
//         ),
//       ),
//
//       // Main Body: List of chats
//       body: ListView.separated(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//         itemCount: chats.length,
//         separatorBuilder: (context, index) => SizedBox(height: 10.h),
//         itemBuilder: (context, index) {
//           final chat = chats[index];
//           final bool isUnread = chat['isUnread'];
//
//           return GestureDetector(
//             // ... inside ListView builder ...
//             onTap: () {
//               // Use Get.to() instead of Get.toNamed()
//               Get.to(
//                 () => ConversationScreen(),
//                 transition: Transition
//                     .rightToLeft, // Optional: Makes it look like a chat app
//                 duration: const Duration(milliseconds: 300),
//               );
//             },
//             child: Container(
//               padding: EdgeInsets.all(12.w),
//               decoration: BoxDecoration(
//                 // Greenish background if unread, Light Grey/White if read
//                 color: isUnread
//                     ? const Color(0xFFF0FDF4)
//                     : const Color(0xFFF9FAFB),
//                 borderRadius: BorderRadius.circular(12.r),
//               ),
//               child: Row(
//                 children: [
//                   // Profile Picture
//                   CircleAvatar(
//                     radius: 30.r,
//                     backgroundImage: NetworkImage(chat['img']),
//                     backgroundColor: Colors.grey.shade200,
//                   ),
//                   SizedBox(width: 12.w),
//
//                   // Name and Message
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           chat['name'],
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15.sp,
//                             color: Colors.black87,
//                             shadows: [
//                               BoxShadow(
//                                 color: Color(
//                                   0xff000000,
//                                 ).withValues(alpha: 0.12),
//                                 blurRadius: 19,
//                                 offset: Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 4.h),
//                         Text(
//                           chat['msg'],
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: isUnread ? Colors.black87 : Colors.grey,
//                             fontWeight: isUnread
//                                 ? FontWeight.w500
//                                 : FontWeight.normal,
//                             fontSize: 13.sp,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   // Time
//                   Text(
//                     chat['time'],
//                     style: TextStyle(
//                       color: isUnread ? Colors.green : Colors.grey,
//                       fontSize: 11.sp,
//                       fontWeight: isUnread
//                           ? FontWeight.bold
//                           : FontWeight.normal,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//
//       // Your Navigation Button
//       bottomNavigationBar: NavButton2(selectIndex: 3),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// Check your import paths
import 'package:first_project/Services/Controller_view/chartmsg.dart'; // Your Controller
import '../techerall_widget/nav_button/nav_button.dart';
import 'convarcation.dart'; // Your Nav Button

class Chat2 extends StatefulWidget {
  const Chat2({super.key});

  @override
  State<Chat2> createState() => _Chat2State();
}

class _Chat2State extends State<Chat2> {
  // Initialize the Controller
  final Chartmsg controller = Get.put(Chartmsg());

  @override
  void initState() {
    super.initState();
    // Fetch list when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchConversationList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Top App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Chat with Parent", // Logically this is Teacher viewing Parents
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
        ),
      ),

      // Main Body: Real-time List
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchConversationList();
        },
        child: Obx(() {
          // 1. Loading
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Empty
          if (controller.conversationList.isEmpty) {
            return Center(
              child: Text(
                "No conversations found",
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
            );
          }

          // 3. Dynamic List
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            itemCount: controller.conversationList.length,
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              var chat = controller.conversationList[index];

              // === Data Parsing ===
              var otherUser = chat['other_user'] ?? chat['participant'] ?? {};
              String name = otherUser['full_name'] ?? otherUser['username'] ?? "Unknown";
              String? image = otherUser['profile_picture'];

              String lastMsg = "Start conversation";
              if (chat['last_message'] != null) {
                lastMsg = chat['last_message']['content'] ?? "Attachment";
              }

              String time = _formatTime(chat['updated_at'] ?? "");
              int unreadCount = chat['unread_count'] ?? 0;
              int convId = chat['id'];

              return GestureDetector(
                onTap: () {
                  // Navigate to Details with Data
                  Get.to(
                        () => ConversationScreen(
                      conversationId: convId,
                      name: name,
                      image: image ?? "",
                    ),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 300),
                  )?.then((_) => controller.fetchConversationList());
                },
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: unreadCount > 0
                        ? const Color(0xFFF0FDF4)
                        : const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      // Profile Picture
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: (image != null && image.isNotEmpty)
                            ? NetworkImage(image) as ImageProvider
                            : const AssetImage("assets/backround/explor4.png"),
                      ),
                      SizedBox(width: 12.w),

                      // Name and Message
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: Colors.black87,
                                shadows: [
                                  BoxShadow(
                                    color: const Color(0xff000000).withOpacity(0.12),
                                    blurRadius: 19,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              lastMsg,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: unreadCount > 0 ? Colors.black87 : Colors.grey,
                                fontWeight: unreadCount > 0 ? FontWeight.w500 : FontWeight.normal,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Time
                      Text(
                        time,
                        style: TextStyle(
                          color: unreadCount > 0 ? Colors.green : Colors.grey,
                          fontSize: 11.sp,
                          fontWeight: unreadCount > 0 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),

      // Your Teacher Navigation Button
      bottomNavigationBar: NavButton2(selectIndex: 3),
    );
  }

  // Helper for Time Format
  String _formatTime(String timeString) {
    if (timeString.isEmpty) return "";
    try {
      DateTime dt = DateTime.parse(timeString).toLocal();
      if (DateTime.now().difference(dt).inHours < 24) {
        return DateFormat('hh:mm a').format(dt);
      }
      return DateFormat('MMM d').format(dt);
    } catch (e) { return ""; }
  }
}