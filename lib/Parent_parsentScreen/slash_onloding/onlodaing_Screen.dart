import 'package:first_project/core/route/route.dart';

import 'package:first_project/unity/appColors/appGradient.dart';
import 'package:first_project/unity/string_static/strig_static/staticString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/route/Genaral_Controler/Genaral_Controler.dart';
import '../widget/coustom_button/coustom_button.dart';
import '../widget/coustomcardparsent_teacher/coustomcardparsent_teacher.dart';


class OnlodaingScreen extends StatefulWidget {
  const OnlodaingScreen({super.key});

  @override
  State<OnlodaingScreen> createState() => _OnlodaingScreenState();
}

class _OnlodaingScreenState extends State<OnlodaingScreen> {

  final GenaralControler  roleController = Get.put(GenaralControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Center(
                child: Image.asset('assets/backround/Employment_1_ 1.png'),
              ),
              SizedBox(height: 28.h),
              Center(child: Image.asset('assets/backround/Frame 4.png')),

              SizedBox(height: 14.h),

              Obx(
                 () {
                  return buildRoleCard(
                    title: Staticstring.parent,
                    description: Staticstring.parentdetles,
                    selected: roleController.selectedRole.value == "parent",
                    onTap: () {

                      roleController.selectRole("parent");


                    },
                  );
                }
              ),
              SizedBox(height: 24.h),
              Obx(
                 () {
                  return buildRoleCard(
                    title: Staticstring.teacher,
                    description: Staticstring.teacherdetels,
                    selected: roleController.selectedRole.value == "teacher",
                    onTap: () {
                      roleController.selectRole("teacher");

                    },
                  );
                }
              ),

              SizedBox(height: 140.h),
              CustomSuperButton(
                text: Staticstring.Select,
                onTap: () {
                  if (roleController.selectedRole.value == "parent") {
                    Get.toNamed(AppRoute.login);
                  } else if(roleController.selectedRole.value == "teacher"){
                    Get.toNamed(AppRoute.teachscre);
                  }
                  else{

                    Get.snackbar(
                      'Error',
                      'Please select a role',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                bgGradient: LinearGradient(
                  colors: [
                    Appgradient.primaryGradient.colors[0],
                    Appgradient.primaryGradient.colors[1],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


