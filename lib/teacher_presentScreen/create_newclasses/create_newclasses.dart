import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import '../../teacher_presentScreen/create_newclasses/step1.dart';
import '../../teacher_presentScreen/create_newclasses/step2.dart';
import '../../teacher_presentScreen/create_newclasses/step3.dart';
import '../../unity/appColors/appGradient.dart';

import 'classCreateController/classCreateController.dart';
import 'customStepindecotor.dart';

class CreateNewclasses extends StatefulWidget {
  const CreateNewclasses({super.key});

  @override
  State<CreateNewclasses> createState() => _CreateNewclassesState();
}

class _CreateNewclassesState extends State<CreateNewclasses> {
  // --- Initialize Controller ---
  final CreateClassController controller = Get.put(CreateClassController());

  // --- Track Current Step Index ---
  int currentStep = 0;

  // --- 🛠️ Validation Function ---
  bool _validateCurrentStep() {
    // Validate Step 2 (Title & Details)
    if (currentStep == 1) {
      if (controller.titleController.text.isEmpty) {
        Get.snackbar("Required", "Please enter class title/subject", backgroundColor: Colors.red, colorText: Colors.white);
        return false;
      }
    }
    // Note: Validation for Step 1 or Step 3 can be added here if needed.
    // (Final validation is handled in controller.submitClass)
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Adjust screen layout when keyboard appears
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              // --- Page Title ---
              const Text(
                'Create a new class',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),

              SizedBox(height: 20.h),

              // --- Step Indicator Widget ---
              StepIndicator(
                currentStep: currentStep,
                onStepTap: (step) {
                  // Allow going back to previous steps, but prevent skipping forward
                  if (step < currentStep) {
                    setState(() => currentStep = step);
                  }
                },
                titles: const ['Step 1', 'Step 2', 'Step 3'],
              ),

              SizedBox(height: 20.h),

              // --- Step Content Body ---
              Expanded(
                child: SingleChildScrollView( // Enables scrolling for smaller screens
                  child: _stepContent(),
                ),
              ),

              // --- Bottom Button Section ---
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  children: [
                    // --- Previous / Cancel Button ---
                    Expanded(
                      child: CustomSuperButton(
                        text: currentStep == 0 ? 'Cancel' : 'Previous',
                        onTap: () {
                          if (currentStep > 0) {
                            setState(() => currentStep--); // Go back one step
                          } else {
                            Get.back(); // Close the screen
                          }
                        },
                        borderColor: Appgradient.primaryGradient.colors[0],
                        textGradient: Appgradient.primaryGradient,
                      ),
                    ),
                    const SizedBox(width: 10),

                    // --- Next / Submit Button ---
                    Expanded(
                      child: Obx(() => CustomSuperButton(
                        text: currentStep == 2 ? 'Submit' : 'Next',
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          if (currentStep < 2) {
                            // Validate and move to next step
                            if (_validateCurrentStep()) {
                              setState(() => currentStep++);
                            }
                          } else {
                            // Final Step: Submit Data
                            controller.submitClass();
                          }
                        },
                        bgGradient: Appgradient.primaryGradient,
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Switch Content Based on Step ---
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