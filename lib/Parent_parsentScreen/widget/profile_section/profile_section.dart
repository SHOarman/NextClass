import 'dart:io';
import 'package:first_project/Parent_parsentScreen/profile_Screen/profileController/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:first_project/core/route/general_controller/location_controller.dart';
import 'package:first_project/core/route/route.dart'; // ✅ AppRoute ব্যবহারের জন্য

import '../../../Services/api_Services/api_services.dart';

class Profilesecation extends StatelessWidget {
  const Profilesecation({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Initialize Profile controller
    final ProfileController profileController = Get.put(ProfileController());
    // 2. Initialize Location controller
    final UserLocationController locationController = Get.put(
      UserLocationController(),
    );

    return Container(
      // Padding সামান্য কমানো হয়েছে যাতে উপরের স্পেস ঠিক থাকে
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // --- ✅ DYNAMIC IMAGE CODE START ---
          Obx(() {
            ImageProvider imageProvider;

            if (profileController.hasImage) {
              imageProvider = FileImage(
                File(profileController.pickedImage.value!.path),
              );
            } else if (profileController.profileImgUrl.value.isNotEmpty) {
              String imgUrl = profileController.profileImgUrl.value;
              if (!imgUrl.startsWith('http')) {
                imgUrl = "${ApiServices.baseUrl}$imgUrl";
              }
              imageProvider = NetworkImage(imgUrl);
            } else {
              imageProvider = const AssetImage(
                'assets/backround/Rectangle 5040.png',
              );
            }

            return Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageProvider,
                ),
              ),
            );
          }),
          // --- ✅ DYNAMIC IMAGE CODE END ---

          SizedBox(width: 12.w),

          // Name and Location Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                      () => Text(
                    "Hi, ${profileController.fullName.value}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff121212),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4.h),
                Obx(
                      () => Text(
                    locationController.isLoading.value
                        ? "Locating..."
                        : locationController.currentAddress.value.isEmpty
                        ? "Location not found"
                        : locationController.currentAddress.value,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),

          // --- ✅ NOTIFICATION BUTTON START ---
          GestureDetector(
            onTap: () {
              // আপনার নোটিফিকেশন পেজের রুট এখানে দিন
              // Get.toNamed(AppRoute.notifications);
            },
            child: Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.notifications_none_rounded,
                    color: const Color(0xff121212),
                    size: 26.sp,
                  ),
                  // লাল ডট (নতুন নোটিফিকেশন বোঝাতে)
                  Positioned(
                    right: 12.w,
                    top: 12.h,
                    child: Container(
                      height: 8.h,
                      width: 8.w,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // --- ✅ NOTIFICATION BUTTON END ---
        ],
      ),
    );
  }
}