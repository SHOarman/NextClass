import 'package:first_project/Parent_parsentScreen/widget/back_slash/back_slash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../unity/string_static/strig_static/static_string.dart';
import '../../home_Ui/homewigdet/recommended Classes/recommended_classes.dart';

class Favoritetutor extends StatelessWidget {
  const Favoritetutor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 100.h),

              LoveReacteds(
                onTap: () {
                  Get.back();
                },
              ),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.80, // ✅ FIX OVERFLOW
                ),
                itemCount: Staticstring.loveReacted.length,
                itemBuilder: (context, index) {
                  // Recommendedclasses(selectindex: index,);
                  return LoveReactedClasses(
                    selectindex: index,
                    imagepath: Staticstring.loveReacted[index]['imagepath'],
                    tutorielname:
                        Staticstring.loveReacted[index]['tutorielname'],
                    subjectName: Staticstring.loveReacted[index]['subjectName'],
                    classname: Staticstring.loveReacted[index]['classname'],
                    amount: Staticstring.loveReacted[index]['amount'],
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
