import 'package:first_project/Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:first_project/core/route/route.dart';
import 'package:first_project/unity/string_static/strig_static/staticString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../unity/appColors/appGradient.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailnewController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(height: 200.h),

                    Center(
                      child: Text(
                        Staticstring.forgotpassword,
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
                        Staticstring.forgetdetels,
                        style: TextStyle(
                          color: Color(0xff888888),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.h),
                Text(
                  "Email",
                  style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
                ),
                SizedBox(height: 12.h),
                CustomTextField(
                  hintText: 'Enter your email...',
                  controller: emailnewController,
                  iconPath: "assets/icon/Frame.svg",
                  enableValidation: true,
                  regex: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
                  errorMessage: 'Invalid email format',
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 64.h),
                CustomSuperButton(
                  text: Staticstring.sendCode,
                  fontSize: 20,
                  textColor: Colors.white,
                  onTap: () {

                    Get.toNamed(AppRoute.otp);
                  },
                  bgGradient: Appgradient.primaryGradient,
                ),
                SizedBox(height: 16.h),
                CustomSuperButton(
                  text: Staticstring.backtosignin,
                  fontSize: 20,
                  textColor: Appgradient.primaryGradient.colors[0],
                  onTap: () {
                   Get.toNamed(AppRoute.reg);
                  },
                  bgColor: Color(0xffFFFFFF),
                  borderColor: Color(0xff2563EB),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
