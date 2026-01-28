// // // // import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
// // // // import 'package:first_project/core/route/route.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';
// // // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // // import '../../../../Services/Controller_view/chat_list_controller.dart';
// // // //
// // // // class Perentchat extends StatelessWidget {
// // // //   const Perentchat({super.key});
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     // কন্ট্রোলার ইনিশিয়ালাইজেশন
// // // //     // যদি এটি অলরেডি অন্য কোথাও put করা থাকে তবে Get.find ব্যবহার করা ভালো
// // // //     final ChatListController controller = Get.put(ChatListController());
// // // //
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       appBar: AppBar(
// // // //         title: const Text(
// // // //           "Chat with tutor",
// // // //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
// // // //         ),
// // // //         elevation: 0.5,
// // // //         backgroundColor: Colors.white,
// // // //         centerTitle: false,
// // // //         iconTheme: const IconThemeData(color: Colors.black),
// // // //       ),
// // // //       bottomNavigationBar: const NavButton(selectIndex: 2),
// // // //
// // // //       body: Obx(() {
// // // //         // লোডিং স্টেট চেক করা
// // // //         if (controller.isLoading.value && controller.conversations.isEmpty) {
// // // //           return const Center(child: CircularProgressIndicator(color: Colors.blue));
// // // //         }
// // // //
// // // //         // লিস্ট খালি থাকলে
// // // //         if (controller.conversations.isEmpty) {
// // // //           return RefreshIndicator(
// // // //             onRefresh: () => controller.onRefresh(),
// // // //             child: ListView(
// // // //               children: [
// // // //                 SizedBox(height: 200.h),
// // // //                 Center(
// // // //                   child: Text(
// // // //                     "No conversations found",
// // // //                     style: TextStyle(color: Colors.grey, fontSize: 14.sp),
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           );
// // // //         }
// // // //
// // // //         return RefreshIndicator(
// // // //           onRefresh: () => controller.onRefresh(),
// // // //           child: ListView.separated(
// // // //             padding: EdgeInsets.symmetric(vertical: 10.h),
// // // //             itemCount: controller.conversations.length,
// // // //             separatorBuilder: (context, index) =>
// // // //                 Divider(height: 1, color: Colors.grey.shade100, indent: 75.w),
// // // //             itemBuilder: (context, index) {
// // // //               final chat = controller.conversations[index];
// // // //
// // // //               // আপনার মডেলের গেটার অনুযায়ী ডাটা বের করা
// // // //               final String name = chat.otherUserName;
// // // //               final String profile = chat.otherUserProfile;
// // // //               final bool isUnread = chat.unreadCount > 0;
// // // //
// // // //               return ListTile(
// // // //                 onTap: () {
// // // //                   debugPrint("🚀 Navigating to Chat with ID: ${chat.id}");
// // // //                   // চ্যাট স্ক্রিনে যাওয়ার সময় সঠিক arguments পাস করা
// // // //                   Get.toNamed(
// // // //                     AppRoute.chatScreen1,
// // // //                     arguments: {
// // // //                       'conversationId': chat.id,
// // // //                       'name': name,
// // // //                       'profile': profile,
// // // //                     },
// // // //                   );
// // // //                 },
// // // //                 contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
// // // //
// // // //                 leading: Stack(
// // // //                   children: [
// // // //                     CircleAvatar(
// // // //                       radius: 28.r,
// // // //                       backgroundColor: Colors.grey.shade200,
// // // //                       backgroundImage: profile.isNotEmpty
// // // //                           ? NetworkImage(profile)
// // // //                           : null,
// // // //                       child: profile.isEmpty
// // // //                           ? Icon(Icons.person, color: Colors.grey, size: 30.r)
// // // //                           : null,
// // // //                     ),
// // // //                     // অনলাইন ইন্ডিকেটর: মডেলের status চেক করে
// // // //                     if (chat.otherUser.status == "active")
// // // //                       Positioned(
// // // //                         right: 2,
// // // //                         bottom: 2,
// // // //                         child: Container(
// // // //                           height: 12.r,
// // // //                           width: 12.r,
// // // //                           decoration: BoxDecoration(
// // // //                             color: Colors.green,
// // // //                             shape: BoxShape.circle,
// // // //                             border: Border.all(color: Colors.white, width: 2),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                   ],
// // // //                 ),
// // // //
// // // //                 title: Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Expanded(
// // // //                       child: Text(
// // // //                         name,
// // // //                         style: TextStyle(
// // // //                           fontSize: 15.sp,
// // // //                           fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
// // // //                           color: Colors.black87,
// // // //                         ),
// // // //                         maxLines: 1,
// // // //                         overflow: TextOverflow.ellipsis,
// // // //                       ),
// // // //                     ),
// // // //                     Text(
// // // //                       controller.formatTime(chat.updatedAt),
// // // //                       style: TextStyle(
// // // //                         fontSize: 11.sp,
// // // //                         color: isUnread ? Colors.blue : Colors.grey,
// // // //                         fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //
// // // //                 subtitle: Padding(
// // // //                   padding: EdgeInsets.only(top: 4.h),
// // // //                   child: Row(
// // // //                     children: [
// // // //                       Expanded(
// // // //                         child: Text(
// // // //                           chat.lastMessage, // মডেলের lastMessage ফিল্ড ব্যবহার
// // // //                           maxLines: 1,
// // // //                           overflow: TextOverflow.ellipsis,
// // // //                           style: TextStyle(
// // // //                             fontSize: 13.sp,
// // // //                             color: isUnread ? Colors.black : Colors.grey.shade600,
// // // //                             fontWeight: isUnread ? FontWeight.w500 : FontWeight.normal,
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       if (isUnread)
// // // //                         Container(
// // // //                           margin: EdgeInsets.only(left: 8.w),
// // // //                           padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
// // // //                           decoration: BoxDecoration(
// // // //                             color: Colors.blue,
// // // //                             borderRadius: BorderRadius.circular(10.r),
// // // //                           ),
// // // //                           child: Text(
// // // //                             chat.unreadCount.toString(),
// // // //                             style: TextStyle(
// // // //                                 color: Colors.white,
// // // //                                 fontSize: 10.sp,
// // // //                                 fontWeight: FontWeight.bold
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               );
// // // //             },
// // // //           ),
// // // //         );
// // // //       }),
// // // //     );
// // // //   }
// // // // }
// // //
// // // import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
// // // import 'package:first_project/core/route/route.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // import '../../../../Services/Controller_view/chat_list_controller.dart';
// // //
// // // class Perentchat extends StatelessWidget {
// // //   const Perentchat({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // কন্ট্রোলার খুঁজে বের করা বা নতুন করে তৈরি করা
// // //     final ChatListController controller = Get.put(ChatListController());
// // //
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         title: const Text(
// // //           "Chat with tutor",
// // //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
// // //         ),
// // //         elevation: 0.5,
// // //         backgroundColor: Colors.white,
// // //         centerTitle: false,
// // //         iconTheme: const IconThemeData(color: Colors.black),
// // //       ),
// // //       bottomNavigationBar: const NavButton(selectIndex: 2),
// // //
// // //       body: Obx(() {
// // //         // লোডিং স্টেট এবং ডাটা চেক করা
// // //         if (controller.isLoading.value && controller.conversations.isEmpty) {
// // //           return const Center(
// // //             child: CircularProgressIndicator(color: Colors.blue),
// // //           );
// // //         }
// // //
// // //         // লিস্ট খালি থাকলে রিফ্রেশ করার ব্যবস্থা
// // //         if (controller.conversations.isEmpty) {
// // //           return RefreshIndicator(
// // //             onRefresh: () => controller.onRefresh(),
// // //             child: ListView(
// // //               children: [
// // //                 SizedBox(height: 200.h),
// // //                 Center(
// // //                   child: Text(
// // //                     "No conversations found",
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
// // //               // মডেল থেকে ডাটা বের করা
// // //               final String name = chat.otherUserName;
// // //               final String profile = chat.otherUserProfile;
// // //               final bool isUnread = chat.unreadCount > 0;
// // //
// // //               return ListTile(
// // //                 onTap: () {
// // //                   debugPrint("🚀 Navigating to Chat with ID: ${chat.id}");
// // //                   // প্যারেন্ট পার্টের চ্যাট স্ক্রিনে নেভিগেশন
// // //                   Get.toNamed(
// // //                     AppRoute.chatScreen1,
// // //                     arguments: {
// // //                       'conversationId': chat.id,
// // //                       'name': name,
// // //                       'profile': profile,
// // //                     },
// // //                   );
// // //                 },
// // //                 contentPadding: EdgeInsets.symmetric(
// // //                   horizontal: 16.w,
// // //                   vertical: 4.h,
// // //                 ),
// // //
// // //                 leading: Stack(
// // //                   children: [
// // //                     CircleAvatar(
// // //                       radius: 28.r,
// // //                       backgroundColor: Colors.grey.shade200,
// // //                       backgroundImage: profile.isNotEmpty
// // //                           ? NetworkImage(profile)
// // //                           : null,
// // //                       child: profile.isEmpty
// // //                           ? Icon(Icons.person, color: Colors.grey, size: 30.r)
// // //                           : null,
// // //                     ),
// // //                     // অনলাইন স্ট্যাটাস চেক (active থাকলে সবুজ ডট)
// // //                     if (chat.otherUser.status == "active")
// // //                       Positioned(
// // //                         right: 2,
// // //                         bottom: 2,
// // //                         child: Container(
// // //                           height: 12.r,
// // //                           width: 12.r,
// // //                           decoration: BoxDecoration(
// // //                             color: Colors.green,
// // //                             shape: BoxShape.circle,
// // //                             border: Border.all(color: Colors.white, width: 2),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                   ],
// // //                 ),
// // //
// // //                 title: Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Expanded(
// // //                       child: Text(
// // //                         name,
// // //                         style: TextStyle(
// // //                           fontSize: 15.sp,
// // //                           fontWeight: isUnread
// // //                               ? FontWeight.bold
// // //                               : FontWeight.w600,
// // //                           color: Colors.black87,
// // //                         ),
// // //                         maxLines: 1,
// // //                         overflow: TextOverflow.ellipsis,
// // //                       ),
// // //                     ),
// // //                     Text(
// // //                       controller.formatTime(chat.updatedAt),
// // //                       style: TextStyle(
// // //                         fontSize: 11.sp,
// // //                         color: isUnread ? Colors.blue : Colors.grey,
// // //                         fontWeight: isUnread
// // //                             ? FontWeight.bold
// // //                             : FontWeight.normal,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //
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
// // //                             color: isUnread
// // //                                 ? Colors.black
// // //                                 : Colors.grey.shade600,
// // //                             fontWeight: isUnread
// // //                                 ? FontWeight.w500
// // //                                 : FontWeight.normal,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                       // আনরিড মেসেজ কাউন্টার
// // //                       if (isUnread)
// // //                         Container(
// // //                           margin: EdgeInsets.only(left: 8.w),
// // //                           padding: EdgeInsets.symmetric(
// // //                             horizontal: 8.w,
// // //                             vertical: 4.h,
// // //                           ),
// // //                           decoration: BoxDecoration(
// // //                             color: Colors.blue,
// // //                             borderRadius: BorderRadius.circular(10.r),
// // //                           ),
// // //                           child: Text(
// // //                             chat.unreadCount.toString(),
// // //                             style: TextStyle(
// // //                               color: Colors.white,
// // //                               fontSize: 10.sp,
// // //                               fontWeight: FontWeight.bold,
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
// //
// //
// //
// // import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
// // import 'package:first_project/core/route/route.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import '../../../../Services/Controller_view/chat_list_controller.dart';
// //
// // class Perentchat extends StatelessWidget {
// //   const Perentchat({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Controller Initialize
// //     final ChatListController controller = Get.put(ChatListController());
// //
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         title: const Text(
// //           "Chat with tutor",
// //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
// //         ),
// //         elevation: 0.5,
// //         backgroundColor: Colors.white,
// //         centerTitle: false,
// //         iconTheme: const IconThemeData(color: Colors.black),
// //       ),
// //       bottomNavigationBar: const NavButton(selectIndex: 2),
// //
// //       body: Obx(() {
// //         if (controller.isLoading.value && controller.conversations.isEmpty) {
// //           return const Center(child: CircularProgressIndicator(color: Colors.blue));
// //         }
// //
// //         if (controller.conversations.isEmpty) {
// //           return RefreshIndicator(
// //             onRefresh: () => controller.onRefresh(),
// //             child: ListView(
// //               children: [
// //                 SizedBox(height: 200.h),
// //                 Center(
// //                   child: Text(
// //                     "No conversations found",
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
// //               // MODEL THEKE DATA NEWA (Model onujayi check korun)
// //               // Jodi chat.otherUserName thake tobe thik ache, na thakle chat.otherUser.fullName use korun
// //               final String name = chat.otherUser.fullName ?? "Unknown";
// //               final String profile = chat.otherUser.profilePicture ?? "";
// //               final bool isUnread = chat.unreadCount > 0;
// //
// //               return ListTile(
// //                 onTap: () {
// //                   debugPrint("🚀 Navigating with ID: ${chat.id}");
// //
// //                   // ! KEY GULO OBOSHSHOI INBOX_CONTROLLER ER SATHE MATCH KORTE HOBE
// //                   Get.toNamed(
// //                     AppRoute.chatScreen1,
// //                     arguments: {
// //                       'id': chat.id,        // InboxController e eita 'id' hobe
// //                       'name': name,         // InboxController e eita 'name' hobe
// //                       'profile': profile,   // InboxController e eita 'profile' hobe
// //                     },
// //                   );
// //                 },
// //                 contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
// //                 leading: Stack(
// //                   children: [
// //                     CircleAvatar(
// //                       radius: 28.r,
// //                       backgroundColor: Colors.grey.shade200,
// //                       backgroundImage: profile.isNotEmpty
// //                           ? NetworkImage(profile)
// //                           : null,
// //                       child: profile.isEmpty
// //                           ? Icon(Icons.person, color: Colors.grey, size: 30.r)
// //                           : null,
// //                     ),
// //                     if (chat.otherUser.status == "active")
// //                       Positioned(
// //                         right: 2,
// //                         bottom: 2,
// //                         child: Container(
// //                           height: 12.r, width: 12.r,
// //                           decoration: BoxDecoration(
// //                             color: Colors.green,
// //                             shape: BoxShape.circle,
// //                             border: Border.all(color: Colors.white, width: 2),
// //                           ),
// //                         ),
// //                       ),
// //                   ],
// //                 ),
// //                 title: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Expanded(
// //                       child: Text(
// //                         name,
// //                         style: TextStyle(
// //                           fontSize: 15.sp,
// //                           fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
// //                         ),
// //                         maxLines: 1,
// //                         overflow: TextOverflow.ellipsis,
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
// //                           chat.lastMessage ?? "No message",
// //                           maxLines: 1,
// //                           overflow: TextOverflow.ellipsis,
// //                           style: TextStyle(
// //                             fontSize: 13.sp,
// //                             color: isUnread ? Colors.black : Colors.grey.shade600,
// //                           ),
// //                         ),
// //                       ),
// //                       if (isUnread)
// //                         Container(
// //                           margin: EdgeInsets.only(left: 8.w),
// //                           padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
// //                           decoration: BoxDecoration(
// //                             color: Colors.blue,
// //                             borderRadius: BorderRadius.circular(10.r),
// //                           ),
// //                           child: Text(
// //                             chat.unreadCount.toString(),
// //                             style: TextStyle(color: Colors.white, fontSize: 10.sp),
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
// import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
// import 'package:first_project/core/route/route.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../Services/Controller_view/chat_list_controller.dart';
//
// class Perentchat extends StatelessWidget {
//   const Perentchat({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Controller initialization (Get.put use kora hoyeche jate refresh hoy)
//     final ChatListController controller = Get.put(ChatListController());
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           "Chat with tutor",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         elevation: 0.5,
//         backgroundColor: Colors.white,
//         centerTitle: false,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       bottomNavigationBar: const NavButton(selectIndex: 2),
//
//       body: Obx(() {
//         // Loading state check
//         if (controller.isLoading.value && controller.conversations.isEmpty) {
//           return const Center(child: CircularProgressIndicator(color: Colors.blue));
//         }
//
//         // Empty state check
//         if (controller.conversations.isEmpty) {
//           return RefreshIndicator(
//             onRefresh: () => controller.onRefresh(),
//             child: ListView(
//               children: [
//                 SizedBox(height: 200.h),
//                 Center(
//                   child: Text(
//                     "No conversations found",
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
//               // SERVER JSON ANUWAYI DATA EXTRACT (OtherUser object theke)
//               final String name = chat.otherUser.fullName;
//               final String profile = chat.otherUser.profilePicture;
//               final bool isUnread = chat.unreadCount > 0;
//
//               return ListTile(
//                 onTap: () {
//                   debugPrint("🚀 Navigating to Chat with ID: ${chat.id}");
//                   // Chat Screen e jaoar somoy id, name, profile pathano hocche
//                   Get.toNamed(
//                     AppRoute.chatScreen1,
//                     arguments: {
//                       'id': chat.id,
//                       'name': name,
//                       'profile': profile,
//                     },
//                   );
//                 },
//                 contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
//                 leading: Stack(
//                   children: [
//                     // Profile Picture from Server
//                     CircleAvatar(
//                       radius: 28.r,
//                       backgroundColor: Colors.grey.shade200,
//                       backgroundImage: profile.isNotEmpty
//                           ? NetworkImage(profile)
//                           : null,
//                       child: profile.isEmpty
//                           ? Icon(Icons.person, color: Colors.grey, size: 30.r)
//                           : null,
//                     ),
//                     // Online Status Indicator
//                     if (chat.otherUser.status == "active")
//                       Positioned(
//                         right: 2,
//                         bottom: 2,
//                         child: Container(
//                           height: 12.r,
//                           width: 12.r,
//                           decoration: BoxDecoration(
//                             color: Colors.green,
//                             shape: BoxShape.circle,
//                             border: Border.all(color: Colors.white, width: 2),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         name, // Server theke asha fullName
//                         style: TextStyle(
//                           fontSize: 15.sp,
//                           fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     // Formatted Time
//                     Text(
//                       controller.formatTime(chat.updatedAt),
//                       style: TextStyle(
//                         fontSize: 11.sp,
//                         color: isUnread ? Colors.blue : Colors.grey,
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
//                           chat.lastMessage.isNotEmpty ? chat.lastMessage : "No messages yet",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             fontSize: 13.sp,
//                             color: isUnread ? Colors.black : Colors.grey.shade600,
//                           ),
//                         ),
//                       ),
//                       // Unread Count Badge
//                       if (isUnread)
//                         Container(
//                           margin: EdgeInsets.only(left: 8.w),
//                           padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(10.r),
//                           ),
//                           child: Text(
//                             chat.unreadCount.toString(),
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.bold),
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


import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Services/Controller_view/chat_list_controller.dart';

class Perentchat extends StatelessWidget {
  const Perentchat({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller initialization
    final ChatListController controller = Get.put(ChatListController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Chat with tutor",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: false,
       // iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: const NavButton(selectIndex: 2),

      body: Obx(() {
        if (controller.isLoading.value && controller.conversations.isEmpty) {
          return const Center(child: CircularProgressIndicator(color: Colors.blue));
        }

        if (controller.conversations.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => controller.onRefresh(),
            child: ListView(
              children: [
                SizedBox(height: 200.h),
                const Center(child: Text("No conversations found")),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.onRefresh(),
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            itemCount: controller.conversations.length,
            separatorBuilder: (context, index) => Divider(height: 1, indent: 75.w),
            itemBuilder: (context, index) {
              final chat = controller.conversations[index];

              // সার্ভার ডাটা ম্যাপিং (আপনার নতুন মডেল অনুযায়ী)
              final String name = chat.otherUser.fullName;
              final String profile = chat.otherUser.profilePicture;
              final bool isUnread = chat.unreadCount > 0;

              return ListTile(
                onTap: () {
                  // চ্যাট স্ক্রিনে যাওয়ার সময় ডাটা পাস করা
                  Get.toNamed(
                    AppRoute.chatScreen1,
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
                      backgroundImage: profile.isNotEmpty ? NetworkImage(profile) : null,
                      child: profile.isEmpty ? Icon(Icons.person, color: Colors.grey, size: 30.r) : null,
                    ),
                    // অনলাইন স্ট্যাটাস
                    if (chat.otherUser.status == "active")
                      Positioned(
                        right: 2, bottom: 2,
                        child: Container(
                          height: 12.r, width: 12.r,
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
                        maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      controller.formatTime(chat.updatedAt),
                      style: TextStyle(fontSize: 11.sp, color: isUnread ? Colors.blue : Colors.grey),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.lastMessage,
                          maxLines: 1, overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color:isUnread ? Colors.black87 : Colors.grey.shade600,
                          ),
                        ),
                      ),
                      if (isUnread)
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                          child: Text(
                            "${chat.unreadCount}",
                            style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
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