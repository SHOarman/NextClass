import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../unity/app_colors/app_gradient.dart';
import '../../widget/custom_textfield/custom_textfield.dart';
import '../../widget/custom_button/custom_button.dart';
import '../profileController/profile_controller.dart';

class EditModel extends StatelessWidget {
  const EditModel({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find<ProfileController>();

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

            Text(
              'Full name',
              style: TextStyle(
                color: const Color(0xff2B2B2B),
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 16.h),

            /// ===== TextField (controller connected)
            Simpletextfield(
              controller: profileController.editProfileController,
              hintText: 'Write here..',
            ),

            SizedBox(height: 16.h),

            /// ===== Bio TextField =====
            Customdetesl(
              controller: profileController.bioController,
              hintText: 'Write here..',
            ),

            SizedBox(height: 48.h),

            /// ===== Save Changes Button
            CustomSuperButton(
              text: 'Save Changes',
              bgGradient: Appgradient.primaryGradient,
              onTap: () {
                if (profileController.editProfileController.text.isNotEmpty) {
                  // ✅✅✅ API Call Here ✅✅✅
                  profileController.updateProfile();
                } else {
                  Get.snackbar(
                    "Required",
                    "Please enter your name",
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
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
                Get.back();
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
