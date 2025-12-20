import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../techerall_widget/customcard/customcard.dart';

class Inactivepage extends StatelessWidget {
  const Inactivepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [



          CustomCardnew(
            title: 'Mathematics',
            subtitle: 'Class 6-10',
            iconName: 'Pending - 20',
            onTap: (){



            },
          ),
          SizedBox(height: 16.h),

          CustomCardnew(
            title: 'Science',
            subtitle: 'Class 6-10',
            iconName: 'Individual Class',
            onTap: (){

              Get.toNamed(AppRoute.inacriveongoingdetelsscreen);
            },
          ),
          SizedBox(height: 16.h),
          CustomCardnew(
            title: 'English',
            subtitle: 'Class 1-4',
            iconName: 'Pending - 20',

          ),
        ],
      ),


    );
  }
}
