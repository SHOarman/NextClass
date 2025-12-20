import 'dart:ui';

import 'package:first_project/teacher_presentScreen/techerall_widget/nevbutton/nevbutton.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/teacher_homecard/teacher_homecard.dart';
import 'package:first_project/unity/appColors/appGradient.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/pendingCustomcard/pendingCustomcard.dart';
import '../techerall_widget/teacher_homecard/customProfilesecationteacher/customProfilesecationteacher.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Nev_Button2(SelectIndex: 0),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffd9cdf2), Color(0xffd9cdf2)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),

            /// Blur Effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(color: Colors.transparent),
              ),
            ),

            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: customProfilesecationteacher(),
            ),

            Padding(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                              22.5,
                            ), // matches circle
                            onTap: () {
                              print('profile');
                            },
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icon/cutomnotification.svg',
                                height: 24,
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                  Colors.blue,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  ///===================home card =========================
                  TeacherHomecard(
                    title: 'Grow as a Tutor',
                    subtitle:
                        'Create classes, manage your schedule,\n and connect with parents.',
                    imagePath: 'assets/backround/teacher.png',
                    iconname: 'Create new class',
                  ),

                  //==============catadory=======================================
                  SizedBox(height: 32.h),

                  Text(
                    'Quick Categories',
                    style: TextStyle(
                      color: Color(0xff2B2B2B),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  //============panding card=============================
                  Pendingcustomcard(),
                  SizedBox(height: 32.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Active Classes',
                        style: TextStyle(
                          color: Appgradient.TextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Appgradient.pramary1,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //======================home catagery================================

                  //   HomeScreenCategories(),
                  SizedBox(height: 32.h),

                  CustomCardnew(
                    title: 'Mathematics',
                    subtitle: 'Class 6-10',
                    iconName: 'Group Class',
                  ),
                  SizedBox(height: 16.h),
                  CustomCardnew(
                    title: 'Mathematics',
                    subtitle: 'Class 6-10',
                    iconName: 'Group Class',
                    onTap: () {
                      //===================================
                    },
                  ),

                  SizedBox(height: 16.h),
                  CustomCardnew(
                    title: 'Science',
                    subtitle: 'Class 1-4',
                    iconName: 'Individual Class',
                    onTap: () {
                      //===================================
                    },
                  ),

                  SizedBox(height: 16.h),
                  CustomCardnew(
                    title: 'Science',
                    subtitle: 'Class 1-4',
                    iconName: 'Individual Class',
                    onTap: () {
                      //===================================
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
