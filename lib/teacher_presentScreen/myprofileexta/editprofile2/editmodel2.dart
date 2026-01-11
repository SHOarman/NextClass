import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Parent_parsentScreen/profile_Screen/profileController/profileController.dart';
import '../../../Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import '../../../Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import '../../../unity/appColors/appGradient.dart';

class EditModel2 extends StatelessWidget {
  const EditModel2({super.key});

  @override
  Widget build(BuildContext context) {
    // কন্ট্রোলার ইনিশিলাইজ করা
    final Profilecontroller controller = Get.put(Profilecontroller());

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  fontSize: 16.sp),
            ),
            SizedBox(height: 16.h),

            /// ===== Name TextField =====
            Simpletextfield(
              controller: controller.editProfileController,
              hintText: 'Write here..',
            ),

            SizedBox(height: 16.h),

            /// ===== Bio Label
            Text(
              'Bio',
              style: TextStyle(
                  color: const Color(0xff2B2B2B),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
            ),
            SizedBox(height: 16.h),

            /// ===== Bio TextField =====
            Customdetesl(
              controller: controller.bioController,
              hintText: 'Write here..',
            ),

            SizedBox(height: 48.h),

            /// ===== Save Changes Button =====
            CustomSuperButton(
              text: 'Save Changes',
              bgGradient: Appgradient.primaryGradient,
              onTap: () {

                if (controller.editProfileController.text.isNotEmpty) {

                  controller.Editprofile();

                } else {
                  Get.snackbar(
                    "Error",
                    "Please enter your name",
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}