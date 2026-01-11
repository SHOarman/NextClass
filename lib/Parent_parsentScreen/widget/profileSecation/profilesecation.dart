import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/route/Genaral_Controler/locationController.dart';
import '../../profile_Screen/profileController/profileController.dart';
import '../../../Services/api_Services/api_Services.dart'; // ✅ Import ApiServices for BaseURL

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

          // --- ✅ DYNAMIC IMAGE CODE START ---
          Obx(() {
            ImageProvider imageProvider;

            if (profilecontroller.hasImage) {
              // 1. Local File (Just picked from gallery)
              imageProvider = FileImage(File(profilecontroller.pickedImage.value!.path));
            } else if (profilecontroller.profileImgUrl.value.isNotEmpty) {
              // 2. Server Image
              String imgUrl = profilecontroller.profileImgUrl.value;
              if (!imgUrl.startsWith('http')) {
                imgUrl = "${ApiServices.baseUrl}$imgUrl";
              }
              imageProvider = NetworkImage(imgUrl);
            } else {
              // 3. Default Asset Image
              imageProvider = const AssetImage('assets/backround/Rectangle 5040.png');
            }

            return Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageProvider, // ✅ Dynamic Image Provider
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

                // --- ✅ DYNAMIC NAME START ("Hi, Name") ---
                Obx(() => Text(
                  "Hi, ${profilecontroller.fullName.value}", // ✅ নামের আগে Hi, যোগ করা হয়েছে
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff121212),
                  ),
                  overflow: TextOverflow.ellipsis,
                )),
                // --- ✅ DYNAMIC NAME END ---

                SizedBox(height: 4.h),

                // Location (As previously implemented)
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