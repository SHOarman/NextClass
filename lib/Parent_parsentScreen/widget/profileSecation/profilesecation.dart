import 'dart:io'; // Import this for File
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/route/Genaral_Controler/locationController.dart';
import '../../profile_Screen/profileController/profileController.dart';

class Profilesecation extends StatelessWidget {
  const Profilesecation({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Initialize Profile Controller
    var profilecontroller = Get.put(Profilecontroller());

    // 2. Initialize Location Controller
    final UserLocationController locationController = Get.put(UserLocationController());

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // --- START OF DYNAMIC IMAGE CODE ---
          Obx(() {
            return Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Makes the image round
                color: Colors.grey[200], // Background color if image fails loading
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // Logic: If image is picked, show it. Else show default asset.
                  image: profilecontroller.hasImage
                      ? FileImage(File(profilecontroller.pickedImage.value!.path))
                      : const AssetImage('assets/backround/Rectangle 5040.png')
                  as ImageProvider,
                ),
              ),
            );
          }),
          // --- END OF DYNAMIC IMAGE CODE ---

          SizedBox(width: 12.w),

          // Name and Location Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Hi, Hans",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff121212),
                  ),
                ),
                SizedBox(height: 4.h),

                // Location with Obx
                Obx(() => Row(
                  children: [
                    Flexible(
                      child: Text(
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
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}