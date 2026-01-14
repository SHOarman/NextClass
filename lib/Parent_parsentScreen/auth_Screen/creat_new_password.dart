import 'package:first_project/Parent_parsentScreen/auth_Screen/auth_Controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Check your import paths

import '../../unity/appColors/appGradient.dart';
import '../../unity/string_static/strig_static/staticString.dart';
import '../widget/coustom_Textfield/coustom_Textfield.dart';
import '../widget/coustom_button/coustom_button.dart';

class CreatNewPassword extends StatelessWidget {
  const CreatNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final Authcontroller authController = Get.put(Authcontroller());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120.h),

              Center(
                child: Text(
                  Staticstring.createnewpassword,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = Appgradient.primaryGradient.createShader(
                        Rect.fromLTWH(0, 0, 0, 0),
                      ),
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              Center(
                child: Text(
                  Staticstring.createnewpasswordetesls,
                  style: TextStyle(color: Color(0xff888888), fontSize: 12),
                ),
              ),

              SizedBox(height: 44.h),

              /// =============================== Password label
              Text(
                Staticstring.password,
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),
              SizedBox(height: 12.h),

              /// ==================================== New Password field
              CustomPasswordFormField(
                hintText: '********',
                // 2. Connect to AuthController
                controller: authController.newPasswordController,
                iconPath: 'assets/icon/Frame (1).svg',
              ),

              SizedBox(height: 24.h),

              ///================================ Confirm Password label
              Text(
                Staticstring.confirmPassword,
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),
              SizedBox(height: 12.h),

              /// ==================================== Confirm Password field
              CustomPasswordFormField(
                hintText: '********',
                // 3. Connect to AuthController
                controller: authController.confirmNewPasswordController,
                iconPath: 'assets/icon/Frame (1).svg',
              ),

              SizedBox(height: 12.h),

              SizedBox(height: 100.h),

              /// Update Password button
              CustomSuperButton(
                text: Staticstring.updatePassword,
                fontSize: 20,
                onTap: () {
                  // 4. Call the function directly.
                  // The controller handles validation and API calls.
                  authController.setNewPassword();
                },
                bgGradient: Appgradient.primaryGradient,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
