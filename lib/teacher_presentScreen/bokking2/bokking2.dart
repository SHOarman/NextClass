import 'package:first_project/core/route/route.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
import 'package:first_project/unity/appColors/appGradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../techerall_widget/nevbutton/nevbutton.dart';

class Bokking2 extends StatelessWidget {
  const Bokking2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Nev_Button2(SelectIndex: 1),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),

            Text(
              'Bookings',
              style: TextStyle(
                color: Appgradient.TextColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 12.h),

            Text(
              'You can manage your booking requests here',
              style: TextStyle(
                color: Color(0xff888888),
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 40.h),

            CustomCardnew(
              title: 'Mathematics',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: () {
                Get.toNamed(AppRoute.bokkingdetels2);
              },
            ),
            SizedBox(height: 16.h),

            CustomCardnew(
              title: 'Mathematics',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: () {
                print('pending');
              },
            ),
            SizedBox(height: 16.h),
            CustomCardnew(
              title: 'Mathematics',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: () {
                print('pending');
              },
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
