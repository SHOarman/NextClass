import 'package:first_project/Parent_parsentScreen/widget/coustomcard/coustomcard.dart';

import 'package:first_project/core/route/general_controller/general_controller.dart';
import 'package:first_project/core/route/route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../unity/app_colors/app_gradient.dart';
import '../../widget/custom_textfield/custom_textfield.dart';
import '../../widget/custom_button/custom_button.dart';

class FilterModel extends StatelessWidget {
  const FilterModel({super.key});

  @override
  Widget build(BuildContext context) {
    final Card3 controller = Get.put(Card3());
    final Card4 newController = Get.put(Card4());
    TextEditingController bagecetController = TextEditingController();
    TextEditingController subjectController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Text(
                'Filter for finding tutor...',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'What level is your kid in?',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: 16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 4.w),
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
                  SizedBox(width: 4.w),
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
                  SizedBox(width: 4.w),
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

              SizedBox(height: 24.h),

              Text(
                'select class type',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),

              Padding(
                padding: EdgeInsets.only(right: 00.sp),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => CustomCard(
                          title: "Tuition",
                          selected:
                              newController.selectedCard.value == "Tuition",
                          onTap: () {
                            newController.selectCard("Tuition");
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Obx(
                        () => CustomCard(
                          title: "Enrichment class",
                          selected:
                              newController.selectedCard.value ==
                              "Enrichment class",
                          onTap: () {
                            newController.selectCard("Enrichment class");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'What subject you are looking for?',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),

              SimpleCard(
                controller: subjectController,
                hintText: 'Write subjects name...',
              ),

              SizedBox(height: 24.h),

              Text(
                'Your budget',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),

              SimpleCard(
                controller: bagecetController,
                hintText: 'Enter your budget...',
              ),

              //====================iconbutton============================================
              SizedBox(height: 40.h),
              CustomSuperButton(
                text: 'Filter',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                onTap: () {
                  if (controller.selectedCard.value.isEmpty) {
                    Get.snackbar("Error", "Please select kid level!");
                    return;
                  }

                  if (newController.selectedCard.value.isEmpty) {
                    Get.snackbar("Error", "Please select class type!");
                    return;
                  }

                  Get.toNamed(AppRoute.qutionaries);
                },
                bgGradient: LinearGradient(
                  colors: [Color(0xff2563EB), Color(0xff2563EB)],
                ),
              ),

              SizedBox(height: 16.h),

              CustomSuperButton(
                text: 'Close',
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                onTap: () {
                  Get.back();
                },
                borderColor: Color(0xff2563EB),
                textGradient: Appgradient.primaryGradient,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
