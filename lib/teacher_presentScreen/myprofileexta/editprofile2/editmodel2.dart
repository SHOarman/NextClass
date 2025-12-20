import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import '../../../unity/appColors/appGradient.dart';


class EditModel2 extends StatelessWidget {
  const EditModel2({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController editProfileController = TextEditingController();
    final TextEditingController BioeController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== Title
            Center(
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  color: const Color(0xff2B2B2B),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 48.h),

            /// ===== Full Name Label
            Text(
              'Full name',
              style: TextStyle(
                color: const Color(0xff2B2B2B),
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 16.h),

            /// ===== TextField
            Simpletextfield(
              controller: editProfileController,
              hintText: 'Write here..',
            ),

            SizedBox(height: 16.h),
            Text(
              'Bio',
              style: TextStyle(
                color: const Color(0xff2B2B2B),
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Customdetesl(controller:BioeController , hintText: 'Write here..',),


            SizedBox(height: 48.h),

            /// ===== Save Changes Button
            CustomSuperButton(
              text: 'Save Changes',
              bgGradient: Appgradient.primaryGradient,
              onTap: () {
                if (editProfileController.text.isNotEmpty) {
                  Get.showSnackbar(
                    GetSnackBar(
                      message: "Profile updated successfully!",
                      duration: const Duration(seconds: 2),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      margin: EdgeInsets.all(20.w),
                      borderRadius: 12.r,
                    ),
                  );
                  // Delay then close
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                } else {
                  Get.showSnackbar(
                    GetSnackBar(
                      message: "Please enter your name",
                      duration: const Duration(seconds: 2),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      margin: EdgeInsets.all(20.w),
                      borderRadius: 12.r,
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 16.h),

            /// ===== Close Button
            CustomSuperButton(
              text: 'Close',
              textGradient: Appgradient.primaryGradient,
              borderColor: Appgradient.pramary1,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
