import 'package:first_project/Parent_parsentScreen/profile_Screen/profileController/profileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../unity/appColors/appGradient.dart';
import '../../../unity/string_static/strig_static/staticString.dart';
import '../../widget/coustom_Textfield/coustom_Textfield.dart';
import '../../widget/coustom_button/coustom_button.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    //====================Controllercall===========================================

    final Profilecontroller authController = Get.put(Profilecontroller());

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
                  'UpdatePassword',
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
                  'For change your password you have to filled all information.',
                  style: TextStyle(color: Color(0xff888888), fontSize: 12),
                ),
              ),

              SizedBox(height: 80.h),

              /// ===============================Email label
              Text(
                'Current Password',
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),
              SizedBox(height: 12.h),

              /// ====================================Email field
              CustomPasswordFormField(
                hintText: '********',
                controller: authController.currentPassController,
                iconPath: 'assets/icon/Frame (1).svg',
              ),

              SizedBox(height: 24.h),

              ///================================ Password label
              Text(
                'New Password',
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),
              SizedBox(height: 12.h),

              /// Password field
              CustomPasswordFormField(
                hintText: '********',
                controller: authController.changeNewPassController,
                iconPath: 'assets/icon/Frame (1).svg',
              ),

              // SizedBox(height: 24.h),
              // Text(
              //   'Confirm Password',
              //   style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              // ),
              // SizedBox(height: 12.h),
              //
              // /// Password field
              // CustomPasswordFormField(
              //   hintText: '********',
              //   controller: authController.changeConfirmPassController,
              //   iconPath: 'assets/icon/Frame (1).svg',
              // ),
              SizedBox(height: 100.h),

              /// Login button
              CustomSuperButton(
                text: Staticstring.updatePassword,
                fontSize: 20,
                onTap: () {
                  authController.changePassword();
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
