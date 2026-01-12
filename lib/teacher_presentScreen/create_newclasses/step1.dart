import 'package:first_project/unity/appColors/appGradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Parent_parsentScreen/widget/coustomcard/coustomcard.dart';
import '../../core/route/Genaral_Controler/Genaral_Controler.dart';

class Step1 extends StatelessWidget {
  const Step1({super.key});

  @override
  Widget build(BuildContext context) {
    final GenaralController controller = Get.put(GenaralController());
    final Card2 card2Controller = Get.put(Card2());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),

              Text(
                'Your class level.',
                style: TextStyle(
                  color: Appgradient.TextColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),

              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => CustomCard(
                        title: "Preschool",
                        selected: controller.selectedCard.value == "Preschool",
                        onTap: () {
                          controller.selectCard("Preschool");
                        },
                      ),
                    ),
                  ),

                  SizedBox(width: 8.w),

                  Expanded(
                    child: Obx(
                      () => CustomCard(
                        title: "Primary",
                        selected: controller.selectedCard.value == "Primary",
                        onTap: () {
                          controller.selectCard("Primary");
                        },
                      ),
                    ),
                  ),

                  SizedBox(width: 8.w),

                  Expanded(
                    child: Obx(
                      () => CustomCard(
                        title: "Secondary",
                        selected: controller.selectedCard.value == "Secondary",
                        onTap: () {
                          controller.selectCard("Secondary");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Obx(
                () => Padding(
                  padding:  EdgeInsets.only(right: 150.sp),
                  child: CustomCard(

                    title: "Tertiary Education",
                    selected:
                        controller.selectedCard.value == "Tertiary Education",
                    onTap: () {
                      controller.selectCard("Tertiary Education");
                    },
                  ),
                ),
              ),

              SizedBox(height: 14.h),

              Text(
                'Select class size',
                style: TextStyle(
                  color: Appgradient.TextColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 16.h),
              Row(
                children: [
                  SizedBox(width: 4.h),
                  Expanded(
                    child: Obx(
                      () => CustomCard(
                        title: "Group",
                        selected: card2Controller.selectedCard.value == "Group",
                        onTap: () {
                          card2Controller.selectedCard("Group");
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 4.h),
                  Expanded(
                    child: Obx(
                      () => CustomCard(
                        title: "Individual",
                        selected:
                            card2Controller.selectedCard.value == "Individual",
                        onTap: () {
                          card2Controller.selectedCard("Individual");
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 4.h),

                  Expanded(
                    child: Obx(
                      () => CustomCard(
                        title: "Both",
                        selected: card2Controller.selectedCard.value == "Both",
                        onTap: () {
                          card2Controller.selectedCard("Both");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// import 'package:first_project/teacher_presentScreen/create_newclasses/classCreateController/classCreateController.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// import '../../Parent_parsentScreen/widget/coustomcard/coustomcard.dart' show CustomCard;
//
// class Step1 extends StatelessWidget {
//   const Step1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // এখানে Get.put করবেন না, Get.find করবেন
//     final CreateClassController controller = Get.find<CreateClassController>();
//
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ... বাকি কোড ...
//
//           // CustomCard আপডেট:
//           Obx(() => CustomCard(
//             title: "Preschool",
//             // controller.selectedCard এর বদলে controller.selectedLevel ব্যবহার করুন
//             selected: controller.selectedLevel.value == "Preschool",
//             onTap: () => controller.selectedLevel.value = "Preschool",
//           )),
//
//           // ... Group/Individual আপডেট ...
//           Obx(() => CustomCard(
//             title: "Group",
//             selected: controller.selectedGroupType.value == "Group",
//             onTap: () => controller.selectedGroupType.value = "Group",
//           )),
//         ],
//       ),
//     );
//   }
// }