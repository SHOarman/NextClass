import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import '../../../Parent_parsentScreen/widget/coustom_button/coustom_button.dart';

import '../../../core/route/route.dart';
import '../../../unity/appColors/appGradient.dart';
import '../../../unity/string_static/strig_static/staticString.dart';

class UpdatePasswordtecher extends StatelessWidget {
  const UpdatePasswordtecher({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController currentPasswordController =
        TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    // final GenaralControler controller = Get.put(GenaralControler());

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
                controller: currentPasswordController,
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
                controller: newPasswordController,
                iconPath: 'assets/icon/Frame (1).svg',
              ),

              SizedBox(height: 24.h),
              Text(
                'Confirm Password',
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),
              SizedBox(height: 12.h),

              /// Password field
              CustomPasswordFormField(
                hintText: '********',
                controller: confirmPasswordController,
                iconPath: 'assets/icon/Frame (1).svg',
              ),

              SizedBox(height: 100.h),

              /// Login button
              CustomSuperButton(
                text: Staticstring.updatePassword,
                fontSize: 20,
                onTap: () {
                  Get.toNamed(AppRoute.home2);
                },
                bgGradient: Appgradient.primaryGradient,
                clear: () {
                  currentPasswordController.clear();
                  newPasswordController.clear();
                  confirmPasswordController.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
