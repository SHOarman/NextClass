import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

// Assuming these are your file paths
import '../../../unity/app_colors/app_gradient.dart';

import '../custom_button/custom_button.dart';

class SuccessfullMsg extends StatelessWidget {
  final VoidCallback? onClose; // clearer name than "clear"
  final String title; // clearer name than "name"
  final String details; // clearer name than "namedetels"

  final String? btnText1;
  final VoidCallback? onTap1;

  final String? btnText2;
  final VoidCallback? onTap2;

  const SuccessfullMsg({
    super.key,
    required this.title,
    required this.details,
    this.btnText1,
    this.onTap1,
    this.btnText2,
    this.onTap2,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // REMOVED fixed height to prevent overflow errors
      width: 360.w,
      constraints: BoxConstraints(maxWidth: 392.w),
      padding: EdgeInsets.all(16.w), // Added padding for spacing
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView( // Prevents overflow on small screens
        child: Column(
          mainAxisSize: MainAxisSize.min, // Takes only required space
          children: [
            SizedBox(height: 10.h),

            // Lottie Animation
            SizedBox(
              height: 150.h,
              child: Lottie.asset(
                'assets/loti/Untitled file.json',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.check_circle, size: 80, color: Colors.green);
                },
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              details,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
            ),

            SizedBox(height: 30.h),

            // ✅ Button 1
            if (btnText1 != null)
              CustomSuperButton(
                text: btnText1!,
                bgGradient: Appgradient.primaryGradient,
                onTap: onTap1 ?? () {
                  onClose?.call();
                },
              ),

            SizedBox(height: 10.h),

            // ✅ Button 2
            if (btnText2 != null)
              CustomSuperButton(
                text: btnText2!,
                borderColor: Appgradient.pramary1,
                textGradient: Appgradient.primaryGradient,
                onTap: onTap2 ?? () {
                  onClose?.call();
                },
              ),

            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

//=================== Review Popup Msg =======================================

class ReviewPopupMsg extends StatelessWidget {
  final String title;
  final String details;
  final String btnText1;
  final VoidCallback onTap1;

  const ReviewPopupMsg({
    super.key,
    required this.title,
    required this.details,
    required this.btnText1,
    required this.onTap1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // REMOVED fixed height
      width: 360.w,
      constraints: BoxConstraints(maxWidth: 392.w),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Takes only required space
        mainAxisAlignment: MainAxisAlignment.start, // Fixed syntax
        children: [

          SizedBox(
            height: 120.h,
            child: Lottie.asset('assets/loti/Untitled file.json'),
          ),

          SizedBox(height: 10.h),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 8.h),

          Text(
            details,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
          ),

          SizedBox(height: 30.h),

          CustomSuperButton(
            text: btnText1,
            borderColor: Appgradient.pramary1,
            textGradient: Appgradient.primaryGradient,
            onTap: onTap1,
          ),
        ],
      ),
    );
  }
}
