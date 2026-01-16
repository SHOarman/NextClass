// // ignore_for_file: file_names
// // Verified: filename is login_screen.dart
// import 'package:first_project/Parent_parsentScreen/auth_Screen/auth_controller/auth_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import 'package:first_project/core/route/general_controller/general_controller.dart';
// import 'package:first_project/core/route/route.dart';
// import 'package:first_project/unity/app_colors/app_gradient.dart';
// import 'package:first_project/unity/string_static/strig_static/static_string.dart';
// import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
// import 'package:first_project/Parent_parsentScreen/widget/custom_button/custom_button.dart';
//
// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});
//
//   final AuthController authController = Get.put(AuthController());
//
//   final GenaralControler controller = Get.put(GenaralControler());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 120.h),
//
//               /// Title
//               Center(
//                 child: Text(
//                   Staticstring.login,
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     foreground: Paint()
//                       ..shader = Appgradient.primaryGradient.createShader(
//                         const Rect.fromLTWH(0, 0, 200, 70),
//                       ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 12.h),
//
//               Center(
//                 child: Text(
//                   Staticstring.logindetels,
//                   style: const TextStyle(
//                     color: Color(0xff888888),
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 44.h),
//
//               /// email
//               Text(Staticstring.email, style: const TextStyle(fontSize: 16)),
//               SizedBox(height: 12.h),
//
//               CustomTextField(
//                 hintText: 'Enter your email...',
//                 controller: authController.emailController,
//                 iconPath: "assets/icon/Frame.svg",
//                 enableValidation: true,
//                 keyboardType: TextInputType.emailAddress,
//                 regex: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
//                 errorMessage: 'Invalid email format',
//                 obscureText: false,
//               ),
//
//               SizedBox(height: 24.h),
//
//               /// Password
//               Text(Staticstring.password, style: const TextStyle(fontSize: 16)),
//               SizedBox(height: 12.h),
//
//               CustomPasswordFormField(
//                 hintText: '********',
//                 controller: authController.passwordController,
//                 iconPath: 'assets/icon/Frame (1).svg',
//                 enableValidation: true,
//                 //regex: RegExp(r'^(?=.*[a-z])(?=.*\d).{8,}$'),
//                 // errorMessage: "Min 8 chars, 1 letter, 1 number",
//               ),
//
//               SizedBox(height: 12.h),
//
//               /// Remember Me
//               Obx(
//                 () => Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: controller.isCheck.value,
//                           activeColor: const Color(0xff2563EB),
//                           onChanged: (value) {
//                             controller.isCheck.value = value ?? false;
//                           },
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             controller.isCheck.toggle();
//                           },
//                           child: Text(
//                             "Remember me",
//                             style: TextStyle(
//                               color: controller.isCheck.value
//                                   ? const Color(0xff2563EB)
//                                   : Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         // authController.forgetPassword();
//                         Get.toNamed(AppRoute.forgetpassword);
//                         // print('jsjfjwf');
//                       },
//                       child: const Text(
//                         "Forgot password?",
//                         style: TextStyle(color: Color(0xff2563EB)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 80.h),
//
//               /// Login Button
//               CustomSuperButton(
//                 text: Staticstring.login,
//                 fontSize: 20,
//                 bgGradient: Appgradient.primaryGradient,
//                 onTap: () {
//                   if (authController.emailController.text.isEmpty ||
//                       authController.passwordController.text.isEmpty) {
//                     Get.snackbar(
//                       "Error",
//                       "email and password required",
//                       snackPosition: SnackPosition.BOTTOM,
//                       backgroundColor: Colors.redAccent,
//                       colorText: Colors.white,
//                     );
//                     return;
//                   }
//
//                   // print(
//                   //   "Login Clicked. Remember Me: ${controller.isCheck.value}",
//                   // );
//                   authController.loginaccound();
//                 },
//               ),
//
//               SizedBox(height: 60.h),
//
//               /// Register
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(Staticstring.donthaveaccount),
//                   TextButton(
//                     onPressed: () {
//                       Get.toNamed(AppRoute.reg);
//                     },
//                     child: const Text(
//                       "Register",
//                       style: TextStyle(color: Color(0xff2563EB)),
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: 40.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: file_names
import 'package:first_project/Parent_parsentScreen/auth_Screen/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:first_project/core/route/general_controller/general_controller.dart';
import 'package:first_project/core/route/route.dart';
import 'package:first_project/unity/app_colors/app_gradient.dart';
import 'package:first_project/unity/string_static/strig_static/static_string.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_button/custom_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Injecting Controllers
  final AuthController authController = Get.put(AuthController());
  final GenaralControler controller = Get.put(GenaralControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120.h),

              /// ================= Title Section =================
              Center(
                child: Text(
                  Staticstring.login,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = Appgradient.primaryGradient.createShader(
                        const Rect.fromLTWH(0, 0, 200, 70),
                      ),
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              Center(
                child: Text(
                  Staticstring.logindetels,
                  style: const TextStyle(
                    color: Color(0xff888888),
                    fontSize: 12,
                  ),
                ),
              ),

              SizedBox(height: 44.h),

              /// ================= Email Input =================
              Text(Staticstring.email, style: const TextStyle(fontSize: 16)),
              SizedBox(height: 12.h),

              CustomTextField(
                hintText: 'Enter your email...',
                controller: authController.emailController,
                iconPath: "assets/icon/Frame.svg",
                enableValidation: true,
                keyboardType: TextInputType.emailAddress,
                regex: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
                errorMessage: 'Invalid email format',
                obscureText: false,
              ),

              SizedBox(height: 24.h),

              /// ================= Password Input =================
              Text(Staticstring.password, style: const TextStyle(fontSize: 16)),
              SizedBox(height: 12.h),

              CustomPasswordFormField(
                hintText: '********',
                controller: authController.passwordController,
                iconPath: 'assets/icon/Frame (1).svg',
                enableValidation: true,
              ),

              SizedBox(height: 12.h),

              /// ================= Remember Me & Forgot Password =================
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: controller.isCheck.value,
                          activeColor: const Color(0xff2563EB),
                          onChanged: (value) {
                            controller.isCheck.value = value ?? false;
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.isCheck.toggle();
                          },
                          child: Text(
                            "Remember me",
                            style: TextStyle(
                              color: controller.isCheck.value
                                  ? const Color(0xff2563EB)
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.forgetpassword);
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(color: Color(0xff2563EB)),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 80.h),

              /// ================= Login Button with Loader =================
              // ✅ Updated: Uses Obx to show Loader when isLoading is true
              Obx(() {
                return authController.isLoading.value
                    ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff2563EB), // Matches your app theme
                  ),
                )
                    : CustomSuperButton(
                  text: Staticstring.login,
                  fontSize: 20,
                  bgGradient: Appgradient.primaryGradient,
                  onTap: () {
                    // 1. Basic Validation
                    if (authController.emailController.text.isEmpty ||
                        authController.passwordController.text.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Email and password required",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                      return;
                    }

                    // 2. Call the Controller Function
                    // Note: Ensure your controller function name matches
                    // (loginAccount vs loginaccound)
                    authController.loginAccount();
                  },
                );
              }),

              SizedBox(height: 60.h),

              /// ================= Register Link =================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Staticstring.donthaveaccount),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.reg);
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Color(0xff2563EB)),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}