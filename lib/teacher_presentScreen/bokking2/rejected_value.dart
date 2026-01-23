import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Services/Controller_view/DeleteBookingController.dart';
import '../../Services/model_class/bokkingmodelclass.dart';
import '../../core/route/route.dart';
import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/padding_information_model/padding_information_model.dart';

class RejectedValue extends StatelessWidget {
  final List<BookingModel> list;
  const RejectedValue({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    // ✅ ডিলিট কন্ট্রোলার ইনজেক্ট করা (যাতে একই ইনস্ট্যান্স সব কার্ডে কাজ করে)
    final DeleteBookingController deleteController = Get.put(DeleteBookingController());

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
          final booking = list[index];

          // ডাটা ম্যাপিং
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
              iconName: 'Rejected by you',
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
                    content: Rejecationpaddinginpormationmodel(
                      bookingData: booking,
                      ontap1: () {


                        if (booking.id != null) {
                          deleteController.deleteOrRejectBooking(booking.id!);
                        }

                        print('lkakd');
                       // Get.toNamed(AppRoute.convarcation, arguments: booking);
                      },
                      ontap2: () {
                        print('asjf');
                        debugPrint("Delete button clicked for ID: ${booking.id}"); // এটি দিয়ে টেস্ট করুন
                        if (booking.id != null) {
                          deleteController.deleteOrRejectBooking(booking.id!);
                        }
                      },
                      buttonname1: 'Chat with parent',
                      buttonname2: 'Delete from list',
                    ),                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}