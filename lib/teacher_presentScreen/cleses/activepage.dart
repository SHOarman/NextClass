import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/route/route.dart';
import '../techerall_widget/customcard/customcard.dart';

class Activepage extends StatelessWidget {
  const Activepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [



            SizedBox(height: 16.h),

            CustomCardnew(
              title: 'English',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: (){

                Get.toNamed(AppRoute.onlodingdetelsscreen);
              },
            ),
            SizedBox(height: 16.h),
            CustomCardnew(
              title: 'Mathematics',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: (){

                print('pending');
              },
            ),
            SizedBox(height: 16.h),

            CustomCardnew(
              title: 'Mathematics',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: (){


              },
            ),
            SizedBox(height: 16.h),

            CustomCardnew(
              title: 'Mathematics',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: (){

                print('pending');
              },
            ),
            SizedBox(height: 16.h),
            CustomCardnew(
              title: 'Mathematics',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: (){

                print('pending');
              },
            ),

            SizedBox(height: 16.h),

            CustomCardnew(
              title: 'English',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: (){

                print('pending');
              },
            ),
            SizedBox(height: 16.h),
            CustomCardnew(
              title: 'Mathematics',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: (){

                print('pending');
              },
            ),

            CustomCardnew(
              title: 'Mathematics',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: (){


              },
            ),
            SizedBox(height: 16.h),

            CustomCardnew(
              title: 'Mathematics',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: (){

                print('pending');
              },
            ),
            SizedBox(height: 16.h),
            CustomCardnew(
              title: 'Mathematics',
              subtitle: 'Class 6-10',
              iconName: 'Pending - 20',
              onTap: (){

                print('pending');
              },
            ),












          ],


        ),
      ),


    );
  }
}
