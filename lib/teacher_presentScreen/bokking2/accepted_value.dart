<<<<<<< HEAD
=======
// // // // // // // // // import 'package:first_project/core/route/route.dart';
// // // // // // // // // import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
// // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // // // // // // // import 'package:get/get.dart';
// // // // // // // // //
// // // // // // // // // // Ensure your models and widgets are imported
// // // // // // // // // import '../../../Services/model_class/bokkingmodelclass.dart';
// // // // // // // // // import '../techerall_widget/padding_information_model/padding_information_model.dart';
// // // // // // // // //
// // // // // // // // // class AcceptedValue extends StatelessWidget {
// // // // // // // // //   /// 1. List of accepted bookings received from parent widget
// // // // // // // // //   final List<BookingModel> list;
// // // // // // // // //
// // // // // // // // //   /// 2. Constructor requires the list of bookings
// // // // // // // // //   const AcceptedValue({super.key, required this.list});
// // // // // // // // //
// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     // 3. Show message if list is empty
// // // // // // // // //     if (list.isEmpty) {
// // // // // // // // //       return const Center(child: Text("No Accepted Requests Found"));
// // // // // // // // //     }
// // // // // // // // //
// // // // // // // // //     return Scaffold(
// // // // // // // // //       backgroundColor: Colors.white,
// // // // // // // // //       body: ListView.builder(
// // // // // // // // //         padding: EdgeInsets.symmetric(vertical: 24.h),
// // // // // // // // //         itemCount: list.length, // Number of accepted bookings
// // // // // // // // //         itemBuilder: (context, index) {
// // // // // // // // //           final booking = list[index]; // Each accepted booking
// // // // // // // // //
// // // // // // // // //           return Padding(
// // // // // // // // //             padding: EdgeInsets.only(bottom: 16.h),
// // // // // // // // //             child: CustomCardnew(
// // // // // // // // //               // Parent's full name from server
// // // // // // // // //               title: booking.parentDetails?.fullName ?? 'No Name',
// // // // // // // // //
// // // // // // // // //               // Class level from server
// // // // // // // // //               subtitle: 'Class ${booking.classDetails?.properties?.level ?? "N/A"}',
// // // // // // // // //
// // // // // // // // //               // Parent's profile picture or default image
// // // // // // // // //               imagePath: booking.parentDetails?.profilePicture ??
// // // // // // // // //                   'assets/backround/Rectangle 5050 (5).png',
// // // // // // // // //
// // // // // // // // //               /// Tap action to show extra options
// // // // // // // // //               fullscrenonTap: () {
// // // // // // // // //                 showDialog(
// // // // // // // // //                   context: context,
// // // // // // // // //                   builder: (ctx) => AlertDialog(
// // // // // // // // //                     backgroundColor: Colors.white,
// // // // // // // // //                     content: Extrabuttonpaddinginpormationmodel(
// // // // // // // // //                       /// Move to rejected list
// // // // // // // // //                       ontap1: () {
// // // // // // // // //                         Get.back(); // Close dialog
// // // // // // // // //                         Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
// // // // // // // // //                       },
// // // // // // // // //
// // // // // // // // //                       /// Navigate to chat with parent
// // // // // // // // //                       ontap2: () {
// // // // // // // // //                         Get.toNamed(AppRoute.convarcation);
// // // // // // // // //                       },
// // // // // // // // //
// // // // // // // // //                       buttonname1: 'Move to rejected',
// // // // // // // // //                       buttonname2: 'Chat with parent', bookingData: null,
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                 );
// // // // // // // // //               },
// // // // // // // // //             ),
// // // // // // // // //           );
// // // // // // // // //         },
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }
// // // // // // // //
// // // // // // // //
// // // // // // // // import 'package:first_project/core/route/route.dart';
// // // // // // // // import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // // // // // // import 'package:get/get.dart';
// // // // // // // //
// // // // // // // // import '../../../Services/model_class/bokkingmodelclass.dart';
// // // // // // // // import '../techerall_widget/padding_information_model/padding_information_model.dart';
// // // // // // // //
// // // // // // // // class AcceptedValue extends StatelessWidget {
// // // // // // // //   final List<BookingModel> list;
// // // // // // // //
// // // // // // // //   const AcceptedValue({super.key, required this.list});
// // // // // // // //
// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     if (list.isEmpty) {
// // // // // // // //       return const Center(child: Text("No Accepted Requests Found"));
// // // // // // // //     }
// // // // // // // //
// // // // // // // //     return Scaffold(
// // // // // // // //       backgroundColor: Colors.white,
// // // // // // // //       body: ListView.builder(
// // // // // // // //         padding: EdgeInsets.symmetric(vertical: 24.h),
// // // // // // // //         itemCount: list.length,
// // // // // // // //         itemBuilder: (context, index) {
// // // // // // // //           final booking = list[index];
// // // // // // // //
// // // // // // // //           return Padding(
// // // // // // // //             padding: EdgeInsets.only(bottom: 16.h),
// // // // // // // //             child: CustomCardnew(
// // // // // // // //               title: booking.parentDetails?.fullName ?? 'No Name',
// // // // // // // //               // সাবটাইটেল হিসেবে ক্লাস লেভেল এবং বুকিং ডেট দেখানো হচ্ছে
// // // // // // // //               subtitle: 'Class ${booking.classDetails?.properties?.level ?? "N/A"} \nDate: ${booking.bookingDate ?? ""}',
// // // // // // // //               imagePath: booking.parentDetails?.profilePicture ??
// // // // // // // //                   'assets/backround/Rectangle 5050 (5).png',
// // // // // // // //
// // // // // // // //               fullscrenonTap: () {
// // // // // // // //                 showDialog(
// // // // // // // //                   context: context,
// // // // // // // //                   builder: (ctx) => AlertDialog(
// // // // // // // //                     backgroundColor: Colors.white,
// // // // // // // //                     content: Extrabuttonpaddinginpormationmodel(
// // // // // // // //                       // ✅ এরর ফিক্স: null এর বদলে booking ডাটা পাঠানো হয়েছে
// // // // // // // //                       bookingData: booking,
// // // // // // // //                       ontap1: () {
// // // // // // // //                         Get.back();
// // // // // // // //                         Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
// // // // // // // //                       },
// // // // // // // //                       ontap2: () {
// // // // // // // //                         Get.toNamed(AppRoute.convarcation);
// // // // // // // //                       },
// // // // // // // //                       buttonname1: 'Move to rejected',
// // // // // // // //                       buttonname2: 'Chat with parent',
// // // // // // // //                     ),
// // // // // // // //                   ),
// // // // // // // //                 );
// // // // // // // //               },
// // // // // // // //             ),
// // // // // // // //           );
// // // // // // // //         },
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }
// // // // // // //
// // // // // // //
// // // // // // //
// // // // // // // import 'package:first_project/core/route/route.dart';
// // // // // // // import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // // // // // import 'package:get/get.dart';
// // // // // // //
// // // // // // // import '../../../Services/model_class/bokkingmodelclass.dart';
// // // // // // // import '../techerall_widget/padding_information_model/padding_information_model.dart';
// // // // // // //
// // // // // // // class AcceptedValue extends StatelessWidget {
// // // // // // //   final List<BookingModel> list;
// // // // // // //
// // // // // // //   const AcceptedValue({super.key, required this.list});
// // // // // // //
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     if (list.isEmpty) {
// // // // // // //       return const Center(child: Text("No Accepted Requests Found"));
// // // // // // //     }
// // // // // // //
// // // // // // //     return Scaffold(
// // // // // // //       backgroundColor: Colors.white,
// // // // // // //       body: ListView.builder(
// // // // // // //         padding: EdgeInsets.symmetric(vertical: 24.h),
// // // // // // //         itemCount: list.length,
// // // // // // //         itemBuilder: (context, index) {
// // // // // // //           final booking = list[index];
// // // // // // //
// // // // // // //           return Padding(
// // // // // // //             padding: EdgeInsets.only(bottom: 16.h),
// // // // // // //             child: CustomCardnew(
// // // // // // //               // ১. প্যারেন্টের নাম (সার্ভার থেকে)
// // // // // // //               title: booking.parentDetails?.fullName ?? 'Parent Name',
// // // // // // //
// // // // // // //               // ২. সাবটাইটেল (শুধুমাত্র ক্লাস লেভেল)
// // // // // // //               subtitle: 'Class ${booking.classDetails?.properties?.level ?? "N/A"}',
// // // // // // //
// // // // // // //               // ৩. আইকন নাম হিসেবে স্টুডেন্টের নাম (কার্ডের ভেতর দেখাবে)
// // // // // // //               iconName: booking.studentName ?? "Student",
// // // // // // //
// // // // // // //               imagePath: booking.parentDetails?.profilePicture ??
// // // // // // //                   'assets/backround/Rectangle 5050 (5).png',
// // // // // // //
// // // // // // //               fullscrenonTap: () {
// // // // // // //                 showDialog(
// // // // // // //                   context: context,
// // // // // // //                   builder: (ctx) => AlertDialog(
// // // // // // //                     backgroundColor: Colors.white,
// // // // // // //                     content: Extrabuttonpaddinginpormationmodel(
// // // // // // //                       // ✅ ডাইনামিক ডাটা পাসিং
// // // // // // //                       bookingData: booking,
// // // // // // //                       ontap1: () {
// // // // // // //                         Get.back(); // ডায়ালগ বন্ধ
// // // // // // //                         Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
// // // // // // //                       },
// // // // // // //                       ontap2: () {
// // // // // // //                         Get.toNamed(AppRoute.convarcation);
// // // // // // //                       },
// // // // // // //                       buttonname1: 'Move to rejected',
// // // // // // //                       buttonname2: 'Chat with parent',
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 );
// // // // // // //               },
// // // // // // //             ),
// // // // // // //           );
// // // // // // //         },
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // //
// // // // // //
// // // // // //
// // // // // // import 'package:first_project/core/route/route.dart';
// // // // // // import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // // // // import 'package:get/get.dart';
// // // // // //
// // // // // // import '../../../Services/model_class/bokkingmodelclass.dart';
// // // // // // import '../techerall_widget/padding_information_model/padding_information_model.dart';
// // // // // //
// // // // // // class AcceptedValue extends StatelessWidget {
// // // // // //   final List<BookingModel> list;
// // // // // //
// // // // // //   const AcceptedValue({super.key, required this.list});
// // // // // //
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     if (list.isEmpty) {
// // // // // //       return const Center(
// // // // // //         child: Text(
// // // // // //           "No Accepted Requests Found",
// // // // // //           style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
// // // // // //         ),
// // // // // //       );
// // // // // //     }
// // // // // //
// // // // // //     return Scaffold(
// // // // // //       backgroundColor: Colors.white,
// // // // // //       body: ListView.builder(
// // // // // //         padding: EdgeInsets.symmetric(vertical: 24.h),
// // // // // //         itemCount: list.length,
// // // // // //         itemBuilder: (context, index) {
// // // // // //           final booking = list[index];
// // // // // //
// // // // // //           return Padding(
// // // // // //             padding: EdgeInsets.only(bottom: 16.h),
// // // // // //             child: CustomCardnew(
// // // // // //               // ১. প্যারেন্টের নাম (প্যারেন্ট ডিটেইলস থেকে)
// // // // // //               title: booking.parentDetails?.fullName ?? 'Parent Name',
// // // // // //
// // // // // //               // ২. সাবটাইটেল (শুধুমাত্র ক্লাস লেভেল ও সাবজেক্ট)
// // // // // //               subtitle: 'Class ${booking.classDetails?.properties?.level ?? "N/A"} - ${booking.classDetails?.properties?.subject ?? ""}',
// // // // // //
// // // // // //               // ৩. কার্ডের উপর স্টুডেন্টের নাম দেখানোর জন্য (মডেলের আপডেটেড লজিক ব্যবহার)
// // // // // //               iconName: booking.studentName ?? "Student",
// // // // // //
// // // // // //               imagePath: booking.parentDetails?.profilePicture ??
// // // // // //                   'assets/backround/Rectangle 5050 (5).png',
// // // // // //
// // // // // //               fullscrenonTap: () {
// // // // // //                 // ডায়ালগ ওপেন করার লজিক
// // // // // //                 showDialog(
// // // // // //                   context: context,
// // // // // //                   barrierDismissible: true, // বাইরে ক্লিক করলে বন্ধ হবে
// // // // // //                   builder: (ctx) => AlertDialog(
// // // // // //                     insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
// // // // // //                     contentPadding: EdgeInsets.zero,
// // // // // //                     backgroundColor: Colors.white,
// // // // // //                     shape: RoundedRectangleBorder(
// // // // // //                       borderRadius: BorderRadius.circular(16.r),
// // // // // //                     ),
// // // // // //                     content: Extrabuttonpaddinginpormationmodel(
// // // // // //                       // ✅ মডেল থেকে ডাইনামিক ডাটা পাস করা হচ্ছে
// // // // // //                       bookingData: booking,
// // // // // //
// // // // // //                       ontap1: () {
// // // // // //                         Get.back(); // ডায়ালগ বন্ধ
// // // // // //                         // রিজেক্ট করার স্ক্রিনে বুকিং আইডি পাস
// // // // // //                         Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
// // // // // //                       },
// // // // // //                       ontap2: () {
// // // // // //                         // চ্যাট স্ক্রিনে নেভিগেশন
// // // // // //                         Get.toNamed(AppRoute.convarcation);
// // // // // //                       },
// // // // // //                       buttonname1: 'reject Request',
// // // // // //                       buttonname2: 'chat with parent',
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 );
// // // // // //               },
// // // // // //             ),
// // // // // //           );
// // // // // //         },
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // //
// // // // //
// // // // //
// // // // // import 'package:first_project/core/route/route.dart';
// // // // // import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // // // import 'package:get/get.dart';
// // // // //
// // // // // import '../../../Services/model_class/bokkingmodelclass.dart';
// // // // // import '../techerall_widget/padding_information_model/padding_information_model.dart';
// // // // //
// // // // // class AcceptedValue extends StatelessWidget {
// // // // //   final List<BookingModel> list;
// // // // //
// // // // //   const AcceptedValue({super.key, required this.list});
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     if (list.isEmpty) {
// // // // //       return const Center(
// // // // //         child: Text(
// // // // //           "No Accepted Requests Found",
// // // // //           style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
// // // // //         ),
// // // // //       );
// // // // //     }
// // // // //
// // // // //     return Scaffold(
// // // // //       backgroundColor: Colors.white,
// // // // //       body: ListView.builder(
// // // // //         padding: EdgeInsets.symmetric(vertical: 24.h),
// // // // //         itemCount: list.length,
// // // // //         itemBuilder: (context, index) {
// // // // //           // ✅ লজিক আপডেট: লুপের প্রতিটি ইনডেক্স থেকে আলাদা বুকিং অবজেক্ট নেওয়া হচ্ছে।
// // // // //           // এর ফলে ৩৯ নম্বর আইডির কার্ডে ক্লিক করলে ৩৯ নম্বরের ডাটাই ডায়ালগে যাবে।
// // // // //           final booking = list[index];
// // // // //
// // // // //           return Padding(
// // // // //             padding: EdgeInsets.only(bottom: 16.h),
// // // // //             child: CustomCardnew(
// // // // //               // কার্ডে প্যারেন্টের নাম (প্যারেন্ট ডিটেইলস থেকে)
// // // // //               title: booking.parentDetails?.fullName ?? 'Parent Name',
// // // // //
// // // // //               // সাবটাইটেল হিসেবে ক্লাস লেভেল ও সাবজেক্ট
// // // // //               subtitle: 'Class ${booking.classDetails?.properties?.level ?? "N/A"} - ${booking.classDetails?.properties?.subject ?? ""}',
// // // // //
// // // // //               // কার্ডের উপর ছোট করে স্টুডেন্টের নাম দেখানোর জন্য
// // // // //               iconName: booking.studentName ?? "Student",
// // // // //
// // // // //               imagePath: booking.parentDetails?.profilePicture ??
// // // // //                   'assets/backround/Rectangle 5050 (5).png',
// // // // //
// // // // //               fullscrenonTap: () {
// // // // //                 // ডায়ালগ ওপেন করার সময় নির্দিষ্ট ডাটা পাস করা হচ্ছে
// // // // //                 showDialog(
// // // // //                   context: context,
// // // // //                   barrierDismissible: true,
// // // // //                   builder: (ctx) => AlertDialog(
// // // // //                     insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
// // // // //                     contentPadding: EdgeInsets.zero,
// // // // //                     backgroundColor: Colors.white,
// // // // //                     shape: RoundedRectangleBorder(
// // // // //                       borderRadius: BorderRadius.circular(16.r),
// // // // //                     ),
// // // // //                     content: Extrabuttonpaddinginpormationmodel(
// // // // //                       // ✅ লজিক: 'booking' অবজেক্টটি পাস করার মাধ্যমে সার্ভার থেকে আসা
// // // // //                       // নির্দিষ্ট স্টুডেন্ট নাম ও বয়স ডায়ালগ বক্সে চলে যাবে।
// // // // //                       bookingData: booking,
// // // // //
// // // // //                       ontap1: () {
// // // // //                         Get.back(); // ডায়ালগ বন্ধ
// // // // //                         Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
// // // // //                       },
// // // // //                       ontap2: () {
// // // // //                         Get.toNamed(AppRoute.convarcation);
// // // // //                       },
// // // // //                       buttonname1: 'Reject Request',
// // // // //                       buttonname2: 'Chat with parent',
// // // // //                     ),
// // // // //                   ),
// // // // //                 );
// // // // //               },
// // // // //             ),
// // // // //           );
// // // // //         },
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // // //
// // // // //
// // // // //
// // // // //
// // // // import 'package:first_project/core/route/route.dart';
// // // // import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // // import 'package:get/get.dart';
// // // //
// // // // import '../../../Services/model_class/bokkingmodelclass.dart';
// // // // import '../techerall_widget/padding_information_model/padding_information_model.dart';
// // // //
// // // // class AcceptedValue extends StatelessWidget {
// // // //   final List<BookingModel> list;
// // // //
// // // //   const AcceptedValue({super.key, required this.list});
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     if (list.isEmpty) {
// // // //       return const Center(
// // // //         child: Text(
// // // //           "No Accepted Requests Found",
// // // //           style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
// // // //         ),
// // // //       );
// // // //     }
// // // //
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       body: ListView.builder(
// // // //         padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
// // // //         itemCount: list.length,
// // // //         itemBuilder: (context, index) {
// // // //           // ✅ লজিক আপডেট: ইনডেক্স অনুযায়ী ইউনিক অবজেক্ট গ্রহণ
// // // //           final booking = list[index];
// // // //
// // // //           // ডাটা প্রোটেকশন লজিক
// // // //           String parentName = booking.parentDetails?.fullName ?? 'Parent Name';
// // // //           String studentName = booking.studentName ?? "Student Information";
// // // //           String classLevel = booking.classDetails?.properties?.level ?? "N/A";
// // // //           String subjectName = booking.classDetails?.properties?.subject ?? "";
// // // //
// // // //           // ইমেজ হ্যান্ডলিং: সার্ভার ইউআরএল চেক
// // // //           String profileImg = (booking.parentDetails?.profilePicture != null &&
// // // //               booking.parentDetails!.profilePicture!.isNotEmpty)
// // // //               ? booking.parentDetails!.profilePicture!
// // // //               : 'assets/backround/Rectangle 5050 (5).png';
// // // //
// // // //           return Padding(
// // // //             padding: EdgeInsets.only(bottom: 12.h),
// // // //             child: CustomCardnew(
// // // //               title: parentName,
// // // //               subtitle: 'Class $classLevel ${subjectName.isNotEmpty ? "- $subjectName" : ""}',
// // // //
// // // //               // ✅ কার্ডের ডাইনামিক স্টুডেন্ট নাম
// // // //               iconName: studentName,
// // // //               imagePath: profileImg,
// // // //
// // // //               fullscrenonTap: () {
// // // //                 // ডায়ালগ ওপেন করার সময় সরাসরি ওই ইনডেক্সের অবজেক্ট পাস করা হচ্ছে
// // // //                 showDialog(
// // // //                   context: context,
// // // //                   barrierDismissible: true,
// // // //                   builder: (ctx) => AlertDialog(
// // // //                     insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
// // // //                     contentPadding: EdgeInsets.zero,
// // // //                     backgroundColor: Colors.white,
// // // //                     shape: RoundedRectangleBorder(
// // // //                       borderRadius: BorderRadius.circular(16.r),
// // // //                     ),
// // // //                     content: Extrabuttonpaddinginpormationmodel(
// // // //                       // ✅ লজিক: নির্দিষ্ট কার্ডের ডাটা ডায়ালগে পাঠানো হলো
// // // //                       bookingData: booking,
// // // //
// // // //                       ontap1: () {
// // // //                         Get.back(); // ডায়ালগ বন্ধ
// // // //                         // Argument হিসেবে সরাসরি Booking ID পাস করা ভালো
// // // //                         Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
// // // //                       },
// // // //                       ontap2: () {
// // // //                         // চ্যাট নেভিগেশনের জন্য বুকিং ডিটেইলস পাস করা যেতে পারে
// // // //                         Get.toNamed(AppRoute.convarcation, arguments: booking);
// // // //                       },
// // // //                       buttonname1: 'Reject Request',
// // // //                       buttonname2: 'Chat with parent',
// // // //                     ),
// // // //                   ),
// // // //                 );
// // // //               },
// // // //             ),
// // // //           );
// // // //         },
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // // import 'package:first_project/core/route/route.dart';
// // // import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // import 'package:get/get.dart';
// // //
// // // import '../../../Services/model_class/bokkingmodelclass.dart';
// // // import '../techerall_widget/padding_information_model/padding_information_model.dart';
// // //
// // // class AcceptedValue extends StatelessWidget {
// // //   final List<BookingModel> list;
// // //
// // //   const AcceptedValue({super.key, required this.list});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     if (list.isEmpty) {
// // //       return const Center(
// // //         child: Text(
// // //           "No Accepted Requests Found",
// // //           style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
// // //         ),
// // //       );
// // //     }
// // //
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       body: ListView.builder(
// // //         padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
// // //         itemCount: list.length,
// // //         itemBuilder: (context, index) {
// // //           final booking = list[index];
// // //
// // //           // ডাটা প্রোটেকশন
// // //           String parentName = booking.parentDetails?.fullName ?? 'Parent Name';
// // //           String classLevel = booking.classDetails?.properties?.level ?? "N/A";
// // //           String subjectName = booking.classDetails?.properties?.subject ?? "";
// // //
// // //           // ইমেজ হ্যান্ডলিং (সার্ভার থেকে ছবি না থাকলে ডিফল্ট ছবি দেখাবে)
// // //           String profileImg = (booking.parentDetails?.profilePicture != null &&
// // //               booking.parentDetails!.profilePicture!.isNotEmpty)
// // //               ? booking.parentDetails!.profilePicture!
// // //               : 'assets/backround/Rectangle 5050 (5).png';
// // //
// // //           return Padding(
// // //             padding: EdgeInsets.only(bottom: 12.h),
// // //             child: CustomCardnew(
// // //               // ১. শুধু প্যারেন্টের নাম দেখাচ্ছে
// // //               title: parentName,
// // //
// // //               // ২. শুধু ক্লাস লেভেল দেখাচ্ছে (সাবজেক্টসহ)
// // //               subtitle: 'Class $classLevel ${subjectName.isNotEmpty ? "- $subjectName" : ""}',
// // //
// // //               // ৩. শুধু প্রোফাইল ছবি দেখাচ্ছে
// // //               imagePath: profileImg,
// // //
// // //               // কার্ডে ক্লিক করলে ডায়ালগ ওপেন হবে
// // //               fullscrenonTap: () {
// // //                 showDialog(
// // //                   context: context,
// // //                   barrierDismissible: true,
// // //                   builder: (ctx) => AlertDialog(
// // //                     insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
// // //                     contentPadding: EdgeInsets.zero,
// // //                     backgroundColor: Colors.white,
// // //                     shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.circular(16.r),
// // //                     ),
// // //                     content: Extrabuttonpaddinginpormationmodel(
// // //                       // ✅ লজিক: ডায়ালগের ভেতরে স্টুডেন্টের নাম ও বয়স দেখানোর জন্য পুরো অবজেক্ট পাঠানো হচ্ছে
// // //                       bookingData: booking,
// // //                       ontap1: () {
// // //                         Get.back();
// // //                         Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
// // //                       },
// // //                       ontap2: () {
// // //                         Get.toNamed(AppRoute.convarcation, arguments: booking);
// // //                       },
// // //                       buttonname1: 'Reject Request',
// // //                       buttonname2: 'Chat with parent',
// // //                     ),
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// //
// // import 'package:first_project/core/route/route.dart';
// // import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';
// //
// // import '../../../Services/model_class/bokkingmodelclass.dart';
// //
// // class PendingValue extends StatelessWidget {
// //   final List<BookingModel> list;
// //
// //   const PendingValue({super.key, required this.list});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     if (list.isEmpty) {
// //       return const Center(
// //         child: Text(
// //           "No Pending Requests Found",
// //           style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
// //         ),
// //       );
// //     }
// //
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: ListView.builder(
// //         padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
// //         itemCount: list.length,
// //         itemBuilder: (context, index) {
// //           final booking = list[index];
// //
// //           // ডাটা প্রোটেকশন
// //           String parentName = booking.parentDetails?.fullName ?? 'Parent Name';
// //           String classLevel = booking.classDetails?.properties?.level ?? "N/A";
// //           String subjectName = booking.classDetails?.properties?.subject ?? "";
// //           String studentName = booking.studentName ?? "Student 1";
// //           String studentAge = (booking.studentAge != null && booking.studentAge! > 0)
// //               ? "${booking.studentAge} years old"
// //               : "16 years old";
// //
// //           // ইমেজ হ্যান্ডলিং
// //           String profileImg = (booking.parentDetails?.profilePicture != null &&
// //               booking.parentDetails!.profilePicture!.isNotEmpty)
// //               ? booking.parentDetails!.profilePicture!
// //               : 'assets/backround/Rectangle 5050 (5).png';
// //
// //           return Padding(
// //             padding: EdgeInsets.only(bottom: 12.h),
// //             child: CustomCardnew(
// //               title: parentName,
// //               subtitle: 'Class $classLevel ${subjectName.isNotEmpty ? "- $subjectName" : ""}',
// //               imagePath: profileImg,
// //               fullscrenonTap: () {
// //                 // সরাসরি স্ক্রিনের ভেতরেই ডায়ালগ ডিজাইন করা হয়েছে
// //                 showDialog(
// //                   context: context,
// //                   barrierDismissible: true,
// //                   builder: (ctx) => AlertDialog(
// //                     insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
// //                     contentPadding: EdgeInsets.zero,
// //                     backgroundColor: Colors.white,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(16.r),
// //                     ),
// //                     content: Container(
// //                       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
// //                       child: Column(
// //                         mainAxisSize: MainAxisSize.min,
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           // টাইটেল
// //                           Center(
// //                             child: Text(
// //                               'Student Information',
// //                               style: TextStyle(
// //                                 fontSize: 20.sp,
// //                                 fontWeight: FontWeight.bold,
// //                                 color: Colors.black,
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(height: 30.h),
// //
// //                           // স্টুডেন্ট নাম সেকশন
// //                           Text(
// //                             'What is the student name?',
// //                             style: TextStyle(color: Colors.grey, fontSize: 14.sp),
// //                           ),
// //                           SizedBox(height: 4.h),
// //                           Text(
// //                             studentName,
// //                             style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
// //                           ),
// //
// //                           SizedBox(height: 20.h),
// //
// //                           // স্টুডেন্ট বয়স সেকশন
// //                           Text(
// //                             'What is the student age?',
// //                             style: TextStyle(color: Colors.grey, fontSize: 14.sp),
// //                           ),
// //                           SizedBox(height: 4.h),
// //                           Text(
// //                             studentAge,
// //                             style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
// //                           ),
// //
// //                           SizedBox(height: 30.h),
// //
// //                           // রিজেক্ট এবং একসেপ্ট বাটন
// //                           Row(
// //                             children: [
// //                               Expanded(
// //                                 child: OutlinedButton(
// //                                   onPressed: () {
// //                                     Get.back();
// //                                     Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
// //                                   },
// //                                   style: OutlinedButton.styleFrom(
// //                                     side: const BorderSide(color: Colors.red),
// //                                     padding: EdgeInsets.symmetric(vertical: 12.h),
// //                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
// //                                   ),
// //                                   child: Text(
// //                                     'Reject',
// //                                     style: TextStyle(color: Colors.red, fontSize: 16.sp, fontWeight: FontWeight.bold),
// //                                   ),
// //                                 ),
// //                               ),
// //                               SizedBox(width: 12.w),
// //                               Expanded(
// //                                 child: ElevatedButton(
// //                                   onPressed: () {
// //                                     // Accept Request logic এখানে হবে
// //                                     Get.back();
// //                                   },
// //                                   style: ElevatedButton.styleFrom(
// //                                     backgroundColor: const Color(0xff2563EB),
// //                                     padding: EdgeInsets.symmetric(vertical: 12.h),
// //                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
// //                                   ),
// //                                   child: Text(
// //                                     'Accept Request',
// //                                     style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //
// //                           SizedBox(height: 12.h),
// //
// //                           // চ্যাট উইথ প্যারেন্ট বাটন
// //                           SizedBox(
// //                             width: double.infinity,
// //                             child: OutlinedButton(
// //                               onPressed: () {
// //                                 Get.back();
// //                                 Get.toNamed(AppRoute.convarcation, arguments: booking);
// //                               },
// //                               style: OutlinedButton.styleFrom(
// //                                 side: const BorderSide(color: Color(0xff2563EB)),
// //                                 padding: EdgeInsets.symmetric(vertical: 12.h),
// //                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
// //                               ),
// //                               child: Text(
// //                                 'Chat with parent',
// //                                 style: TextStyle(color: const Color(0xff2563EB), fontSize: 16.sp, fontWeight: FontWeight.bold),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
//
//
//
// import 'package:first_project/core/route/route.dart';
// import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../../Services/model_class/bokkingmodelclass.dart';
//
// class PendingValue extends StatelessWidget {
//   final List<BookingModel> list;
//
//   const PendingValue({super.key, required this.list});
//
//   @override
//   Widget build(BuildContext context) {
//     if (list.isEmpty) {
//       return const Center(
//         child: Text(
//           "No Pending Requests Found",
//           style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
//         ),
//       );
//     }
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView.builder(
//         padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
//         itemCount: list.length,
//         itemBuilder: (context, index) {
//           // ✅ লজিক: ইনডেক্স অনুযায়ী প্রতিটি আলাদা বুকিং অবজেক্ট নেওয়া হচ্ছে
//           final booking = list[index];
//
//           // ডাটা প্রোটেকশন ও ডাইনামিক ডাটা এক্সট্রাকশন
//           String parentName = booking.parentDetails?.fullName ?? 'Parent Name';
//           String classLevel = booking.classDetails?.properties?.level ?? "N/A";
//           String subjectName = booking.classDetails?.properties?.subject ?? "";
//
//           // মডেলের ডাইনামিক লজিক ব্যবহার করে স্টুডেন্ট নাম ও বয়স নেওয়া হচ্ছে
//           String studentName = booking.studentName ?? "Student 1";
//           String studentAge = (booking.studentAge != null && booking.studentAge! > 0)
//               ? "${booking.studentAge} years old"
//               : "16 years old";
//
//           // ইমেজ হ্যান্ডলিং
//           String profileImg = (booking.parentDetails?.profilePicture != null &&
//               booking.parentDetails!.profilePicture!.isNotEmpty)
//               ? booking.parentDetails!.profilePicture!
//               : 'assets/backround/Rectangle 5050 (5).png';
//
//           return Padding(
//             padding: EdgeInsets.only(bottom: 12.h),
//             child: CustomCardnew(
//               title: parentName,
//               subtitle: 'Class $classLevel ${subjectName.isNotEmpty ? "- $subjectName" : ""}',
//               imagePath: profileImg,
//               fullscrenonTap: () {
//                 // ✅ সরাসরি ডায়ালগ ডিজাইন যা আপনার ইমেজের সাথে মিলবে
//                 showDialog(
//                   context: context,
//                   barrierDismissible: true,
//                   builder: (ctx) => AlertDialog(
//                     insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
//                     contentPadding: EdgeInsets.zero,
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16.r),
//                     ),
//                     content: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Center(
//                             child: Text(
//                               'Student Information',
//                               style: TextStyle(
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 30.h),
//
//                           Text(
//                             'What is the student name?',
//                             style: TextStyle(color: Colors.grey, fontSize: 14.sp),
//                           ),
//                           SizedBox(height: 4.h),
//                           Text(
//                             studentName, // ডাইনামিক নাম
//                             style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
//                           ),
//
//                           SizedBox(height: 20.h),
//
//                           Text(
//                             'What is the student age?',
//                             style: TextStyle(color: Colors.grey, fontSize: 14.sp),
//                           ),
//                           SizedBox(height: 4.h),
//                           Text(
//                             studentAge, // ডাইনামিক বয়স
//                             style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
//                           ),
//
//                           SizedBox(height: 30.h),
//
//                           // রিজেক্ট এবং একসেপ্ট বাটন (Row)
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: OutlinedButton(
//                                   onPressed: () {
//                                     Get.back();
//                                     Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
//                                   },
//                                   style: OutlinedButton.styleFrom(
//                                     side: const BorderSide(color: Colors.red),
//                                     padding: EdgeInsets.symmetric(vertical: 12.h),
//                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
//                                   ),
//                                   child: Text(
//                                     'Reject',
//                                     style: TextStyle(color: Colors.red, fontSize: 16.sp, fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 12.w),
//                               Expanded(
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     Get.back();
//                                     // Accept API কল এখানে যুক্ত করা যাবে
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color(0xff2563EB),
//                                     padding: EdgeInsets.symmetric(vertical: 12.h),
//                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
//                                   ),
//                                   child: Text(
//                                     'Accept Request',
//                                     style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           SizedBox(height: 12.h),
//
//                           // চ্যাট বাটন (Full Width)
//                           SizedBox(
//                             width: double.infinity,
//                             child: OutlinedButton(
//                               onPressed: () {
//                                 Get.back();
//                                 Get.toNamed(AppRoute.convarcation, arguments: booking);
//                               },
//                               style: OutlinedButton.styleFrom(
//                                 side: const BorderSide(color: Color(0xff2563EB)),
//                                 padding: EdgeInsets.symmetric(vertical: 12.h),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
//                               ),
//                               child: Text(
//                                 'Chat with parent',
//                                 style: TextStyle(color: const Color(0xff2563EB), fontSize: 16.sp, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


>>>>>>> origin/main
import 'package:first_project/core/route/route.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Services/model_class/bokkingmodelclass.dart';
import '../techerall_widget/padding_information_model/padding_information_model.dart';

<<<<<<< HEAD
//======================= Accepted Booking List ==========================
class AcceptedValue extends StatelessWidget {
  // List of accepted bookings from server
  final List<BookingModel> list;

=======
class AcceptedValue extends StatelessWidget {
  // ✅ ১. ডাটা রিসিভ করার জন্য এই ভেরিয়েবলটি অবশ্যই থাকতে হবে
  final List<BookingModel> list;

  // ✅ ২. কনস্ট্রাক্টরে 'required this.list' যোগ করা হয়েছে যাতে Bokingtabbar থেকে ডাটা আসতে পারে
>>>>>>> origin/main
  const AcceptedValue({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD

    //======================= Empty State ==========================
=======
>>>>>>> origin/main
    if (list.isEmpty) {
      return const Center(
        child: Text(
          "No Accepted Requests Found",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
<<<<<<< HEAD

      //======================= Accepted Booking List ==========================
=======
>>>>>>> origin/main
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        itemCount: list.length,
        itemBuilder: (context, index) {
<<<<<<< HEAD

          // Get unique booking object for this card
          final booking = list[index];

          //======================= Data Protection (Null Safety) ==========================
          String parentName =
              booking.parentDetails?.fullName ?? 'Parent Name';

          String classLevel =
              booking.classDetails?.properties?.level ?? "N/A";

          // Handle profile image (server image or default)
          String profileImg =
          (booking.parentDetails?.profilePicture != null &&
=======
          // ✅ লজিক: ইনডেক্স অনুযায়ী প্রতিটি আলাদা বুকিং অবজেক্ট নেওয়া হচ্ছে
          final booking = list[index];

          // ডাটা প্রোটেকশন লজিক
          String parentName = booking.parentDetails?.fullName ?? 'Parent Name';
          String classLevel = booking.classDetails?.properties?.level ?? "N/A";
          String subjectName = booking.classDetails?.properties?.subject ?? "";

          // ইমেজ হ্যান্ডলিং: সার্ভার ইউআরএল চেক
          String profileImg = (booking.parentDetails?.profilePicture != null &&
>>>>>>> origin/main
              booking.parentDetails!.profilePicture!.isNotEmpty)
              ? booking.parentDetails!.profilePicture!
              : 'assets/backround/Rectangle 5050 (5).png';

          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
<<<<<<< HEAD

            //======================= Booking Card ==========================
            child: CustomCardnew(
              // Parent name shown on card
              title: parentName,

              // Only class level shown (subject removed)
              subtitle: 'Class $classLevel',

              // Parent profile picture
              imagePath: profileImg,

              //======================= Card Click Action ==========================
              fullscrenonTap: () {
                // When card is tapped, show student info dialog
=======
            child: CustomCardnew(
              // কার্ডে শুধু প্যারেন্টের নাম, ক্লাস এবং ছবি থাকবে
              title: parentName,
              subtitle: 'Class $classLevel ${subjectName.isNotEmpty ? "- $subjectName" : ""}',
              imagePath: profileImg,

              fullscrenonTap: () {
                // ✅ কার্ডে ক্লিক করলে ডায়ালগ ওপেন হবে এবং নির্দিষ্ট ডাটা পাস হবে
>>>>>>> origin/main
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (ctx) => AlertDialog(
<<<<<<< HEAD
                    insetPadding:
                    EdgeInsets.symmetric(horizontal: 20.w),
=======
                    insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
>>>>>>> origin/main
                    contentPadding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
<<<<<<< HEAD

                    //======================= Student Information Dialog ==========================
                    content: Extrabuttonpaddinginpormationmodel(
                      // Pass unique booking data to dialog
                      bookingData: booking,

                      // Reject accepted request
                      ontap1: () {
                        Get.back();
                        Get.toNamed(
                          AppRoute.cancelModel,
                          arguments: booking.id,
                        );
                      },

                      // Chat with parent
                      ontap2: () {
                        Get.toNamed(
                          AppRoute.convarcation,
                          arguments: booking,
                        );
                      },

=======
                    content: Extrabuttonpaddinginpormationmodel(
                      // ✅ লজিক: নির্দিষ্ট কার্ডের ডাটা ডায়ালগে পাঠানো হলো
                      bookingData: booking,
                      ontap1: () {
                        Get.back(); // ডায়ালগ বন্ধ
                        Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
                      },
                      ontap2: () {
                        Get.toNamed(AppRoute.convarcation, arguments: booking);
                      },
>>>>>>> origin/main
                      buttonname1: 'Reject Request',
                      buttonname2: 'Chat with parent',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> origin/main
