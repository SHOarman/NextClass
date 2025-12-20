import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import '../../unity/appColors/appGradient.dart';

class Successfullmsg extends StatelessWidget {
  final String name;
  final String namedetels;
  final String? bu_name1;
  final VoidCallback? ontap1;
  final String? bu_name2;
  final VoidCallback? ontap2;

  const Successfullmsg({
    super.key,
    required this.name,
    required this.namedetels,
    this.bu_name1,
    this.ontap1,
    this.bu_name2,
    this.ontap2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      width: 360,
      constraints: BoxConstraints(maxWidth: 392.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),

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
          SizedBox(height: 30.h),

          // ✅ Button 1
          if (bu_name1 != null)
            CustomSuperButton(
              text: bu_name1!,
              bgGradient: Appgradient.primaryGradient,
              onTap: ontap1 ?? () {},
            ),
          SizedBox(height: 10.h),

          // ✅ Button 2
          if (bu_name2 != null)
            CustomSuperButton(
              text: bu_name2!,
              borderColor: Appgradient.pramary1,
              textGradient: Appgradient.primaryGradient,
              onTap: ontap2 ?? () {},
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
  final String bu_name1;
  final Function ontap1;

  const Reviewpopupmsg({
    super.key,
    required this.name,
    required this.namedetels,
    required this.bu_name1,
    required this.ontap1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      width: 360,
      //
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

          SizedBox(height: 40.h),

          SizedBox(height: 16.h),

          CustomSuperButton(
            text: bu_name1,
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
