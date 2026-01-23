import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Services/model_class/bokkingmodelclass.dart';
import '../../../core/route/route.dart';
import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/padding_information_model/padding_information_model.dart';

//========================= Accepted Value Widget ==========================
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

          //========================= Data Mapping ==========================
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
              subtitle: 'Class $classLevel',
              imagePath: profileImg,
              fullscrenonTap: () {
                //========================= Show Details Dialog ==========================
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
                        // Navigate to reject reason screen
                        Get.toNamed(AppRoute.resonwigets, arguments: booking.id);
                      },
                      ontap2: () {
                        // Navigate to chat screen
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
