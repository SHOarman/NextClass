<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../Services/model_class/bokkingmodelclass.dart';
import '../../core/route/route.dart';
import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/padding_information_model/padding_information_model.dart';

//======================= Rejected Booking List ==========================
class RejectedValue extends StatelessWidget {
  // List of rejected booking data from server
  final List<BookingModel> list;

=======
// import 'package:first_project/teacher_presentScreen/techerall_widget/padding_information_model/padding_information_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
//
// import '../../core/route/route.dart';
// import '../techerall_widget/customcard/customcard.dart';
//
// class RejectedValue extends StatelessWidget {
//   const RejectedValue({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 24.h),
//
//             CustomCardnew(
//               title: 'Tutor name',
//               subtitle: 'Class 1',
//               imagePath: 'assets/backround/Rectangle 5050 (5).png',
//               iconName: 'reject by you',
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (ctx) => AlertDialog(
//                     backgroundColor: Colors.white,
//                     content: Rejecationpaddinginpormationmodel(
//                       ontap1: () {
//                         Get.toNamed(AppRoute.convarcation);
//                       },
//                       ontap2: () {
//                         Get.back();
//                       },
//                       buttonname1: 'chat with parent',
//                       buttonname2: 'Delete from list',
//                     ),
//                   ),
//                 );
//                 //content:
//               },
//             ),
//             SizedBox(height: 16.h),
//
//             CustomCardnew(
//               title: 'Smith Family',
//               subtitle: 'Class 2',
//               imagePath: 'assets/backround/Rectangle 5050 (2).png',
//               iconName: 'reject by you',
//               onTap: () {
//                 // print('reject');
//               },
//             ),
//             SizedBox(height: 16.h),
//             CustomCardnew(
//               title: 'Tutor name',
//               subtitle: 'Class 1',
//               imagePath: 'assets/backround/Rectangle 5050 (5).png',
//               iconName: 'reject by you',
//               onTap: () {
//                 // print('reject');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:first_project/teacher_presentScreen/techerall_widget/padding_information_model/padding_information_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Services/model_class/bokkingmodelclass.dart';
import '../../core/route/route.dart';
import '../techerall_widget/customcard/customcard.dart';

class RejectedValue extends StatelessWidget {
  // ১. রিজেক্টেড ডাটা রিসিভ করার জন্য লিস্ট ভেরিয়েবল
  final List<BookingModel> list;

  // ২. কনস্ট্রাক্টরে রিকোয়ার্ড লিস্ট যুক্ত করা হয়েছে
>>>>>>> origin/main
  const RejectedValue({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    //======================= Empty State ==========================
    if (list.isEmpty) {
      return const Center(
        child: Text("No Rejected Requests Found"),
      );
=======
    // যদি লিস্ট খালি থাকে
    if (list.isEmpty) {
      return const Center(child: Text("No Rejected Requests Found"));
>>>>>>> origin/main
    }

    return Scaffold(
      backgroundColor: Colors.white,
<<<<<<< HEAD

      //======================= Rejected Booking List ==========================
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        itemCount: list.length,
        itemBuilder: (context, index) {

          // Get unique booking object for this card
          final booking = list[index];

          //======================= Data Protection (Null Safety) ==========================
          String parentName =
              booking.parentDetails?.fullName ?? 'Parent Name';

          String classLevel =
              booking.classDetails?.properties?.level ?? "N/A";

          // Check profile image from server, otherwise use default image
          String profileImg =
          (booking.parentDetails?.profilePicture != null &&
              booking.parentDetails!.profilePicture!.isNotEmpty)
              ? booking.parentDetails!.profilePicture!
              : 'assets/backround/Rectangle 5050 (5).png';

          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),

            //======================= Booking Card ==========================
            child: CustomCardnew(
              // Parent name shown on card
              title: parentName,

              // Only class level shown (subject removed)
              subtitle: 'Class $classLevel',

              // Parent profile picture
              imagePath: profileImg,

              // Status text on card
              iconName: 'Rejected by you',

              //======================= Card Click Action ==========================
              fullscrenonTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (ctx) => AlertDialog(
                    insetPadding:
                    EdgeInsets.symmetric(horizontal: 20.w),
                    contentPadding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),

                    //======================= Rejection Dialog ==========================
                    content: Rejecationpaddinginpormationmodel(
                      // Pass unique booking data to dialog
                      bookingData: booking,

                      // Chat with parent action
                      ontap1: () {
                        Get.toNamed(
                          AppRoute.convarcation,
                          arguments: booking,
                        );
                      },

                      // Delete from rejected list (if needed)
                      ontap2: () {
                        Get.back();
                      },

                      buttonname1: 'Chat with parent',
=======
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        itemCount: list.length, // সার্ভার থেকে আসা রিজেক্টেড ডাটার সংখ্যা
        itemBuilder: (context, index) {
          final booking = list[index]; // প্রতিটি রিজেক্টেড বুকিং অবজেক্ট

          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: CustomCardnew(
              // সার্ভার থেকে প্যারেন্টের নাম দেখাচ্ছে
              title: booking.parentDetails?.fullName ?? 'No Name',

              // সার্ভার থেকে ক্লাসের লেভেল দেখাচ্ছে
              subtitle: 'Class ${booking.classDetails?.properties?.level ?? "N/A"}',

              // সার্ভার থেকে প্রোফাইল ছবি দেখাচ্ছে
              imagePath: booking.parentDetails?.profilePicture ?? 'assets/backround/Rectangle 5050 (5).png',

              // আপনার চাহিদা অনুযায়ী আইকন নাম ফিক্সড রাখা হয়েছে
              iconName: 'reject by you',

              fullscrenonTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.white,
                    content: Rejecationpaddinginpormationmodel(
                      ontap1: () {
                        // চ্যাট স্ক্রিনে নেভিগেট করা
                        Get.toNamed(AppRoute.convarcation);
                      },
                      ontap2: () {
                        // লিস্ট থেকে সরানোর লজিক (প্রয়োজনে API কল করতে পারেন)
                        Get.back();
                      },
                      buttonname1: 'chat with parent',
>>>>>>> origin/main
                      buttonname2: 'Delete from list',
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
