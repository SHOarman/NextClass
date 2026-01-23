import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Services/model_class/bokkingmodelclass.dart';
import '../../../core/route/route.dart';
import '../../Services/Controller_view/ConfirmBookingController.dart';
import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/padding_information_model/padding_information_model.dart';

//========================= Pending Requests Widget =========================
class Pendingvalue extends StatelessWidget {
  final List<BookingModel> list;

  const Pendingvalue({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    // 1. Inject or get the confirm booking controller
    final ConfirmBookingController confirmController = Get.put(ConfirmBookingController());

    // 2. Show message if no pending requests
    if (list.isEmpty) {
      return const Center(
        child: Text(
          "No Pending Requests Found",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      );
    }

    // 3. List of pending requests
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final booking = list[index];

          //========================= Data Mapping =========================
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
                //========================= Open Details Dialog =========================
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

                      // Reject booking: navigate to reason input screen
                      reject: () {
                        Get.back(); // close dialog
                        Get.toNamed(AppRoute.resonwigets, arguments: booking.id);
                      },

                      // Chat with parent
                      chat: () {
                        Get.toNamed(AppRoute.convarcation, arguments: booking);
                      },

                      // Accept booking via controller
                      accept: () {
                        if (booking.id != null) {
                          confirmController.confirmBooking(booking.id!, context);
                        }
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
