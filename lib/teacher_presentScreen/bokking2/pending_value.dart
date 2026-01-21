import 'package:first_project/core/route/route.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Services/model_class/bokkingmodelclass.dart';
// ✅ নিশ্চিত করুন সঠিক মডেলটি ইমপোর্ট করা আছে
import '../techerall_widget/padding_information_model/padding_information_model.dart';

class Pendingvalue extends StatelessWidget {
  final List<BookingModel> list;

  const Pendingvalue({super.key, required this.list});

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
          // ✅ প্রতিটি ইনডেক্সের জন্য আলাদা বুকিং অবজেক্ট নেওয়া হচ্ছে
          final booking = list[index];

          // ডাটা প্রোটেকশন (Null handling)
          String parentName = booking.parentDetails?.fullName ?? 'Parent Name';
          String studentName = booking.studentName ?? "Student Information";
          String classLevel = booking.classDetails?.properties?.level ?? "N/A";
          String subjectName = booking.classDetails?.properties?.subject ?? "";

          // ইমেজ ইউআরএল চেক
          String profileImg = (booking.parentDetails?.profilePicture != null &&
              booking.parentDetails!.profilePicture!.isNotEmpty)
              ? booking.parentDetails!.profilePicture!
              : 'assets/backround/Rectangle 5050 (5).png';

          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: CustomCardnew(
              title: parentName,
              subtitle: 'Class $classLevel ${subjectName.isNotEmpty ? "- $subjectName" : ""}',
              iconName: studentName,
              imagePath: profileImg,

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
                    // ✅ লজিক আপডেট: ডায়ালগ বক্সে ওই নির্দিষ্ট কার্ডের ডাটা পাস করা হচ্ছে
                    content: Paddinginpormationmodel(
                      // এখানে আপনার Paddinginpormationmodel-এ bookingData প্যারামিটারটি যোগ করতে হবে
                      // যদি আপনি Extrabutton... উইজেটটি ব্যবহার করেন তবে সেটি দিন
                      reject: () {
                        Get.back();
                        Get.toNamed(AppRoute.cancelModel, arguments: booking.id);
                      },
                      chat: () {
                        // চ্যাট স্ক্রিনে নির্দিষ্ট প্যারেন্টের সাথে কথা বলার জন্য আইডি পাস
                        Get.toNamed(AppRoute.convarcation, arguments: booking);
                      },
                      accept: () {
                        // সাকসেস মেসেজ এবং এপিআই কল
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