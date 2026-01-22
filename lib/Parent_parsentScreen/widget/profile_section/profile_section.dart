import 'dart:io';
import 'package:first_project/Parent_parsentScreen/profile_Screen/profileController/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:first_project/core/route/general_controller/location_controller.dart';

import '../../../Services/api_Services/api_services.dart';

class Profilesecation extends StatelessWidget {
  const Profilesecation({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Initialize Profile Controller
    final ProfileController profileController = Get.put(ProfileController());

    // 2. Initialize User Location Controller
    final UserLocationController locationController = Get.put(
      UserLocationController(),
    );

    return Container(
      // Reduced padding slightly to maintain proper top spacing
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // --- ✅ DYNAMIC PROFILE IMAGE START ---
          Obx(() {
            ImageProvider imageProvider;

            // If user has selected a new image from device
            if (profileController.hasImage) {
              imageProvider = FileImage(
                File(profileController.pickedImage.value!.path),
              );
            }
            // If profile image URL exists from server
            else if (profileController.profileImgUrl.value.isNotEmpty) {
              String imgUrl = profileController.profileImgUrl.value;

              // Ensure full URL format
              if (!imgUrl.startsWith('http')) {
                imgUrl = "${ApiServices.baseUrl}$imgUrl";
              }
              imageProvider = NetworkImage(imgUrl);
            }
            // Default placeholder image
            else {
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
                image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
              ),
            );
          }),

          // --- ✅ DYNAMIC PROFILE IMAGE END ---
          SizedBox(width: 12.w),

          // User name and location section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Display user's name
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

                // Display current location
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
              // Navigate to notification screen
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
                    color: Colors.black.withValues(alpha: 0.05),
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
                  // Red dot to indicate new notifications
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
