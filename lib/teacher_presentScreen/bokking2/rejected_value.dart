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

  const RejectedValue({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    //======================= Empty State ==========================
    if (list.isEmpty) {
      return const Center(
        child: Text("No Rejected Requests Found"),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,

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
