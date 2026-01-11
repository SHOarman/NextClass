import 'dart:io';
import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Parent_parsentScreen/profile_Screen/profileController/profileController.dart';
import '../../../Parent_parsentScreen/widget/backSleash/backSleash.dart';
import '../../../unity/appColors/appGradient.dart';
// ✅ Controller & Service Import
import '../../../Services/api_Services/api_Services.dart';

class EditProfile2 extends StatelessWidget {
  const EditProfile2({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Controller Call
    final Profilecontroller profilecontroller = Get.put(Profilecontroller());

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

            /// ===== Profile Image (Dynamic) =====
            Center(
              child: Stack(
                children: [
                  Obx(() {
                    ImageProvider imageProvider;

                    // ১. লোকাল ফাইল (যদি পিক করা হয়)
                    if (profilecontroller.hasImage) {
                      imageProvider = FileImage(File(profilecontroller.pickedImage.value!.path));
                    }
                    // ২. সার্ভার ইমেজ (যদি থাকে)
                    else if (profilecontroller.profileImgUrl.value.isNotEmpty) {
                      String imgUrl = profilecontroller.profileImgUrl.value;
                      if (!imgUrl.startsWith('http')) {
                        imgUrl = "${ApiServices.baseUrl}$imgUrl";
                      }
                      imageProvider = NetworkImage(imgUrl);
                    }
                    // ৩. ডিফল্ট ইমেজ
                    else {
                      imageProvider = const AssetImage('assets/backround/profile.png');
                    }

                    return Container(
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    );
                  }),

                  /// Edit icon overlay
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // ইমেজ পিকার কল করা
                        profilecontroller.pickImg();
                      },
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

            /// ===== Section Title
            Text(
              'Basic info',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff2B2B2B),
              ),
            ),
            SizedBox(height: 24.h),

            Text(
              'Bio',
              style: TextStyle(
                color: const Color(0xff2B2B2B),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 8.h),

            /// ===== ✅ DYNAMIC BIO SHOWING HERE =====
            Obx(() => Text(
              profilecontroller.bio.value, // Controller থেকে Bio দেখানো হচ্ছে
              style: const TextStyle(
                color: Color(0xff555555),
                height: 1.5,
              ),
            )),

            SizedBox(height: 24.h),

            Text(
              'Personal Details',
              style: TextStyle(
                color: const Color(0xff2B2B2B),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),

            /// ===== ✅ DYNAMIC NAME =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Full name',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff888888),
                  ),
                ),
                SizedBox(width: 10.w),

                // Name from Controller
                Obx(() => Text(
                  profilecontroller.fullName.value,
                  style: TextStyle(
                    color: const Color(0xff888888),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )),
              ],
            ),
            SizedBox(height: 16.h),

            /// ===== ✅ DYNAMIC EMAIL =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff888888),
                  ),
                ),
                SizedBox(width: 10.w),

                // Email from Controller
                Obx(() => Text(
                  profilecontroller.email.value,
                  style: TextStyle(
                    color: const Color(0xff888888),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )),
              ],
            ),

            SizedBox(height: 118.h),

            CustomSuperButton(
              text: 'Edit Profile',
              onTap: () {
                // এডিট পেজে যাওয়ার আগে ডাটা লোড করা হচ্ছে
                // আপনি চাইলে এখানে Bio-ও পাস করতে পারেন বা কন্ট্রোলারে সেট করতে পারেন
                Get.toNamed(AppRoute.editmodel2);
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