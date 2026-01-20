// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// // ✅ ইমপোর্টগুলো আপনার প্রোজেক্ট স্ট্রাকচার অনুযায়ী চেক করে নিন
// import 'package:first_project/Services/Controller_view/chartmsg.dart';
// import 'package:first_project/Services/model_class/usershow_model.dart';
// import 'package:first_project/Parent_parsentScreen/home_Ui/homedetels/chartdetels/chat_connection_teacher.dart';
// import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
//
// class Chartdetels extends StatelessWidget {
//   const Chartdetels({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // কন্ট্রোলার ইনজেকশন এবং ইনিশিয়াল ডাটা লোড
//     final Chartmsg controller = Get.put(Chartmsg());
//
//     // স্ক্রিন বিল্ড হওয়ার পর ডাটা ফেচ করার জন্য WidgetsBinding ব্যবহার করা ভালো
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.fetchConversationList();
//     });
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Text(
//           "Chat with tutor",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 22.sp,
//           ),
//         ),
//       ),
//       body: Obx(() {
//         // ডাটা লোড হওয়ার সময় ইন্ডিকেটর দেখানো
//         if (controller.isLoading.value && controller.conversationList.isEmpty) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         // লিস্ট খালি থাকলে মেসেজ দেখানো
//         if (controller.conversationList.isEmpty) {
//           return RefreshIndicator(
//             onRefresh: () => controller.fetchConversationList(),
//             child: ListView(
//               children: [
//                 SizedBox(height: 200.h),
//                 Center(
//                   child: Text(
//                     "No conversations found",
//                     style: TextStyle(color: Colors.grey, fontSize: 16.sp),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//
//         return RefreshIndicator(
//           onRefresh: () => controller.fetchConversationList(),
//           child: ListView.builder(
//             physics: const AlwaysScrollableScrollPhysics(),
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//             itemCount: controller.conversationList.length,
//             itemBuilder: (context, index) {
//               var chat = controller.conversationList[index];
//
//               // ডাটা সেফটি চেক
//               var otherUserRaw = chat['other_user'] ?? chat['participant'];
//               if (otherUserRaw == null) return const SizedBox.shrink();
//
//               TutorDetails otherUser = TutorDetails.fromJson(otherUserRaw);
//               String lastMsg = chat['last_message']?['content'] ?? "Start conversation...";
//               String time = _formatDateTime(chat['last_message']?['created_at']);
//               int unread = chat['unread_count'] ?? 0;
//
//               return Padding(
//                 padding: EdgeInsets.only(bottom: 12.h),
//                 child: GestureDetector(
//                   onTap: () => Get.to(() => ChatConnectionTeacher(
//                     conversationId: chat['id'] ?? 0,
//                     name: otherUser.fullName,
//                     image: otherUser.profilePicture ?? "",
//                   ))?.then((_) => controller.fetchConversationList()),
//                   child: Container(
//                     padding: EdgeInsets.all(12.w),
//                     decoration: BoxDecoration(
//                       // আনরিড মেসেজ থাকলে হালকা সবুজ ব্যাকগ্রাউন্ড (আপনার আগের লজিক অনুযায়ী)
//                       color: unread > 0 ? const Color(0xFFF0FDF4) : const Color(0xFFF9FAFB),
//                       borderRadius: BorderRadius.circular(16.r),
//                       border: Border.all(color: Colors.grey.withOpacity(0.1)),
//                     ),
//                     child: Row(
//                       children: [
//                         // প্রোফাইল পিকচার (Rounded Square style)
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(12.r),
//                           child: (otherUser.profilePicture != null && otherUser.profilePicture!.isNotEmpty)
//                               ? Image.network(
//                             otherUser.profilePicture!,
//                             width: 50.w,
//                             height: 50.h,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) => Image.asset(
//                               "assets/backround/teacher.png",
//                               width: 50.w, height: 50.h, fit: BoxFit.cover,
//                             ),
//                           )
//                               : Image.asset(
//                             "assets/backround/teacher.png",
//                             width: 50.w, height: 50.h, fit: BoxFit.cover,
//                           ),
//                         ),
//                         SizedBox(width: 12.w),
//
//                         // নাম এবং লাস্ট মেসেজ
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 otherUser.fullName,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16.sp,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               SizedBox(height: 4.h),
//                               Text(
//                                 lastMsg,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   color: unread > 0 ? Colors.black87 : Colors.grey,
//                                   fontSize: 13.sp,
//                                   fontWeight: unread > 0 ? FontWeight.w500 : FontWeight.normal,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         // টাইম এবং আনরিড ডট
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                               time,
//                               style: TextStyle(
//                                 color: const Color(0xFF22C55E),
//                                 fontSize: 11.sp,
//                                 fontWeight: unread > 0 ? FontWeight.bold : FontWeight.normal,
//                               ),
//                             ),
//                             if (unread > 0) ...[
//                               SizedBox(height: 5.h),
//                               Container(
//                                 padding: EdgeInsets.all(6.r),
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xFF22C55E),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Text(
//                                   unread.toString(),
//                                   style: TextStyle(color: Colors.white, fontSize: 8.sp),
//                                 ),
//                               ),
//                             ]
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       }),
//       // বটম নেভিগেশন বাটন যোগ করা হয়েছে
//       bottomNavigationBar: NavButton(selectIndex: 2),
//     );
//   }
//
//   // টাইম ফরম্যাটিং ফাংশন
//   String _formatDateTime(String? dateStr) {
//     if (dateStr == null) return "";
//     try {
//       final date = DateTime.parse(dateStr).toLocal();
//       final now = DateTime.now();
//
//       if (date.day == now.day && date.month == now.month && date.year == now.year) {
//         return DateFormat('hh:mm a').format(date);
//       } else if (now.difference(date).inDays < 7) {
//         return DateFormat('EEE').format(date); // সপ্তাহের দিন
//       } else {
//         return DateFormat('MMM dd').format(date);
//       }
//     } catch (e) {
//       return "";
//     }
//   }
// }