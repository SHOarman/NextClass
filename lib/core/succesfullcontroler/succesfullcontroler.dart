import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../Parent_parsentScreen/widget/custom_button/custom_button.dart';
import '../../unity/app_colors/app_gradient.dart';

class Successfullmsg extends StatelessWidget {
  final Function? clear;
  final String name;
  final String namedetels;
  final String? buName1;
  final VoidCallback? ontap1;
  final String? buName2;
  final VoidCallback? ontap2;

  const Successfullmsg({
    super.key,
    required this.name,
    required this.namedetels,
    this.buName1,
    this.ontap1,
    this.buName2,
    this.ontap2,
    this.clear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      constraints: BoxConstraints(maxWidth: 392.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),

          Center(child: Lottie.asset('assets/loti/Untitled file.json')),

          Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              namedetels,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
            ),
          ),
          SizedBox(height: 10.h),

          // ✅ Button 1
          if (buName1 != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomSuperButton(
                text: buName1!,
                bgGradient: Appgradient.primaryGradient,
                onTap:
                    ontap1 ??
                    () {
                      // clear!();
                    },
              ),
            ),
          SizedBox(height: 10.h),

          // ✅ Button 2
          if (buName2 != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomSuperButton(
                text: buName2!,
                borderColor: Appgradient.pramary1,
                textGradient: Appgradient.primaryGradient,
                onTap:
                    ontap2 ??
                    () {
                      // clear!();
                    },
              ),
            ),
        ],
      ),
    );
  }
}

//===================reviewpopupmsg=======================================

class Reviewpopupmsg extends StatelessWidget {
  // ... (properties) ...
  final String name;
  final String namedetels;
  final String buName1;
  final Function ontap1;

  const Reviewpopupmsg({
    super.key,
    required this.name,
    required this.namedetels,
    required this.buName1,
    required this.ontap1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 400,
      constraints: BoxConstraints(maxWidth: 392.w),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: .start,

        children: [
          // SizedBox(height: 20.h),
          Center(child: Lottie.asset('assets/loti/Untitled file.json')),

          Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 8.h),

          Text(
            namedetels,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
          ),

          SizedBox(height: 20.h),

          CustomSuperButton(
            text: buName1,
            borderColor: Appgradient.pramary1,
            textGradient: Appgradient.primaryGradient,
            onTap: () {
              ontap1();
            },
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
