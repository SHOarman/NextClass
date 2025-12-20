import 'package:first_project/Parent_parsentScreen/widget/backSleash/backSleash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../unity/string_static/strig_static/staticString.dart';
import '../../home_Ui/homewigdet/recommended Classes/recommended Classes.dart';

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

              LoveRecateds(
                onTap: () {
                  Get.back();
                },
              ),



              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.80, // ✅ FIX OVERFLOW
                ),
                itemCount: Staticstring.LoveRecated.length,
                itemBuilder: (context, index) {
                  // Recommendedclasses(selectindex: index,);
                  return LoveRecatedclasseds(
                    selectindex: index,
                    imagepath: Staticstring.LoveRecated[index]['imagepath'],
                    tutorielname:
                    Staticstring.LoveRecated[index]['tutorielname'],
                    Subjectname:
                    Staticstring.LoveRecated[index]['Subjectname'],
                    classname: Staticstring.LoveRecated[index]['classname'],
                    amount: Staticstring.LoveRecated[index]['amount'],
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
