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
  const RejectedValue({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    // যদি লিস্ট খালি থাকে
    if (list.isEmpty) {
      return const Center(child: Text("No Rejected Requests Found"));
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
}