import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Services/model_class/bokkingmodelclass.dart';
import '../../core/route/route.dart';
import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/padding_information_model/padding_information_model.dart';

class Pendingvalue extends StatelessWidget {
  //======================= Variables ==========================
  final List<BookingModel> list;

  //======================= Constructor ==========================
  const Pendingvalue({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    //======================= Empty Check ==========================
    if (list.isEmpty) {
      return const Center(
        child: Text(
          "No Pending Requests Found",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      );
    }

    //======================= ListView Builder ==========================
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        itemCount: list.length,
        itemBuilder: (context, index) {
          //======================= Get Booking Object ==========================
          final booking = list[index];

          //======================= Data Protection ==========================
          String parentName = booking.parentDetails?.fullName ?? 'Parent Name';
          String classLevel = booking.classDetails?.properties?.level ?? "N/A";

          //======================= Profile Image Check ==========================
          String profileImg = (booking.parentDetails?.profilePicture != null &&
              booking.parentDetails!.profilePicture!.isNotEmpty)
              ? booking.parentDetails!.profilePicture!
              : 'assets/backround/Rectangle 5050 (5).png';

          //======================= Card Widget ==========================
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: CustomCardnew(
              //======================= Card Title ==========================
              title: parentName,

              //======================= Card Subtitle ==========================
              subtitle: 'Class $classLevel',

              //======================= Card Image ==========================
              imagePath: profileImg,

              //======================= Card OnTap ==========================
              fullscrenonTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (ctx) => AlertDialog(
                    insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    contentPadding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r)),
                    content: Paddinginpormationmodel(
                      //======================= Pass Booking Object to Dialog ==========================
                      booking: booking,
                      reject: () {
                        Get.back();
                        Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
                      },
                      chat: () {
                        Get.toNamed(AppRoute.convarcation, arguments: booking);
                      },
                      accept: () {
                        _handleAcceptRequest(booking.id);
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

  //======================= Accept Request Handler ==========================
  void _handleAcceptRequest(int? id) {
    if (id == null) return;

    Get.showSnackbar(
      GetSnackBar(
        title: 'Processing Request',
        message: 'Requesting server for ID: $id',
        backgroundColor: Colors.blueAccent,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
