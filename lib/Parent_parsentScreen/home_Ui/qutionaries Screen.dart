import 'package:first_project/Parent_parsentScreen/widget/backSleash/backSleash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../core/route/route.dart';
import '../../unity/string_static/strig_static/staticString.dart';
import '../widget/coustom_Textfield/coustom_Textfield.dart';
import 'homewigdet/recommended Classes/recommended Classes.dart';

class Qutionaries extends StatelessWidget {
  const Qutionaries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Mathmatic(
                onTap: () {
                  Get.toNamed(AppRoute.homedetels);
                },
              ),
              SizedBox(height: 40.h),

              Row(
                children: [
                  Expanded(
                    child: SimpleCard(
                      controller: TextEditingController(),
                      hintText: 'Search tutors by subject',
                      prefixicon: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Get.toNamed(AppRoute.filtermodel);
                    },
                    child: Container(
                      height: 55,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(
                        'assets/icon/instant_mix.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                shrinkWrap: true,
                // স্ক্রল ঠিকভাবে কাজ করার জন্য physics পরিবর্তন করা যেতে পারে
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75, // ওভারফ্লো এড়াতে একটু লম্বা করা হলো
                ),
                itemCount: Staticstringnew.Mathmatic.length,
                itemBuilder: (context, index) {
                  return Mathmaticlass(
                    selectindex: index,
                    imagepath: Staticstringnew.Mathmatic[index]['imagepath'],
                    tutorielname:
                        Staticstringnew.Mathmatic[index]['tutorielname'],
                    Subjectname:
                        Staticstringnew.Mathmatic[index]['Subjectname'],
                    classname: Staticstringnew.Mathmatic[index]['classname'],
                    amount: Staticstringnew.Mathmatic[index]['amount'],
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
