import 'package:first_project/Parent_parsentScreen/widget/back_slash/back_slash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/route/route.dart';
import '../../../unity/string_static/strig_static/static_string.dart';
import '../../widget/custom_textfield/custom_textfield.dart';
import '../homewigdet/recommended Classes/recommended_classes.dart';

class Seedetels extends StatelessWidget {
  const Seedetels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              BackSlashButton(
                onTap: () {
                  Get.back();
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

                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75, // ওভারফ্লো এড়াতে একটু লম্বা করা হলো
                ),
                itemCount: Staticstringnew.mathematic.length,
                itemBuilder: (context, index) {
                  return MathematicClass(
                    selectindex: index,
                    imagepath: Staticstringnew.mathematic[index]['imagepath'],
                    tutorielname:
                        Staticstringnew.mathematic[index]['tutorielname'],
                    subjectName:
                        Staticstringnew.mathematic[index]['subjectName'],
                    classname: Staticstringnew.mathematic[index]['classname'],
                    amount: Staticstringnew.mathematic[index]['amount'],
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
