import 'package:first_project/unity/appColors/appGradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllowLocation extends StatelessWidget {
  const AllowLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 462,
        width: 370,
        //
        constraints: BoxConstraints(maxWidth: 392.w),
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 16.h),
            Center(child: SvgPicture.asset('assets/icon/mapicon.svg')),

            SizedBox(height: 32.h),

            Text(
              'Allow NextClass to access your location',
              style: TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 4.h),
            Text(
              'Allow location for nearby tutors find.',
              style: TextStyle(color: Color(0xff2B2B2B), fontSize: 12),
            ),
            SizedBox(height: 20.h),
            Image.asset(
              'assets/backround/🌎 Map Maker_  (Standard).png',
              //height: ,
              //width: 310,
            ),
            SizedBox(height: 20.h),

            //======================button1===================================
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 32,
                width: 310,
                decoration: const BoxDecoration(
                  color: Color(0xffD2E4FC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'While using the app',
                    style: TextStyle(color: Color(0xff2B2B2B), fontSize: 12),
                  ),
                ),
              ),
            ),

            SizedBox(height: 4),

            //======================button2===================================
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 32,
                width: 310,
                decoration: const BoxDecoration(
                  color: Color(0xffD2E4FC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'While using the app',
                    style: TextStyle(color: Color(0xff2B2B2B), fontSize: 12),
                  ),
                ),
              ),
            ),

            SizedBox(height: 4),
            //======================button3===================================
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 32,
                width: 310,
                decoration: const BoxDecoration(
                  color: Color(0xffD2E4FC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'While using the app',
                    style: TextStyle(color: Color(0xff2B2B2B), fontSize: 12),
                  ),
                ),
              ),
            ),

            //

            // Center(
            //   child: Text(
            //     name,
            //     style: TextStyle(
            //       fontSize: 24.sp,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
