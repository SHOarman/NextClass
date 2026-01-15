import 'package:first_project/Parent_parsentScreen/widget/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/route/route.dart';
import '../../../../../../unity/app_colors/app_gradient.dart';
import '../../../../../widget/custom_textfield/custom_textfield.dart';
import '../../../../../../core/succesfullcontroler/succesfullcontroler.dart';

class CancelModel extends StatefulWidget {
  const CancelModel({super.key});

  @override
  State<CancelModel> createState() => _CancelModelState();
}

class _CancelModelState extends State<CancelModel> {
  bool isYesselected = false;
  bool isNoselected = false;

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
                'Are you sure?',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8.h),

              /// ===== Subtitle
              const Text(
                'Once you cancel, you won’t be able to join this class.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff888888),
                  fontSize: 12,
                ),
              ),

              SizedBox(height: 24.h),

              /// ===== Yes / No Buttons
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isYesselected = true;
                          isNoselected = false;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: isYesselected
                              ? const Color(0xff2563EB)
                              : const Color(0xffDBDBDB),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: isYesselected
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
                          isNoselected = true;
                          isYesselected = false;
                        });
                        Get.back();
                      },
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: isNoselected
                              ? const Color(0xff2563EB)
                              : const Color(0xffDBDBDB),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: isNoselected
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
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      backgroundColor: Colors.white,
                      content: Reviewpopupmsg(
                        name: 'Successful',
                        namedetels:
                        'You have successfully cancelled the booking.',
                        buName1: 'Back to booking',
                        ontap1: () {
                          Get.toNamed(AppRoute.homedetels);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
