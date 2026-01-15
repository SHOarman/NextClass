import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../unity/app_colors/app_gradient.dart';
import '../../widget/back_slash/back_slash.dart';
import '../../widget/custom_button/custom_button.dart';
import '../profileController/profile_controller.dart';
import 'package:first_project/core/route/route.dart';
import '../../../Services/api_Services/api_services.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),

            /// ===== Back Button
            BackSlashButton(
              onTap: () {
                Get.back();
              },
            ),

            SizedBox(height: 62.h),

            /// ===== Profile Image with Edit Icon (Stack)
            Center(
              child: Stack(
                children: [
                  // 1. Main Profile Image
                  GestureDetector(
                    onTap: () {
                      profileController.pickImg();
                    },
                    child: Obx(() {
                      ImageProvider imageProvider;

                      // --- Image Logic ---
                      if (profileController.hasImage) {
                        // Local File
                        imageProvider = FileImage(
                          File(profileController.pickedImage.value!.path),
                        );
                      } else if (profileController
                          .profileImgUrl
                          .value
                          .isNotEmpty) {
                        // Network Image
                        String imgUrl = profileController.profileImgUrl.value;
                        if (!imgUrl.startsWith('http')) {
                          imgUrl = "${ApiServices.baseUrl}$imgUrl";
                        }
                        imageProvider = NetworkImage(imgUrl);
                      } else {
                        // Default Asset
                        imageProvider = const AssetImage(
                          'assets/backround/profile.png',
                        );
                      }
                      // -------------------

                      return Container(
                        height: 120.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                        ),
                      );
                    }),
                  ),

                  // 2. Camera Icon Overlay
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => profileController.pickImg(),
                      child: Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: const BoxDecoration(
                          color: Color(0xff2563EB),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icon/camfra.svg',
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 48.h),

            Text(
              'Basic info',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff2B2B2B),
              ),
            ),
            SizedBox(height: 28.h),

            /// ===== Name Field (Reactive) =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Full name',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff888888),
                  ),
                ),
                SizedBox(width: 10.w),
                Obx(
                  () => Text(
                    profileController.fullName.value,
                    style: TextStyle(
                      color: const Color(0xff888888),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            /// ===== email Field (Reactive) =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'email',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff888888),
                  ),
                ),
                SizedBox(width: 10.w),
                Obx(
                  () => Text(
                    profileController.email.value,
                    style: TextStyle(
                      color: const Color(0xff888888),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 118.h),

            /// ===== Edit Profile Button =====
            CustomSuperButton(
              text: 'Edit Profile',
              onTap: () {
                profileController.loadCurrentData();
                Get.toNamed(AppRoute.editmodel);
              },
              bgGradient: Appgradient.primaryGradient,
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
