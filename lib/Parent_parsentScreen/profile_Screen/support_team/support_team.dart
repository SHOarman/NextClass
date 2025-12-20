import 'package:first_project/Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:first_project/unity/string_static/strig_static/staticString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../unity/appColors/appGradient.dart';
import '../../widget/backSleash/backSleash.dart';

class SupportTeam extends StatelessWidget {
  const SupportTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h),
              BackSlashButton(
                onTap: () {
                  Get.back();
                },
              ),
              SizedBox(height: 40.h),
              Text(
                Staticstring.Email,
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),
              SizedBox(height: 12.h),
              SimpleCard(
                controller: TextEditingController(),
                hintText: 'Enter your email...',
              ),

              SizedBox(height: 24.h),
              Text(
                'Supported issue',
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),

              SizedBox(height: 12.h),
              // SimpleCard(controller: TextEditingController(), hintText: 'Enter your issue...'),
              Customdetesl(
                controller: TextEditingController(),
                hintText: 'Enter your issue...',
              ),
              SizedBox(height: 80.h),

              CustomSuperButton(
                text: 'Send',
                fontSize: 20,
                onTap: () {
                  Get.back();
                },
                bgGradient: Appgradient.primaryGradient,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
