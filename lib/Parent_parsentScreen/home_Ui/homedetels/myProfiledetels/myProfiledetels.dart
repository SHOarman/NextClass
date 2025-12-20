import 'package:first_project/Parent_parsentScreen/profile_Screen/userdata/userdata.dart';
import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widget/myProfilecoustomCard/myProfilecoustomCard.dart';
import '../../../widget/naev_button/neab_Button.dart';

class Myprofiledetels extends StatelessWidget {
  const Myprofiledetels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Nev_Button(SelectIndex: 3),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 40.h),

              Text(
                'My Profile',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 40.h),

              //=================userprofile====================================
              Userdata(),

              //=================userprofile====================================
              SizedBox(height: 24.h),

              MyProfileButton(
                icon: 'assets/icon/my1.svg',
                title: 'Favorite tutor',
                ontap: () {
                  Get.toNamed(AppRoute.favourite);
                },
              ),
              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my2.svg',
                title: 'Change password',
                ontap: () {
                  Get.toNamed(AppRoute.updatpassword);
                },
              ),
              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my3.svg',
                title: 'Terms & conditions',
                ontap: () {
                  Get.toNamed(AppRoute.conditions);
                },
              ),
              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my4.svg',
                title: 'Privacy policy',
                ontap: () {
                  Get.toNamed(AppRoute.pervice);
                },
              ),
              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my5.svg',
                title: 'Support',
                ontap: () {
                  Get.toNamed(AppRoute.supporteam);
                },
              ),
              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my6.svg',
                title: 'Delete account',
                ontap: () {


                },
              ),
              SizedBox(height: 12.h),
              MyProfileButton(
                icon: 'assets/icon/my7.svg',
                title: 'Log out',
                ontap: () {

                  Get.toNamed(AppRoute.logoutscreennew);
                },
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
