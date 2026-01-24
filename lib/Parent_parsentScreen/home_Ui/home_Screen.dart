// import 'package:first_project/Parent_parsentScreen/home_Ui/allow_location/allow_location.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../core/route/general_controller/general_controller.dart';
// import '../../core/route/route.dart';
// import '../../unity/app_colors/app_gradient.dart';
// import '../auth_Screen/auth_controller/parsent_tutor_reg_controller/parsent_tutor_reg_controller.dart';
// import '../widget/custom_textfield/custom_textfield.dart';
// import '../widget/custom_button/custom_button.dart';
// import '../widget/coustomcard/coustomcard.dart';
//
// class HomeScreen extends StatelessWidget {
//   final GenaralControler controller = Get.put(GenaralControler());
//   final Card2 card2Controller = Get.put(Card2());
//   final ParsenttutorRegController parsenttutorRegController = Get.put(
//     ParsenttutorRegController(),
//   );
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
//                 // ================== KID LEVEL SECTION ==================
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
//                           onTap: () => controller.selectCard("Preschool"),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 4.w),
//                     Expanded(
//                       child: Obx(
//                         () => CustomCard(
//                           title: "Primary",
//                           selected: controller.selectedCard.value == "Primary",
//                           onTap: () => controller.selectCard("Primary"),
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
//                           onTap: () => controller.selectCard("Secondary"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 SizedBox(height: 24.h),
//
//                 // ================== CLASS TYPE SECTION ==================
//                 Text(
//                   'select class type',
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
//                             onTap: () => card2Controller.selectCard2("Tuition"),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8.w),
//                       Expanded(
//                         child: Obx(
//                           () => CustomCard(
//                             title: "Enrichment class",
//                             selected:
//                                 card2Controller.selectedCard.value ==
//                                 "Enrichment class",
//                             onTap: () =>
//                                 card2Controller.selectCard2("Enrichment class"),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: 24.h),
//
//                 // ================== SUBJECT SECTION ==================
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
//                   controller: parsenttutorRegController.whatSubjectController,
//                   hintText: 'Write subjects name...',
//                 ),
//
//                 SizedBox(height: 34.h),
//
//                 // ================== SUBMIT BUTTON (Strict Validation) ==================
//                 CustomSuperButton(
//                   text: 'Submit',
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.bold,
//                   bgGradient: LinearGradient(
//                     colors: [Color(0xff2563EB), Color(0xff2563EB)],
//                   ),
//                   onTap: () async {
//                     if (controller.selectedCard.value.isEmpty ||
//                         controller.selectedCard.value == "") {
//                       Get.snackbar(
//                         "Required",
//                         "Please select your kid's level!",
//                         backgroundColor: Colors.redAccent,
//                         colorText: Colors.white,
//                         snackPosition: SnackPosition.BOTTOM,
//                       );
//                       return;
//                     }
//
//                     if (card2Controller.selectedCard.value.isEmpty ||
//                         card2Controller.selectedCard.value == "") {
//                       Get.snackbar(
//                         "Required",
//                         "Please select a class type!",
//                         backgroundColor: Colors.redAccent,
//                         colorText: Colors.white,
//                         snackPosition: SnackPosition.BOTTOM,
//                       );
//                       return;
//                     }
//
//                     if (parsenttutorRegController.whatSubjectController.text
//                         .trim()
//                         .isEmpty) {
//                       Get.snackbar(
//                         "Required",
//                         "Please write the subject name!",
//                         backgroundColor: Colors.redAccent,
//                         colorText: Colors.white,
//                         snackPosition: SnackPosition.BOTTOM,
//                       );
//                       return;
//                     }
//
//                     parsenttutorRegController
//                         .childEducationLevelController
//                         .text = controller.selectedCard.value
//                         .toLowerCase();
//
//                     parsenttutorRegController.classTypeController.text =
//                         card2Controller.selectedCard.value.toLowerCase();
//
//                     // print(
//                     //   "Level: ${parsenttutorRegController.childEducationLevelController.text}",
//                     // );
//                     // print(
//                     //   "Type: ${parsenttutorRegController.classTypeController.text}",
//                     // );
//                     // print(
//                     //   "Subject: ${parsenttutorRegController.whatSubjectController.text}",
//                     // );
//
//                     // ৫. API কল করুন
//                     await parsenttutorRegController.parentRegistration();
//                   },
//                 ),
//
//                 SizedBox(height: 16.h),
//
//                 // ================== SKIP BUTTON (No Validation) ==================
//                 CustomSuperButton(
//                   text: 'skip',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20.sp,
//                   borderColor: Color(0xff2563EB),
//                   textGradient: Appgradient.primaryGradient,
//                   onTap: () {
//                     Get.toNamed(AppRoute.homedetels);
//
//                     Future.delayed(const Duration(milliseconds: 500), () {
//                       if (Get.context != null) {
//                         Get.dialog(
//                           AllowLocationDialog(),
//                           barrierDismissible: false,
//                         );
//                       }
//                     });
//                   },
//                 ),
//
//                 SizedBox(height: 20.h),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:first_project/Parent_parsentScreen/home_Ui/allow_location/allow_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Services/Controller_view/recommend_controlller.dart';
import '../../core/route/general_controller/general_controller.dart';
import '../../core/route/route.dart';
import '../../unity/app_colors/app_gradient.dart';
import '../auth_Screen/auth_controller/parsent_tutor_reg_controller/parsent_tutor_reg_controller.dart';
import '../widget/custom_textfield/custom_textfield.dart';
import '../widget/custom_button/custom_button.dart';
import '../widget/coustomcard/coustomcard.dart';

class HomeScreen extends StatelessWidget {
  final GenaralControler controller = Get.put(GenaralControler());
  final Card2 card2Controller = Get.put(Card2());
  final ParsenttutorRegController parsenttutorRegController = Get.put(ParsenttutorRegController());

  // রিকমেন্ডেড ক্লাস ফেচ করার জন্য কন্ট্রোলার
  final RecommendedController recommendedController = Get.put(RecommendedController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Center(child: Image.asset('assets/backround/a_20 1.png')),
                SizedBox(height: 14.h),
                Center(child: Image.asset('assets/backround/Frame 4 (1).png')),
                SizedBox(height: 25.h),

                // ================== KID LEVEL SECTION ==================
                _buildSectionTitle('What level is your kid in?'),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    _buildLevelCard("Preschool"),
                    SizedBox(width: 8.w),
                    _buildLevelCard("Primary"),
                    SizedBox(width: 8.w),
                    _buildLevelCard("Secondary"),
                  ],
                ),

                SizedBox(height: 24.h),

                // ================== CLASS TYPE SECTION ==================
                _buildSectionTitle('Select class type'),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    _buildTypeCard("Tuition"),
                    SizedBox(width: 8.w),
                    _buildTypeCard("Enrichment class"),
                  ],
                ),

                SizedBox(height: 24.h),

                // ================== SUBJECT SECTION ==================
                _buildSectionTitle('What subject you are looking for?'),
                SizedBox(height: 16.h),
                SimpleCard(
                  controller: parsenttutorRegController.whatSubjectController,
                  hintText: 'Write subjects name (e.g. Bangla)',
                ),

                SizedBox(height: 40.h),

                // ================== SUBMIT BUTTON (Logic Updated) ==================
                Obx(() => CustomSuperButton(
                  text: recommendedController.isLoading.value ? 'Loading...' : 'Submit',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  bgGradient: const LinearGradient(colors: [Color(0xff2563EB), Color(0xff2563EB)]),
                  onTap: () async {
                    String selectedLevel = controller.selectedCard.value.toLowerCase();
                    String selectedType = card2Controller.selectedCard.value.toLowerCase();
                    String subjects = parsenttutorRegController.whatSubjectController.text.trim();

                    // ভ্যালিডেশন
                    if (selectedLevel.isEmpty || selectedType.isEmpty || subjects.isEmpty) {
                      Get.snackbar("Required", "Please fill all fields", backgroundColor: Colors.redAccent, colorText: Colors.white);
                      return;
                    }

                    // ১. প্রোফাইল ডাটা কন্ট্রোলারে সেট করা
                    parsenttutorRegController.childEducationLevelController.text = selectedLevel;
                    parsenttutorRegController.classTypeController.text = selectedType;

                    // ২. সার্ভারে প্রোফাইল ডাটা পোস্ট করা
                    await parsenttutorRegController.parentRegistration();

                    // ৩. প্রোফাইল ডাটা অনুযায়ী রিকমেন্ডেড ক্লাস ফেচ করা
                    await recommendedController.fetchRecommendedClasses(
                      level: selectedLevel,
                      type: selectedType,
                      subjects: subjects,
                    );

                    // ৪. হোম ডিটেইলসে নেভিগেট
                    Get.offAllNamed(AppRoute.homedetels);

                    Future.delayed(const Duration(milliseconds: 500), () {
                      Get.dialog(AllowLocationDialog(), barrierDismissible: false);
                    });
                  },
                )),

                SizedBox(height: 16.h),

                // ================== SKIP BUTTON ==================
                CustomSuperButton(
                  text: 'Skip',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  borderColor: const Color(0xff2563EB),
                  textGradient: Appgradient.primaryGradient,
                  onTap: () {
                    Get.toNamed(AppRoute.homedetels);
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Get.dialog(AllowLocationDialog(), barrierDismissible: false);
                    });
                  },
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper Methods
  Widget _buildSectionTitle(String title) => Text(title, style: TextStyle(fontSize: 16.sp, color: const Color(0xff2B2B2B), fontWeight: FontWeight.bold));

  Widget _buildLevelCard(String title) => Expanded(child: Obx(() => CustomCard(title: title, selected: controller.selectedCard.value == title, onTap: () => controller.selectCard(title))));

  Widget _buildTypeCard(String title) => Expanded(child: Obx(() => CustomCard(title: title, selected: card2Controller.selectedCard.value == title, onTap: () => card2Controller.selectCard2(title))));
}