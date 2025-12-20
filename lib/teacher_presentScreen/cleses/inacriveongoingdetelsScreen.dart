import 'package:first_project/Parent_parsentScreen/widget/backSleash/backSleash.dart';
import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:first_project/core/route/route.dart';
import 'package:first_project/unity/appColors/appGradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/succesfullcontroler/succesfullcontroler.dart';
import '../bokking2/bokkingWidget/Tuitiondetails.dart';

class Inacriveongoingdetelsscreen extends StatelessWidget {
  const Inacriveongoingdetelsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              BackSlashButton(
                onTap: () {
                  Get.back();
                },
              ),
              SizedBox(height: 40.h),

              Tuitiondetails(
                title: 'Tuition details',
                title2: 'Mathematics',
                title3: '\$560.00',
                title4: 'Group class',
                title1: 'Class 1-4',
              ),

              SizedBox(height: 500.h),

              CustomSuperButton(
                text: 'Mark as active',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      backgroundColor: Colors.white,
                      content: Successfullmsg(
                        name: 'Successful',
                        namedetels: 'Your class listing is now live',
                        bu_name1: 'Edit class',
                        ontap1: () {

                          Get.toNamed(AppRoute.classes);
                        },
                        bu_name2: 'Close',
                        ontap2: () {
                          Get.back();


                        },
                      ),
                    ),
                  );
                },
                bgGradient: Appgradient.primaryGradient,
              ),
              SizedBox(height: 20.h),
              CustomSuperButton(
                text: 'Delete class',
                onTap: () {
                  Get.toNamed(AppRoute.home2);

                },
                borderColor: Appgradient.primaryGradient.colors[0],
                textGradient: Appgradient.primaryGradient,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
