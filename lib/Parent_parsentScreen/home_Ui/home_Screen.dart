// import 'package:first_project/Parent_parsentScreen/home_Ui/allow_location/allow_location.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import '../../core/route/Genaral_Controler/Genaral_Controler.dart';
// import '../../core/route/route.dart';
// import '../../unity/appColors/appGradient.dart';
// import '../auth_Screen/auth_Controller/parsent_tutorReg_Controller/parsent_tutorReg_Controller.dart';
// import '../widget/coustom_Textfield/coustom_Textfield.dart';
// import '../widget/coustom_button/coustom_button.dart';
// import '../widget/coustomcard/coustomcard.dart';
//
// class HomeScreen extends StatelessWidget {
//   final GenaralControler controller = Get.put(GenaralControler());
//   final Card2 card2Controller = Get.put(Card2());
//   final TextEditingController subjectController = TextEditingController();
//
//   final ParsentTutorregController parsentTutorregController =
//       Get.put(ParsentTutorregController());
//
//   HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.sp),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 80.h),
//                 Image.asset('assets/backround/a_20 1.png'),
//                 SizedBox(height: 14.h),
//
//                 Center(child: Image.asset('assets/backround/Frame 4 (1).png')),
//                 SizedBox(height: 20.h),
//
//                 Text(
//                   'What level is your kid in?',
//                   style: TextStyle(
//                     fontSize: 16.sp,
//                     color: Color(0xff2B2B2B),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 12.h),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Obx(
//                         () => CustomCard(
//                           title: "Preschool",
//                           selected:
//                               controller.selectedCard.value == "Preschool",
//                           onTap: () {
//                             controller.selectCard("Preschool");
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 4.w),
//                     Expanded(
//                       child: Obx(
//                         () => CustomCard(
//                           title: "Primary",
//                           selected: controller.selectedCard.value == "Primary",
//                           onTap: () {
//                             controller.selectCard("Primary");
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 4.w),
//                     Expanded(
//                       child: Obx(
//                         () => CustomCard(
//                           title: "Secondary",
//                           selected:
//                               controller.selectedCard.value == "Secondary",
//                           onTap: () {
//                             controller.selectCard("Secondary");
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 SizedBox(height: 24.h),
//
//                 Text(
//                   'Select class type',
//                   style: TextStyle(
//                     color: Color(0xff2B2B2B),
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 12.h),
//
//                 Padding(
//                   padding: EdgeInsets.only(right: 00.w),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Obx(
//                           () => CustomCard(
//                             title: "Tuition",
//                             selected:
//                                 card2Controller.selectedCard.value == "Tuition",
//                             onTap: () {
//                               card2Controller.selectCard2("Tuition");
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8.w),
//                       Expanded(
//                         child: Obx(
//                           () => CustomCard(
//                             title: "Enrichment  class",
//                             selected:
//                                 card2Controller.selectedCard.value ==
//                                 "Enrichment class",
//                             onTap: () {
//                               card2Controller.selectCard2("Enrichment class");
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: 24.h),
//
//                 Text(
//                   'What subject you are looking for?',
//                   style: TextStyle(
//                     color: Color(0xff2B2B2B),
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//
//                 SimpleCard(
//                   controller: parsentTutorregController.WhatsubjectController,
//                   hintText: 'Write subjects name...',
//                 ),
//
//                 SizedBox(height: 34.h),
//
//                 // Submit Button
//                 // Submit Button
//                 CustomSuperButton(
//                   text: 'Submit',
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.bold,
//                   onTap: () async {
//                     if (controller.selectedCard.value.isEmpty) {
//                       Get.snackbar("Error", "Please select kid level!");
//                       return;
//                     }
//
//                     if (card2Controller.selectedCard.value.isEmpty) {
//                       Get.snackbar("Error", "Please select class type!");
//                       return;
//                     }
//
//                     parsentTutorregController
//                         .childEducationLevelController
//                         .text = controller.selectedCard.value
//                         .toLowerCase();
//
//                     parsentTutorregController.classTypeController.text =
//                         card2Controller.selectedCard.value.toLowerCase();
//
//
//
//                     print(
//                       "Level: ${parsentTutorregController.childEducationLevelController.text}",
//                     );
//                     print(
//                       "Type: ${parsentTutorregController.classTypeController.text}",
//                     );
//                     print(
//                       "Subject: ${parsentTutorregController.WhatsubjectController.text}",
//                     );
//
//                     await parsentTutorregController.Parentregistration();
//                   },
//                   bgGradient: LinearGradient(
//                     colors: [Color(0xff2563EB), Color(0xff2563EB)],
//                   ),
//                 ),
//
//                 SizedBox(height: 16.h),
//
//                 CustomSuperButton(
//                   text: 'Skip',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20.sp,
//                   onTap: () {
//                     Get.toNamed(AppRoute.allowlocation);
//
//                     Future.delayed(const Duration(milliseconds: 500), () {
//                       Get.dialog(
//                         AllowLocationDialog(),
//                         barrierDismissible: false,
//                       );
//                     });
//                   },
//                   borderColor: Color(0xff2563EB),
//                   textGradient: Appgradient.primaryGradient,
//                 ),                SizedBox(height: 20.h),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:first_project/Parent_parsentScreen/home_Ui/allow_location/allow_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/route/Genaral_Controler/Genaral_Controler.dart';
import '../../core/route/route.dart';
import '../../unity/appColors/appGradient.dart';
import '../auth_Screen/auth_Controller/parsent_tutorReg_Controller/parsent_tutorReg_Controller.dart';
import '../widget/coustom_Textfield/coustom_Textfield.dart';
import '../widget/coustom_button/coustom_button.dart';
import '../widget/coustomcard/coustomcard.dart';

class HomeScreen extends StatelessWidget {
  final GenaralControler controller = Get.put(GenaralControler());
  final Card2 card2Controller = Get.put(Card2());
  final ParsentTutorregController parsentTutorregController = Get.put(ParsentTutorregController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80.h),
                Image.asset('assets/backround/a_20 1.png'),
                SizedBox(height: 14.h),

                Center(child: Image.asset('assets/backround/Frame 4 (1).png')),
                SizedBox(height: 20.h),

                // ================== KID LEVEL SECTION ==================
                Text(
                  'What level is your kid in?',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff2B2B2B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Obx(() => CustomCard(
                        title: "Preschool",
                        selected: controller.selectedCard.value == "Preschool",
                        onTap: () => controller.selectCard("Preschool"),
                      )),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Obx(() => CustomCard(
                        title: "Primary",
                        selected: controller.selectedCard.value == "Primary",
                        onTap: () => controller.selectCard("Primary"),
                      )),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Obx(() => CustomCard(
                        title: "Secondary",
                        selected: controller.selectedCard.value == "Secondary",
                        onTap: () => controller.selectCard("Secondary"),
                      )),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

                // ================== CLASS TYPE SECTION ==================
                Text(
                  'Select class type',
                  style: TextStyle(
                    color: Color(0xff2B2B2B),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),

                Padding(
                  padding: EdgeInsets.only(right: 00.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Obx(() => CustomCard(
                          title: "Tuition",
                          selected: card2Controller.selectedCard.value == "Tuition",
                          onTap: () => card2Controller.selectCard2("Tuition"),
                        )),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Obx(() => CustomCard(
                          title: "Enrichment class",
                          selected: card2Controller.selectedCard.value == "Enrichment class",
                          onTap: () => card2Controller.selectCard2("Enrichment class"),
                        )),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                // ================== SUBJECT SECTION ==================
                Text(
                  'What subject you are looking for?',
                  style: TextStyle(
                    color: Color(0xff2B2B2B),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),

                SimpleCard(
                  controller: parsentTutorregController.WhatsubjectController,
                  hintText: 'Write subjects name...',
                ),

                SizedBox(height: 34.h),

                // ================== SUBMIT BUTTON (Strict Validation) ==================
                CustomSuperButton(
                  text: 'Submit',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  bgGradient: LinearGradient(
                    colors: [Color(0xff2563EB), Color(0xff2563EB)],
                  ),
                  onTap: () async {
                    if (controller.selectedCard.value.isEmpty || controller.selectedCard.value == "") {
                      Get.snackbar(
                        "Required",
                        "Please select your kid's level!",
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    if (card2Controller.selectedCard.value.isEmpty || card2Controller.selectedCard.value == "") {
                      Get.snackbar(
                        "Required",
                        "Please select a class type!",
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    if (parsentTutorregController.WhatsubjectController.text.trim().isEmpty) {
                      Get.snackbar(
                        "Required",
                        "Please write the subject name!",
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    parsentTutorregController.childEducationLevelController.text =
                        controller.selectedCard.value.toLowerCase();

                    parsentTutorregController.classTypeController.text =
                        card2Controller.selectedCard.value.toLowerCase();

                    print("Level: ${parsentTutorregController.childEducationLevelController.text}");
                    print("Type: ${parsentTutorregController.classTypeController.text}");
                    print("Subject: ${parsentTutorregController.WhatsubjectController.text}");

                    // ৫. API কল করুন
                    await parsentTutorregController.Parentregistration();
                  },
                ),

                SizedBox(height: 16.h),

                // ================== SKIP BUTTON (No Validation) ==================
                CustomSuperButton(
                  text: 'Skip',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  borderColor: Color(0xff2563EB),
                  textGradient: Appgradient.primaryGradient,
                  onTap: () {


                    Get.toNamed(AppRoute.homedetels);

                    Future.delayed(const Duration(milliseconds: 500), () {
                      if (Get.context != null) {
                        Get.dialog(
                          AllowLocationDialog(),
                          barrierDismissible: false,
                        );
                      }
                    });
                  },
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
