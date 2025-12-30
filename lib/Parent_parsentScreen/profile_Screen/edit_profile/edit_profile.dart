import 'dart:io';

import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../unity/appColors/appGradient.dart';
import '../../widget/backSleash/backSleash.dart';
import '../profileController/profileController.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final profilecontroller = Get.put(Profilecontroller());
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

            /// ===== Profile Image with edit icon
            Center(
              child: Stack(
                children: [
                  /// Circular profile image with shadow
                  GestureDetector(
                    onTap: () {

                      profilecontroller.pickImg();
                    },

                    child: Obx(() {
                      return Container(
                        height: 120.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],

                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: profilecontroller.hasImage
                                ? FileImage(
                                    File(
                                      profilecontroller.pickedImage.value!.path,
                                    ),
                                  )
                                : const AssetImage(
                                        'assets/backround/profile.png',
                                      )
                                      as ImageProvider,
                          ),
                        ),
                      );
                    }),
                  ),

                  /// Edit icon overlay
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        print('Edit profile image tapped');
                      },
                      child: Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                          color: Color(0xff2563EB),
                          shape: BoxShape.circle,
                          // border: Border.all(color: Colors.white, width: 2),
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

            /// ===== Section Title
            Text(
              'Basic info',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff2B2B2B),
              ),
            ),
            SizedBox(height: 28.h),

            /// ===== Name Field
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Full name',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff888888),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'User Name',
                  style: TextStyle(
                    color: Color(0xff888888),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            /// ===== Email Field
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff888888),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'useremail@gmail.com',
                  style: TextStyle(
                    color: Color(0xff888888),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            SizedBox(height: 118.h),

            CustomSuperButton(
              text: 'Edit Profile',
              onTap: () {
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
