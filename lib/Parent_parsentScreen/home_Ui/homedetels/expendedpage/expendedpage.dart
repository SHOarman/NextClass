import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../core/route/route.dart';
import '../../../../unity/string_static/strig_static/static_string.dart';
import '../../../widget/back_slash/back_slash.dart';
import '../../../widget/custom_textfield/custom_textfield.dart';
import '../../homewigdet/recommended Classes/recommended_classes.dart';

class Expendedpage extends StatelessWidget {
  const Expendedpage({super.key});

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

              Row(
                children: [
                  Expanded(
                    child: SimpleCard(
                      controller: TextEditingController(),
                      hintText: 'Search tutors by subject',
                      prefixicon: true,
                    ),
                  ),


                ],
              ),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.80, // ✅ mainAxisExtent বাদ
                ),
                itemCount: Staticstring.explperdetels.length,
                itemBuilder: (context, index) {
                  return Exploerclasses(
                    selectindex: index, // ✅ index পাঠান
                    imagepath: Staticstring.explperdetels[index]['imagepath'],
                    tutorielname:
                        Staticstring.explperdetels[index]['tutorielname'],
                    subjectName:
                        Staticstring.explperdetels[index]['subjectName'],
                    classname: Staticstring.explperdetels[index]['classname'],
                    amount: Staticstring.explperdetels[index]['amount'],
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
