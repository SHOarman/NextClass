import 'package:first_project/core/route/route.dart';
import 'package:first_project/teacher_presentScreen/myprofileexta/userdata_techer/userdata_techer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Parent_parsentScreen/widget/my_profile_custom_card/my_profile_custom_card.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 100.h),

              Text(
                'My Profile',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 40.h),

              ///===================userprofile====================================
              UserdataTecher(),

              ///===================userprofile====================================
              ///
              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/review.svg',
                title: 'My reviews',
                ontap: () {
                  Get.toNamed(AppRoute.reviewsecation);
                  //  Get.toNamed(AppRoute.reviewpage);
                },
              ),

              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my2.svg',
                title: 'Change password',
                ontap: () {
                  Get.toNamed(AppRoute.updateprofile2);
                },
              ),

              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my3.svg',
                title: 'Terms & conditions',
                ontap: () {
                  Get.toNamed(AppRoute.termsConditions2);
                },
              ),

              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my4.svg',
                title: 'Privacy policy',
                ontap: () {
                  Get.toNamed(AppRoute.privacyPolicy2);
                },
              ),

              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my5.svg',
                title: 'Support',
                ontap: () {
                  Get.toNamed(AppRoute.supporteachetteam);
                },
              ),

              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my6.svg',
                title: 'Delete account',
                ontap: () {
                  Get.toNamed(AppRoute.delectteacheraccound);
                },
              ),
              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my2.svg',
                title: 'Log out',
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
