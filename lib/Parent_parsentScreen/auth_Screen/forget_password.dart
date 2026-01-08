import 'dart:ui';
import 'package:first_project/Parent_parsentScreen/auth_Screen/auth_Controller/authController.dart';
import 'package:first_project/Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../unity/appColors/appGradient.dart';
import '../../unity/string_static/strig_static/staticString.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final Authcontroller authcontroller = Get.find<Authcontroller>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ... (উপরের ডিজাইন কোড একই থাকবে) ...
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
                  "Email",
                  style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
                ),
                SizedBox(height: 12.h),

                // ✅ ১. সঠিক কন্ট্রোলার বসানো হলো
                CustomTextField(
                  hintText: 'Enter your email...',
                  controller: authcontroller.forgetPasswordController,
                  iconPath: "assets/icon/Frame.svg",
                  enableValidation: true,
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 64.h),

                // ✅ ২. বাটন ফাংশন
                CustomSuperButton(
                  text: Staticstring.sendCode,
                  fontSize: 20,
                  textColor: Colors.white,
                  onTap: () {
                    // এখানে আর চেক করার দরকার নেই, কন্ট্রোলার নিজেই চেক করবে
                    authcontroller.forgetPassword();
                  },
                  bgGradient: Appgradient.primaryGradient,
                ),

                SizedBox(height: 16.h),
                CustomSuperButton(
                  text: Staticstring.backtosignin,
                  fontSize: 20,
                  textColor: Colors.blue,
                  onTap: () {
                    Get.back(); // অথবা Get.toNamed(AppRoute.login);
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
