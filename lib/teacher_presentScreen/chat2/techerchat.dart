// // // import 'package:first_project/teacher_presentScreen/techerall_widget/nav_button/nav_button.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // import '../../../../Services/Controller_view/chat_list_controller.dart'; // আপনার সঠিক পাথ
// // // import '../../../../core/route/route.dart'; // আপনার রাউট পাথ
// // //
// // // class Techerchat extends StatelessWidget {
// // //   const Techerchat({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // কন্ট্রোলার খুঁজে বের করা বা নতুন করে তৈরি করা
// // //     final ChatListController controller = Get.put(ChatListController());
// // //
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         elevation: 0.5,
// // //         title: const Text(
// // //           "Chat with parent",
// // //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
// // //         ),
// // //         centerTitle: false,
// // //         iconTheme: const IconThemeData(color: Colors.black),
// // //       ),
// // //       bottomNavigationBar: const NavButton2(selectIndex: 3),
// // //       body: Obx(() {
// // //         // লোডিং স্টেট চেক
// // //         if (controller.isLoading.value && controller.conversations.isEmpty) {
// // //           return const Center(child: CircularProgressIndicator(color: Colors.blue));
// // //         }
// // //
// // //         // যদি কোনো কনভারসেশন না থাকে
// // //         if (controller.conversations.isEmpty) {
// // //           return RefreshIndicator(
// // //             onRefresh: () => controller.onRefresh(),
// // //             child: ListView(
// // //               children: [
// // //                 SizedBox(height: 200.h),
// // //                 Center(
// // //                   child: Text(
// // //                     "No messages from parents yet",
// // //                     style: TextStyle(color: Colors.grey, fontSize: 14.sp),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           );
// // //         }
// // //
// // //         return RefreshIndicator(
// // //           onRefresh: () => controller.onRefresh(),
// // //           child: ListView.separated(
// // //             padding: EdgeInsets.symmetric(vertical: 10.h),
// // //             itemCount: controller.conversations.length,
// // //             separatorBuilder: (context, index) =>
// // //                 Divider(height: 1, color: Colors.grey.shade100, indent: 75.w),
// // //             itemBuilder: (context, index) {
// // //               final chat = controller.conversations[index];
// // //
// // //               // মডেল থেকে ডাটা নেওয়া
// // //               final String name = chat.otherUserName;
// // //               final String profile = chat.otherUserProfile;
// // //               final bool isUnread = chat.unreadCount > 0;
// // //
// // //               return ListTile(
// // //                 onTap: () {
// // //                   // চ্যাট স্ক্রিনে নেভিগেশন এবং ডাটা পাস
// // //                   Get.toNamed(
// // //                     AppRoute.chat2,
// // //                     arguments: {
// // //                       'conversationId': chat.id,
// // //                       'name': name,
// // //                       'profile': profile,
// // //                     },
// // //                   );
// // //                 },
// // //                 contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
// // //                 leading: CircleAvatar(
// // //                   radius: 28.r,
// // //                   backgroundColor: Colors.grey.shade100,
// // //                   backgroundImage: profile.isNotEmpty
// // //                       ? NetworkImage(profile)
// // //                       : null,
// // //                   child: profile.isEmpty
// // //                       ? Icon(Icons.person, color: Colors.grey, size: 30.r)
// // //                       : null,
// // //                 ),
// // //                 title: Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Expanded(
// // //                       child: Text(
// // //                         name,
// // //                         maxLines: 1,
// // //                         overflow: TextOverflow.ellipsis,
// // //                         style: TextStyle(
// // //                           fontSize: 15.sp,
// // //                           fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     Text(
// // //                       controller.formatTime(chat.updatedAt),
// // //                       style: TextStyle(
// // //                           fontSize: 11.sp,
// // //                           color: isUnread ? Colors.blue : Colors.grey
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 subtitle: Padding(
// // //                   padding: EdgeInsets.only(top: 4.h),
// // //                   child: Row(
// // //                     children: [
// // //                       Expanded(
// // //                         child: Text(
// // //                           chat.lastMessage,
// // //                           maxLines: 1,
// // //                           overflow: TextOverflow.ellipsis,
// // //                           style: TextStyle(
// // //                             fontSize: 13.sp,
// // //                             color: isUnread ? Colors.black87 : Colors.grey.shade600,
// // //                             fontWeight: isUnread ? FontWeight.w500 : FontWeight.normal,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                       if (isUnread)
// // //                         Container(
// // //                           margin: EdgeInsets.only(left: 8.w),
// // //                           padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
// // //                           decoration: BoxDecoration(
// // //                             color: Colors.blue,
// // //                             borderRadius: BorderRadius.circular(10.r),
// // //                           ),
// // //                           child: Text(
// // //                             chat.unreadCount.toString(),
// // //                             style: TextStyle(
// // //                                 color: Colors.white,
// // //                                 fontSize: 10.sp,
// // //                                 fontWeight: FontWeight.bold
// // //                             ),
// // //                           ),
// // //                         ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               );
// // //             },
// // //           ),
// // //         );
// // //       }),
// // //     );
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import '../../../../Services/Controller_view/chat_list_controller.dart';
// // import '../../../../core/route/route.dart';
// // import 'package:first_project/teacher_presentScreen/techerall_widget/nav_button/nav_button.dart';
// //
// // class Techerchat extends StatelessWidget {
// //   const Techerchat({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // কন্ট্রোলার খুঁজে বের করা বা নতুন করে তৈরি করা
// //     final ChatListController controller = Get.put(ChatListController());
// //
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0.5,
// //         title: const Text(
// //           "Chat with parent",
// //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: false,
// //         iconTheme: const IconThemeData(color: Colors.black),
// //       ),
// //       bottomNavigationBar: const NavButton2(selectIndex: 3),
// //       body: Obx(() {
// //         // লোডিং স্টেট চেক
// //         if (controller.isLoading.value && controller.conversations.isEmpty) {
// //           return const Center(
// //             child: CircularProgressIndicator(color: Colors.blue),
// //           );
// //         }
// //
// //         // যদি কোনো কনভারসেশন না থাকে
// //         if (controller.conversations.isEmpty) {
// //           return RefreshIndicator(
// //             onRefresh: () => controller.onRefresh(),
// //             child: ListView(
// //               children: [
// //                 SizedBox(height: 200.h),
// //                 Center(
// //                   child: Text(
// //                     "No messages from parents yet",
// //                     style: TextStyle(color: Colors.grey, fontSize: 14.sp),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         }
// //
// //         return RefreshIndicator(
// //           onRefresh: () => controller.onRefresh(),
// //           child: ListView.separated(
// //             padding: EdgeInsets.symmetric(vertical: 10.h),
// //             itemCount: controller.conversations.length,
// //             separatorBuilder: (context, index) =>
// //                 Divider(height: 1, color: Colors.grey.shade100, indent: 75.w),
// //             itemBuilder: (context, index) {
// //               final chat = controller.conversations[index];
// //
// //               // মডেল থেকে ডাটা নেওয়া
// //               final String name = chat.otherUserName;
// //               final String profile = chat.otherUserProfile;
// //               final bool isUnread = chat.unreadCount > 0;
// //
// //               return ListTile(
// //                 onTap: () {
// //                   // চ্যাট স্ক্রিনে নেভিগেশন এবং ডাটা পাস (Chat2 স্ক্রিনের জন্য)
// //                   Get.toNamed(
// //                     AppRoute.chat2,
// //                     arguments: {
// //                       'conversationId': chat.id,
// //                       'name': name,
// //                       'profile': profile,
// //                     },
// //                   );
// //                 },
// //                 contentPadding: EdgeInsets.symmetric(
// //                   horizontal: 16.w,
// //                   vertical: 4.h,
// //                 ),
// //                 leading: CircleAvatar(
// //                   radius: 28.r,
// //                   backgroundColor: Colors.grey.shade100,
// //                   backgroundImage: profile.isNotEmpty
// //                       ? NetworkImage(profile)
// //                       : null,
// //                   child: profile.isEmpty
// //                       ? Icon(Icons.person, color: Colors.grey, size: 30.r)
// //                       : null,
// //                 ),
// //                 title: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Expanded(
// //                       child: Text(
// //                         name,
// //                         maxLines: 1,
// //                         overflow: TextOverflow.ellipsis,
// //                         style: TextStyle(
// //                           fontSize: 15.sp,
// //                           fontWeight: isUnread
// //                               ? FontWeight.bold
// //                               : FontWeight.w600,
// //                         ),
// //                       ),
// //                     ),
// //                     Text(
// //                       controller.formatTime(chat.updatedAt),
// //                       style: TextStyle(
// //                         fontSize: 11.sp,
// //                         color: isUnread ? Colors.blue : Colors.grey,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 subtitle: Padding(
// //                   padding: EdgeInsets.only(top: 4.h),
// //                   child: Row(
// //                     children: [
// //                       Expanded(
// //                         child: Text(
// //                           chat.lastMessage,
// //                           maxLines: 1,
// //                           overflow: TextOverflow.ellipsis,
// //                           style: TextStyle(
// //                             fontSize: 13.sp,
// //                             color: isUnread
// //                                 ? Colors.black87
// //                                 : Colors.grey.shade600,
// //                             fontWeight: isUnread
// //                                 ? FontWeight.w500
// //                                 : FontWeight.normal,
// //                           ),
// //                         ),
// //                       ),
// //                       if (isUnread)
// //                         Container(
// //                           margin: EdgeInsets.only(left: 8.w),
// //                           padding: EdgeInsets.symmetric(
// //                             horizontal: 8.w,
// //                             vertical: 4.h,
// //                           ),
// //                           decoration: BoxDecoration(
// //                             color: Colors.blue,
// //                             borderRadius: BorderRadius.circular(10.r),
// //                           ),
// //                           child: Text(
// //                             chat.unreadCount.toString(),
// //                             style: TextStyle(
// //                               color: Colors.white,
// //                               fontSize: 10.sp,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                         ),
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             },
// //           ),
// //         );
// //       }),
// //     );
// //   }
// // }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../Services/Controller_view/chat_list_controller.dart';
// import '../../../../core/route/route.dart';
// import 'package:first_project/teacher_presentScreen/techerall_widget/nav_button/nav_button.dart';
//
// class Techerchat extends StatelessWidget {
//   const Techerchat({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Controller initialize
//     final ChatListController controller = Get.put(ChatListController());
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         title: const Text(
//           "Chat with parent",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: false,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       bottomNavigationBar: const NavButton2(selectIndex: 3),
//       body: Obx(() {
//         if (controller.isLoading.value && controller.conversations.isEmpty) {
//           return const Center(child: CircularProgressIndicator(color: Colors.blue));
//         }
//
//         if (controller.conversations.isEmpty) {
//           return RefreshIndicator(
//             onRefresh: () => controller.onRefresh(),
//             child: ListView(
//               children: [
//                 SizedBox(height: 200.h),
//                 Center(
//                   child: Text(
//                     "No messages from parents yet",
//                     style: TextStyle(color: Colors.grey, fontSize: 14.sp),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//
//         return RefreshIndicator(
//           onRefresh: () => controller.onRefresh(),
//           child: ListView.separated(
//             padding: EdgeInsets.symmetric(vertical: 10.h),
//             itemCount: controller.conversations.length,
//             separatorBuilder: (context, index) =>
//                 Divider(height: 1, color: Colors.grey.shade100, indent: 75.w),
//             itemBuilder: (context, index) {
//               final chat = controller.conversations[index];
//
//               // ✅ MODEL DATA MAPPING (Check correctly)
//               // Apnar model onujayi chat.otherUser theke data nite hobe
//               final String name = chat.otherUser.fullName ?? "Parent";
//               final String profile = chat.otherUser.profilePicture ?? "";
//               final bool isUnread = chat.unreadCount > 0;
//
//               return ListTile(
//                 onTap: () {
//                   // চ্যাট স্ক্রিনে নেভিগেশন (InboxController er sathe mil rekhe keys pathano)
//                   Get.toNamed(
//                     AppRoute.chat2, // Teacher part chat screen
//                     arguments: {
//                       'id': chat.id, // eita 'id' hobe (inbox controller er jonno)
//                       'name': name,
//                       'profile': profile,
//                     },
//                   );
//                 },
//                 contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
//                 leading: CircleAvatar(
//                   radius: 28.r,
//                   backgroundColor: Colors.grey.shade100,
//                   backgroundImage: profile.isNotEmpty
//                       ? NetworkImage(profile)
//                       : null,
//                   child: profile.isEmpty
//                       ? Icon(Icons.person, color: Colors.grey, size: 30.r)
//                       : null,
//                 ),
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         name,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 15.sp,
//                           fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       controller.formatTime(chat.updatedAt),
//                       style: TextStyle(
//                           fontSize: 11.sp,
//                           color: isUnread ? Colors.blue : Colors.grey
//                       ),
//                     ),
//                   ],
//                 ),
//                 subtitle: Padding(
//                   padding: EdgeInsets.only(top: 4.h),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           chat.lastMessage ?? "No message",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             fontSize: 13.sp,
//                             color: isUnread ? Colors.black87 : Colors.grey.shade600,
//                             fontWeight: isUnread ? FontWeight.w500 : FontWeight.normal,
//                           ),
//                         ),
//                       ),
//                       if (isUnread)
//                         Container(
//                           margin: EdgeInsets.only(left: 8.w),
//                           padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(6.0),
//                             child: Text(
//                               chat.unreadCount.toString(),
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 10.sp,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       }),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Services/Controller_view/chat_list_controller.dart';
import '../../../../core/route/route.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/nav_button/nav_button.dart';

class Techerchat extends StatelessWidget {
  const Techerchat({super.key});

  @override
  Widget build(BuildContext context) {
    // কন্ট্রোলার ইনিশিয়ালাইজ করা
    final ChatListController controller = Get.put(ChatListController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          "Chat with parent",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: const NavButton2(selectIndex: 3),
      body: Obx(() {
        // ১. লোডিং স্টেট চেক
        if (controller.isLoading.value && controller.conversations.isEmpty) {
          return const Center(child: CircularProgressIndicator(color: Colors.blue));
        }

        // ২. কনভারসেশন লিস্ট খালি থাকলে
        if (controller.conversations.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => controller.onRefresh(),
            child: ListView(
              children: [
                SizedBox(height: 200.h),
                Center(
                  child: Text(
                    "No messages from parents yet",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          );
        }

        // ৩. চ্যাট লিস্ট রেন্ডারিং
        return RefreshIndicator(
          onRefresh: () => controller.onRefresh(),
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            itemCount: controller.conversations.length,
            separatorBuilder: (context, index) =>
                Divider(height: 1, color: Colors.grey.shade100, indent: 75.w),
            itemBuilder: (context, index) {
              final chat = controller.conversations[index];

              // ✅ সঠিক মডেল ডাটা ম্যাপিং (আপনার নতুন OtherUser অবজেক্ট অনুযায়ী)
              final String name = chat.otherUser.fullName;
              final String profile = chat.otherUser.profilePicture;
              final bool isUnread = chat.unreadCount > 0;

              return ListTile(
                onTap: () {
                  // চ্যাট ডিটেইলস স্ক্রিনে নেভিগেশন (id, name, profile কি-গুলো InboxController অনুযায়ী)
                  Get.toNamed(
                    AppRoute.chat2, // আপনার টিচার পার্ট চ্যাট স্ক্রিন রাউট
                    arguments: {
                      'id': chat.id,
                      'name': name,
                      'profile': profile,
                    },
                  );
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: 28.r,
                      backgroundColor: Colors.grey.shade100,
                      backgroundImage: profile.isNotEmpty
                          ? NetworkImage(profile)
                          : null,
                      child: profile.isEmpty
                          ? Icon(Icons.person, color: Colors.grey, size: 30.r)
                          : null,
                    ),
                    // অনলাইন ইন্ডিকেটর (সার্ভারের স্ট্যাটাস অনুযায়ী)
                    if (chat.otherUser.status == "active")
                      Positioned(
                        right: 2,
                        bottom: 2,
                        child: Container(
                          height: 12.r,
                          width: 12.r,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      controller.formatTime(chat.updatedAt),
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: isUnread ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.lastMessage.isNotEmpty ? chat.lastMessage : "No message yet",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: isUnread ? Colors.black87 : Colors.grey.shade600,
                            fontWeight: isUnread ? FontWeight.w500 : FontWeight.normal,
                          ),
                        ),
                      ),
                      // আনরিড মেসেজ ব্যাজ
                      if (isUnread)
                        Container(
                          margin: EdgeInsets.only(left: 8.w),
                          padding: EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            chat.unreadCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}