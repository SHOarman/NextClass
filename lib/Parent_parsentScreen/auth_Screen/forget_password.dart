import 'package:first_project/Parent_parsentScreen/auth_Screen/auth_controller/auth_controller.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../unity/app_colors/app_gradient.dart';
import '../../unity/string_static/strig_static/static_string.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200.h),
                Center(
                  child: Text(
                    Staticstring.forgotpassword,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 12.h),
                Center(
                  child: Text(
                    Staticstring.forgetdetels,
                    style: TextStyle(color: Color(0xff888888), fontSize: 12),
                  ),
                ),

                SizedBox(height: 40.h),
                Text(
                  "email",
                  style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
                ),
                SizedBox(height: 12.h),

                CustomTextField(
                  hintText: 'Enter your email...',
                  controller: authController.forgetPasswordController,
                  iconPath: "assets/icon/Frame.svg",
                  enableValidation: true,
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 64.h),

                CustomSuperButton(
                  text: Staticstring.sendCode,
                  fontSize: 20,
                  textColor: Colors.white,
                  onTap: () {
                    authController.forgetPassword();
                  },
                  bgGradient: Appgradient.primaryGradient,
                ),

                SizedBox(height: 16.h),
                CustomSuperButton(
                  text: Staticstring.backtosignin,
                  fontSize: 20,
                  textColor: Colors.blue,
                  onTap: () {
                    Get.back();
                  },
                  bgColor: Colors.white,
                  borderColor: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
