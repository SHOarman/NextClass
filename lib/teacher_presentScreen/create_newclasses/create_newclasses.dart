import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:first_project/teacher_presentScreen/create_newclasses/step1.dart';
import 'package:first_project/teacher_presentScreen/create_newclasses/step2.dart';
import 'package:first_project/teacher_presentScreen/create_newclasses/step3.dart';
import 'package:first_project/unity/appColors/appGradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../core/route/Genaral_Controler/Genaral_Controler.dart';
import '../../core/route/route.dart';
import '../../core/succesfullcontroler/succesfullcontroler.dart';
import 'classCreateController/classCreateController.dart';
import 'customStepindecotor.dart';

class CreateNewclasses extends StatefulWidget {
  const CreateNewclasses({super.key});

  @override
  State<CreateNewclasses> createState() => _CreateNewclassesState();
}

class _CreateNewclassesState extends State<CreateNewclasses> {
  final GenaralController controller = GenaralController();
  final Card2 card2Controller = Card2();
  var classcreatecontroller = Get.put(Classcreatecontroller());

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Container(
          width: 440.w,
          height: 520.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Create a new class',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),

              SizedBox(height: 20.h),

              /// ✅ CUSTOM STEP INDICATOR
              StepIndicator(
                currentStep: currentStep,

                onStepTap: (step) {
                  setState(() => currentStep = step);
                },
                titles: ['Step 1', 'Step 2', 'Step 3'],
              ),

              Expanded(child: _stepContent()),
              Row(
                children: [
                  Expanded(
                    child: CustomSuperButton(
                      text: currentStep == 2 ? 'Close' : 'Previous',
                      onTap: () {
                        if (currentStep > 0) {
                          setState(() => currentStep--);
                        }
                      },
                      borderColor: Appgradient.primaryGradient.colors[0],
                      textGradient: Appgradient.primaryGradient,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomSuperButton(
                      text: currentStep == 2 ? 'Submit' : 'Next',
                      onTap: () {
                        if (currentStep < 2) {
                          // Move to next step
                          setState(() => currentStep++);
                        } else {
                          // ✅ Submit action: Show dialog
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: Colors.white,
                              content: Successfullmsg(
                                name: 'Successful',
                                namedetels: '',
                                bu_name1: 'Track class',
                                ontap1: () {
                                  classcreatecontroller.addClass();

                                  Get.toNamed(AppRoute.home2);
                                },
                                bu_name2:
                                    'Close', // optional second button text, leave empty if not needed
                                ontap2: () {
                                  Get.back();
                                }, // optional second button action
                              ),
                            ),
                          );
                        }
                      },
                      bgGradient: Appgradient.primaryGradient,
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

  Widget _stepContent() {
    switch (currentStep) {
      case 0:
        return const Step1();
      case 1:
        return const Step2();
      case 2:
        return const Step3();
      default:
        return const SizedBox();
    }
  }
}
