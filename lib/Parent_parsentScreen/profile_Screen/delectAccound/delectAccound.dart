import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/route/route.dart';
import '../../../../../../unity/appColors/appGradient.dart';

import '../../widget/coustom_Textfield/coustom_Textfield.dart';

class Delectaccound extends StatefulWidget {
  const Delectaccound({super.key});

  @override
  State<Delectaccound> createState() => _CancelModelState();
}

class _CancelModelState extends State<Delectaccound> {
  bool isYesSelected = false;
  bool isNoSelected = false;

  final TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),

              /// ===== Title
              const Text(
                'Delete Account',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8.h),

              /// ===== Subtitle
              const Text(
                'Once you delete, you will not be able to recover your account.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff888888), fontSize: 12),
              ),

              SizedBox(height: 24.h),

              /// ===== Yes / No Buttons
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isYesSelected = true;
                          isNoSelected = false;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: isYesSelected
                              ? const Color(0xff2563EB)
                              : const Color(0xffDBDBDB),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: isYesSelected
                                  ? Colors.white
                                  : const Color(0xff2B2B2B),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isNoSelected = true;
                          isYesSelected = false;
                        });
                        Get.back();
                      },
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: isNoSelected
                              ? const Color(0xff2563EB)
                              : const Color(0xffDBDBDB),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: isNoSelected
                                  ? Colors.white
                                  : const Color(0xff2B2B2B),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              /// ===== Reason Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What is your reason for cancelling?',
                  style: TextStyle(
                    color: Color(0xff2B2B2B),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              /// ===== Reason Input
              Customdetesl(
                controller: reasonController,
                hintText: 'Write here..',
              ),

              SizedBox(height: 40.h),

              /// ===== Submit Button
              CustomSuperButton(
                text: 'Submit',
                bgGradient: Appgradient.primaryGradient,
                onTap: () {
                  Get.showSnackbar(
                    GetSnackBar(
                      title: 'Deleted',
                      message: 'Your account has been deleted',

                      backgroundColor: Colors.green,
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Get.toNamed(AppRoute.slashscreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
