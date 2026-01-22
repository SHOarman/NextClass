import 'package:first_project/core/route/route.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Services/model_class/bokkingmodelclass.dart';
import '../techerall_widget/padding_information_model/padding_information_model.dart';

//======================= Accepted Value (Same Logic) ==========================
class AcceptedValue extends StatelessWidget {
  final List<BookingModel> list;

  const AcceptedValue({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final booking = list[index];

          // Data Mapping
          String parentName = booking.parentDetails?.fullName ?? 'Parent Name';
          String classLevel = booking.classDetails?.properties?.level ?? "N/A";
          String profileImg = (booking.parentDetails?.profilePicture != null &&
              booking.parentDetails!.profilePicture!.isNotEmpty)
              ? booking.parentDetails!.profilePicture!
              : 'assets/backround/Rectangle 5050 (5).png';

          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: CustomCardnew(
              title: parentName,
              subtitle: 'Class $classLevel', // Removed Subject
              imagePath: profileImg,
              // Student Name removed from card (iconName)
              fullscrenonTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (ctx) => AlertDialog(
                    insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    contentPadding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    content: Extrabuttonpaddinginpormationmodel(
                      bookingData: booking,
                      ontap1: () {
                        Get.back();
                        Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
                      },
                      ontap2: () {
                        Get.toNamed(AppRoute.convarcation, arguments: booking);
                      },
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
}

//======================= Pending Value (Same Logic) ==========================
class PendingValue extends StatelessWidget {
  final List<BookingModel> list;

  const PendingValue({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return const Center(
        child: Text(
          "No Pending Requests Found",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final booking = list[index];

          // Data Mapping
          String parentName = booking.parentDetails?.fullName ?? 'Parent Name';
          String classLevel = booking.classDetails?.properties?.level ?? "N/A";
          String profileImg = (booking.parentDetails?.profilePicture != null &&
              booking.parentDetails!.profilePicture!.isNotEmpty)
              ? booking.parentDetails!.profilePicture!
              : 'assets/backround/Rectangle 5050 (5).png';

          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: CustomCardnew(
              title: parentName,
              subtitle: 'Class $classLevel', // Removed Subject
              imagePath: profileImg,
              // Student Name removed from card (iconName)
              fullscrenonTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (ctx) => AlertDialog(
                    insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    contentPadding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    content: Paddinginpormationmodel(
                      booking: booking,
                      reject: () {
                        Get.back();
                        Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
                      },
                      chat: () {
                        Get.toNamed(AppRoute.convarcation, arguments: booking);
                      },
                      accept: () {
                        // Accept Logic
                        Get.back();
                      },
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