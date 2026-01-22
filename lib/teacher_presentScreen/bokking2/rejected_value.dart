import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Services/model_class/bokkingmodelclass.dart';
import '../../core/route/route.dart';
import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/padding_information_model/padding_information_model.dart';

//======================= Rejected Booking List ==========================
class RejectedValue extends StatelessWidget {
  // 1. List of rejected booking data received from the controller
  final List<BookingModel> list;

  // 2. Required constructor for the list
  const RejectedValue({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    // Empty state logic
    if (list.isEmpty) {
      return const Center(
        child: Text(
          "No Rejected Requests Found",
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
          // Get unique booking object for this specific list item
          final booking = list[index];

          // Data Protection (Null Safety)
          String parentName = booking.parentDetails?.fullName ?? 'Parent Name';
          String classLevel = booking.classDetails?.properties?.level ?? "N/A";

          // Image Logic: Check server URL, fallback to asset
          String profileImg = (booking.parentDetails?.profilePicture != null &&
              booking.parentDetails!.profilePicture!.isNotEmpty)
              ? booking.parentDetails!.profilePicture!
              : 'assets/backround/Rectangle 5050 (5).png';

          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: CustomCardnew(
              title: parentName,
              subtitle: 'Class $classLevel',
              imagePath: profileImg,
              iconName: 'Rejected by you',

              // Action when clicking the card
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
                    // Using the Information Dialog for Rejections
                    content: Rejecationpaddinginpormationmodel(
                      // Pass unique booking data so the dialog shows the right info
                      bookingData: booking,

                      ontap1: () {
                        // Navigate to chat with the specific booking data
                        Get.toNamed(AppRoute.convarcation, arguments: booking);
                      },
                      ontap2: () {
                        // Logic to close or handle "Delete from list"
                        Get.back();
                      },
                      buttonname1: 'Chat with parent',
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