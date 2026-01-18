// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../../../core/route/route.dart';
// import '../../../../unity/app_colors/app_gradient.dart';
// import '../../../widget/back_slash/back_slash.dart';
// import '../../../widget/custom_button/custom_button.dart';
//
// class RecommendedPageDetesTecher0 extends StatefulWidget {
//   const RecommendedPageDetesTecher0({super.key});
//
//   @override
//   State<RecommendedPageDetesTecher0> createState() => _RecommendedPageDetesTecher0State();
// }
//
// class _RecommendedPageDetesTecher0State extends State<RecommendedPageDetesTecher0> {
//   // ১. কন্ট্রোলারটি এখানে ইনজেক্ট করা হয়েছে
//   // যদি কন্ট্রোলারটি আগে তৈরি না হয়ে থাকে তবে Get.put ব্যবহার করা নিরাপদ
//   final TeacherDetailsController controller = Get.isRegistered<TeacherDetailsController>()
//       ? Get.find<TeacherDetailsController>()
//       : Get.put(TeacherDetailsController());
//
//   bool isFavorite = false;
//
//   @override
//   Widget build(BuildContext context) {
//     // ২. কন্ট্রোলারের ডাটা ভেরিয়েবলে রাখা (Null Safety নিশ্চিত করে)
//     final properties = controller.classData.properties;
//     final tutor = properties.tutorDetails;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 50.h),
//
//             // Top Navigation Bar
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 BackSlashButton(onTap: () => Get.back()),
//                 IconButton(
//                   onPressed: () => setState(() => isFavorite = !isFavorite),
//                   icon: Icon(
//                       isFavorite ? Icons.favorite : Icons.favorite_border,
//                       color: isFavorite ? Colors.red : const Color(0xff2B2B2B)
//                   ),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 20),
//
//             /// ===== ১. সার্ভার থেকে আসা টিউটর ইমেজ (Network Image) =====
//             Center(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15.r),
//                 child: Image.network(
//                   tutor.profilePicture ?? "",
//                   width: 220.w,
//                   height: 220.h,
//                   fit: BoxFit.cover,
//                   // ইমেজ লোড হতে দেরি হলে বা এরর দিলে প্লেসহোল্ডার দেখাবে
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) return child;
//                     return SizedBox(
//                         width: 220.w, height: 220.h,
//                         child: const Center(child: CircularProgressIndicator())
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) => Image.asset(
//                     'assets/backround/placeholder.png', // আপনার প্রোজেক্টের ডিফল্ট ইমেজ পাথ
//                     width: 220.w, height: 220.h, fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 20.h),
//
//             /// ===== ২. টিউটর নাম এবং রেটিং =====
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     tutor.fullName,
//                     style: TextStyle(color: const Color(0xff2B2B2B), fontSize: 22.sp, fontWeight: FontWeight.bold),
//                     maxLines: 1, overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.star, color: const Color(0xffFFC107), size: 20.sp),
//                     SizedBox(width: 4.w),
//                     Text(
//                       '4.5',
//                       style: TextStyle(color: const Color(0xff2B2B2B), fontSize: 18.sp, fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 12.h),
//
//             /// ===== ৩. টিউটর বায়ো =====
//             Text(
//               tutor.bio ?? 'No biography description available for this tutor.',
//               style: TextStyle(color: const Color(0xff888888), fontSize: 14.sp, height: 1.5),
//             ),
//
//             SizedBox(height: 24.h),
//
//             /// ===== ৪. ডাইনামিক ক্লাস ডিটেইলস গ্রিড/লিস্ট =====
//             _detailRow(Icons.book, "Subject: ${properties.subject}"),
//             _detailRow(Icons.school, "Level: ${properties.level}"),
//             _detailRow(Icons.timer, "Experience: ${tutor.yearsOf_experience} Years"),
//             _detailRow(Icons.location_on, properties.address),
//
//             SizedBox(height: 24.h),
//
//             /// ===== ৫. ডাইনামিক প্রাইস সেকশন =====
//             Container(
//               padding: EdgeInsets.all(15.w),
//               decoration: BoxDecoration(
//                   color: const Color(0xff2563EB).withOpacity(0.05),
//                   borderRadius: BorderRadius.circular(12.r)
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Tuition Fee", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//                   Text(
//                     '${properties.currency} ${properties.pricePerHour}/hr',
//                     style: TextStyle(color: const Color(0xff2563EB), fontSize: 22.sp, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 40.h),
//
//             /// ===== ৬. বুকিং এবং চ্যাট বাটন =====
//             _buildActionButtons(properties, tutor),
//
//             SizedBox(height: 20.h),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ডিটেইলস রো হেল্পার
//   Widget _detailRow(IconData icon, String label) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12.h),
//       child: Row(
//         children: [
//           Container(
//             padding: EdgeInsets.all(6.w),
//             decoration: BoxDecoration(color: Colors.blue.shade50, shape: BoxShape.circle),
//             child: Icon(icon, size: 18.sp, color: const Color(0xff2563EB)),
//           ),
//           SizedBox(width: 12.w),
//           Expanded(
//             child: Text(
//                 label,
//                 style: TextStyle(color: const Color(0xff2B2B2B), fontSize: 15.sp, fontWeight: FontWeight.w600)
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // বাটন হেল্পার
//   Widget _buildActionButtons(dynamic properties, dynamic tutor) {
//     return Column(
//       children: [
//         CustomSuperButton(
//           text: 'Request for booking',
//           onTap: () => Get.toNamed(AppRoute.requestboking, arguments: controller.classData),
//           bgGradient: const LinearGradient(colors: [Color(0xff2563EB), Color(0xff2563EB)]),
//         ),
//         SizedBox(height: 16.h),
//         CustomSuperButton(
//           text: 'Chat with tutor',
//           onTap: () => Get.toNamed(AppRoute.chatConationTeacher, arguments: tutor),
//           borderColor: const Color(0xff2563EB),
//           // textGradient প্রপার্টি থাকলে তা ব্যবহার করুন, নাহলে শুধু কালার দিন
//           textGradient: Appgradient.primaryGradient,
//         ),
//       ],
//     );
//   }
// }