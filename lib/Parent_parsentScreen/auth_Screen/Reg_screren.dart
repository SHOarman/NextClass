import 'package:first_project/Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:first_project/core/route/route.dart';
import 'package:first_project/unity/string_static/strig_static/staticString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Services/auth_Controller/auth_Controller.dart';
import '../../core/route/Genaral_Controler/Genaral_Controler.dart';
import '../../unity/appColors/appGradient.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegScreren extends StatelessWidget {
  const RegScreren({super.key});

  @override
  Widget build(BuildContext context) {

   final Authcontroller authController = Get.find<Authcontroller>();


    // Controllers
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    final GenaralControler genController = Get.put(GenaralControler());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Center(
                child: Text(
                  Staticstring.register,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = Appgradient.primaryGradient.createShader(
                        Rect.fromLTWH(0, 0, 200, 0),
                      ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: Text(
                  Staticstring.registerdetels,
                  style: TextStyle(
                    color: const Color(0xff888888),
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 40.h),
              // Name
              Text(
                Staticstring.fullname,
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16.sp),
              ),
              SizedBox(height: 12.h),
              CustomTextField(
                hintText: 'Enter your full name...',
                controller: nameController,
                iconPath: 'assets/icon/Frame (2).svg',
                enableValidation: false,
              ),

              SizedBox(height: 24.h),
              // Email
              Text(
                Staticstring.Email,
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16.sp),
              ),
              SizedBox(height: 12.h),
              CustomTextField(
                hintText: 'Enter your email...',
                controller: emailController,
                iconPath: "assets/icon/Frame.svg",
                enableValidation: true,
                regex: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
                errorMessage: 'Invalid email format',
              ),

              SizedBox(height: 24.h),
              // Password
              Text(
                Staticstring.password,
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16.sp),
              ),
              SizedBox(height: 12.h),
              CustomPasswordFormField(
                hintText: '********',
                controller: passwordController,
                iconPath: 'assets/icon/Frame (1).svg',
              ),

              SizedBox(height: 24.h),
              // Confirm Password
              Text(
                Staticstring.confirmPassword,
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16.sp),
              ),
              SizedBox(height: 12.h),
              CustomPasswordFormField(
                hintText: '********',
                controller: confirmPasswordController,
                iconPath: 'assets/icon/Frame (1).svg',
              ),

              SizedBox(height: 20.h),
              // Checkbox + Terms + Button
              Obx(() {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: genController.isCheck.value,
                          activeColor: const Color(0xff2563EB),
                          onChanged: (value) {
                            if (value != null) {
                              genController.isCheck.value = value;
                            }
                          },
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              genController.isCheck.value =
                                  !genController.isCheck.value;
                            },
                            child: Text(
                              "By creating an account, you agree to our Privacy Policy & Terms and Conditions.",
                              style: TextStyle(
                                color: genController.isCheck.value
                                    ? const Color(0xff2563EB)
                                    : Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 120.h),
                    CustomSuperButton(
                      text: Staticstring.register,
                      onTap: () {
                        if (!genController.isCheck.value) {
                          Get.snackbar(
                            "Error",
                            "Please accept terms & conditions!",
                          );
                        } else {
                          //Get.toNamed(AppRoute.login);
                        }
                        // Registration Logic Here
                      },
                      bgGradient: Appgradient.primaryGradient,
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Staticstring.haveanaccount,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xff2B2B2B),
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoute.login);
                          },
                          child: Text(
                            Staticstring.login,
                            style: TextStyle(color: Color(0xff2563EB)),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
