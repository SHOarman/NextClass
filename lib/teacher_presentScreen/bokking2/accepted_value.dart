import 'package:first_project/core/route/route.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Services/model_class/bokkingmodelclass.dart';
import '../techerall_widget/padding_information_model/padding_information_model.dart';

//======================= Accepted Booking List ==========================
class AcceptedValue extends StatelessWidget {
  // List of accepted bookings from server
  final List<BookingModel> list;

  const AcceptedValue({super.key, required this.list});

  @override
  Widget build(BuildContext context) {

    //======================= Empty State ==========================
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

      //======================= Accepted Booking List ==========================
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

          // Handle profile image (server image or default)
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

              //======================= Card Click Action ==========================
              fullscrenonTap: () {
                // When card is tapped, show student info dialog
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
