
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import '../../Services/auth_Controller/auth_Controller.dart';
// import '../../core/route/Genaral_Controler/Genaral_Controler.dart';
// import '../../core/route/route.dart';
// import '../../unity/appColors/appGradient.dart';
// import '../../unity/string_static/strig_static/staticString.dart';
// import '../widget/coustom_Textfield/coustom_Textfield.dart';
// import '../widget/coustom_button/coustom_button.dart';
//
// class RegScreren extends StatelessWidget {
//   const RegScreren({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//    // var authController=Get.put(Authcontroller());
//
//
//
//
//
//     TextEditingController nameController = TextEditingController();
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();
//     TextEditingController confirmPasswordController = TextEditingController();
//     TextEditingController contenTypeController = TextEditingController();
//
//
//     final GenaralControler genController = Get.put(GenaralControler());
//
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 60.h),
//               Center(
//                 child: Text(
//                   Staticstring.register,
//                   style: TextStyle(
//                     fontSize: 28.sp,
//                     fontWeight: FontWeight.bold,
//                     foreground: Paint()
//                       ..shader = Appgradient.primaryGradient.createShader(
//                         Rect.fromLTWH(0, 0, 200, 0),
//                       ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 12),
//               Center(
//                 child: Text(
//                   Staticstring.registerdetels,
//                   style: TextStyle(
//                     color: const Color(0xff888888),
//                     fontSize: 12.sp,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//
//               SizedBox(height: 40.h),
//               // Name
//               Text(
//                 Staticstring.fullname,
//                 style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16.sp),
//               ),
//               SizedBox(height: 12.h),
//               CustomTextField(
//                 hintText: 'Enter your full name...',
//                 controller: nameController,
//                 iconPath: 'assets/icon/Frame (2).svg',
//                 enableValidation: false,
//               ),
//
//               SizedBox(height: 24.h),
//               // Email
//               Text(
//                 Staticstring.Email,
//                 style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16.sp),
//               ),
//               SizedBox(height: 12.h),
//               CustomTextField(
//                 hintText: 'Enter your email...',
//                 controller: emailController,
//                 iconPath: "assets/icon/Frame.svg",
//                 enableValidation: true,
//                 regex: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
//                 errorMessage: 'Invalid email format',
//               ),
//
//               SizedBox(height: 24.h),
//               // Password
//               Text(
//                 Staticstring.password,
//                 style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16.sp),
//               ),
//               SizedBox(height: 12.h),
//               CustomPasswordFormField(
//                 hintText: '********',
//                 controller: passwordController,
//                 iconPath: 'assets/icon/Frame (1).svg',
//               ),
//
//               SizedBox(height: 24.h),
//               // Confirm Password
//               Text(
//                 Staticstring.confirmPassword,
//                 style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16.sp),
//               ),
//               SizedBox(height: 12.h),
//               CustomPasswordFormField(
//                 hintText: '********',
//                 controller: confirmPasswordController,
//                 iconPath: 'assets/icon/Frame (1).svg',
//               ),
//
//               Text(
//                 'Contented Type',
//                 style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16.sp),
//               ),
//               SizedBox(height: 12.h),
//               SimpleCard(
//                 controller:contenTypeController ,
//                 hintText: 'Select Contented Type',
//               ),
//
//               SizedBox(height: 20.h),
//               // Checkbox + Terms + Button
//               Obx(() {
//                 return Column(
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Checkbox(
//                           value: genController.isCheck.value,
//                           activeColor: const Color(0xff2563EB),
//                           onChanged: (value) {
//                             if (value != null) {
//                               genController.isCheck.value = value;
//                             }
//                           },
//                         ),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               genController.isCheck.value =
//                                   !genController.isCheck.value;
//                             },
//                             child: Text(
//                               "By creating an account, you agree to our Privacy Policy & Terms and Conditions.",
//                               style: TextStyle(
//                                 color: genController.isCheck.value
//                                     ? const Color(0xff2563EB)
//                                     : Colors.black,
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 120.h),
//                     CustomSuperButton(
//                       text: Staticstring.register,
//                       onTap: () {
//                         if (!genController.isCheck.value) {
//                           Get.snackbar(
//                             "Error",
//                             "Please accept terms & conditions!",
//                           );
//                         } else {
//
//
//
//
//
//                          Get.toNamed(AppRoute.regVerifyScreen);
//
//
//
//
//                         }
//                         // Registration Logic Here
//                       },
//                       bgGradient: Appgradient.primaryGradient,
//                     ),
//                     SizedBox(height: 40.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           Staticstring.haveanaccount,
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             color: Color(0xff2B2B2B),
//                           ),
//                         ),
//
//                         TextButton(
//                           onPressed: () {
//                             Get.toNamed(AppRoute.login);
//                             print('ajhhfwiue');
//                           },
//                           child: Text(
//                             Staticstring.login,
//                             style: TextStyle(color: Color(0xff2563EB)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Ensure these imports are correct in your project
import '../../core/route/Genaral_Controler/Genaral_Controler.dart';
import '../../core/route/route.dart';
import '../../unity/appColors/appGradient.dart';
import '../../unity/string_static/strig_static/staticString.dart';
import '../widget/coustom_Textfield/coustom_Textfield.dart';
import '../widget/coustom_button/coustom_button.dart';
// Ensure SimpleCard is imported

import 'auth_Controller/auth_Controller.dart';

class RegScreren extends StatelessWidget {
  const RegScreren({super.key});

  @override
  Widget build(BuildContext context) {
   final Authcontroller authController=Get.put(Authcontroller());





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
              const SizedBox(height: 12),
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
                style: TextStyle(color: const Color(0xff2B2B2B), fontSize: 16.sp),
              ),
              SizedBox(height: 12.h),
              CustomTextField(
                hintText: 'Enter your full name...',
                controller: authController.nameController,
                iconPath: 'assets/icon/Frame (2).svg',
                enableValidation: false,
              ),

              SizedBox(height: 24.h),
              // Email
              Text(
                Staticstring.Email,
                style: TextStyle(color: const Color(0xff2B2B2B), fontSize: 16.sp),
              ),
              SizedBox(height: 12.h),
              CustomTextField(
                hintText: 'Enter your email...',
                controller: authController.emailController,
                iconPath: "assets/icon/Frame.svg",
                enableValidation: true,
                regex: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
                errorMessage: 'Invalid email format',
              ),

              SizedBox(height: 24.h),
              // Password
              Text(
                Staticstring.password,
                style: TextStyle(color: const Color(0xff2B2B2B), fontSize: 16.sp),
              ),
              SizedBox(height: 12.h),
              CustomPasswordFormField(
                hintText: '********',
                controller: authController.passwordController,
                iconPath: 'assets/icon/Frame (1).svg',
              ),

              SizedBox(height: 24.h),
              // Confirm Password
              Text(
                Staticstring.confirmPassword,
                style: TextStyle(color: const Color(0xff2B2B2B), fontSize: 16.sp),
              ),
              SizedBox(height: 12.h),
              CustomPasswordFormField(
                hintText: '********',
                controller: authController.confirmPasswordController,
                iconPath: 'assets/icon/Frame (1).svg',
              ),

              // ============================================
              // CONTENT TYPE SELECTION (Solved Logic)
              // ============================================
              Text(
                'Select your role',
                style: TextStyle(color: const Color(0xff2B2B2B), fontSize: 16.sp),
              ),
              SizedBox(height: 12.h),

              GestureDetector(
                onTap: () {
                  // Opens the bottom sheet menu
                  _showRoleSelectionBottomSheet(context,authController. contenTypeController);
                },
                child: AbsorbPointer(
                  // Prevents keyboard from opening
                  child: SimpleCard(
                    controller:authController. contenTypeController,
                    hintText: 'Select your role',
                  ),
                ),
              ),
              // ============================================

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

                    // Register Button
                    CustomSuperButton(
                      text: Staticstring.register,
                      onTap: () {
                        if (!genController.isCheck.value) {
                          // Error if checkbox is not checked
                          Get.snackbar(
                            "Error",
                            "Please accept terms & conditions!",
                            backgroundColor: Colors.redAccent,
                            colorText: Colors.white,
                          );
                        } else if (authController.contenTypeController.text.isEmpty) {
                          // Error if Content Type is empty
                          Get.snackbar(
                            "Required",
                            "Select your role",
                            backgroundColor: Colors.orange,
                            colorText: Colors.white,
                          );
                        } else {
                          // Success Logic
                          // Convert "Teacher" to "teacher" for database if needed
                          String dbRole = authController.contenTypeController.text.toLowerCase();
                         // print("Select your role: $dbRole");

                         authController.Register();


                        }
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
                            color: const Color(0xff2B2B2B),
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoute.login);


                          },
                          child: Text(
                            Staticstring.login,
                            style: TextStyle(color: const Color(0xff2563EB)),
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

  // ==========================================
  // Bottom Sheet Logic for Selection
  // ==========================================
  void _showRoleSelectionBottomSheet(
      BuildContext context, TextEditingController controller) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50, height: 5,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(height: 20),
            const Text("Select Role", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            // Teacher Option
            ListTile(
              leading: const Icon(Icons.school, color: Colors.blue),
              title: const Text("Teacher"),
              onTap: () {
                controller.text = "Teacher"; // Shows in UI
                Get.back(); // Closes menu
              },
            ),
            const Divider(),

            // Parent Option
            ListTile(
              leading: const Icon(Icons.family_restroom, color: Colors.green),
              title: const Text("Parent"),
              onTap: () {
                controller.text = "Parent"; // Shows in UI
                Get.back(); // Closes menu
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}

