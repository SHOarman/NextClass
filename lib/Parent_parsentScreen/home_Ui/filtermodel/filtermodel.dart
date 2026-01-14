import 'package:first_project/Parent_parsentScreen/widget/coustomcard/coustomcard.dart';

import 'package:first_project/core/route/Genaral_Controler/genaral_controler.dart';
import 'package:first_project/core/route/route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../unity/appColors/appGradient.dart';
import '../../widget/coustom_Textfield/coustom_Textfield.dart';
import '../../widget/coustom_button/coustom_button.dart';

class Filtermodel extends StatelessWidget {
  const Filtermodel({super.key});

  @override
  Widget build(BuildContext context) {
    final Card3 Controller = Get.put(Card3());
    final Card4 newController = Get.put(Card4());
    TextEditingController bagecetcontroller = TextEditingController();
    TextEditingController subjectcontroller = TextEditingController();

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
                        selected: Controller.selectedCard.value == "Preschool",
                        onTap: () {
                          Controller.selectCard("Preschool");
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Obx(
                      () => CustomCard(
                        title: "Primary",
                        selected: Controller.selectedCard.value == "Primary",
                        onTap: () {
                          Controller.selectCard("Primary");
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Obx(
                      () => CustomCard(
                        title: "Secondary",
                        selected: Controller.selectedCard.value == "Secondary",
                        onTap: () {
                          Controller.selectCard("Secondary");
                        },
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

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
                controller: subjectcontroller,
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
                controller: bagecetcontroller,
                hintText: 'Enter your budget...',
              ),

              //====================iconbutton============================================
              SizedBox(height: 40.h),
              CustomSuperButton(
                text: 'Filter',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                onTap: () {
                  if (Controller.selectedCard.value.isEmpty) {
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
