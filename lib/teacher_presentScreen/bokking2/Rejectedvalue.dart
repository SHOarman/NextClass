import 'package:first_project/teacher_presentScreen/techerall_widget/paddinginpormationmodel/paddinginpormationmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../core/route/route.dart';
import '../techerall_widget/customcard/customcard.dart';

class Rejectedvalue extends StatelessWidget {
  const Rejectedvalue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),

            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Class 1',
              imagePath: 'assets/backround/Rectangle 5050 (5).png',
              iconName: 'Reject by you',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.white,
                    content: Rejecationpaddinginpormationmodel(
                      ontap1: () {


                        Get.toNamed(AppRoute.convarcation);
                      },
                      ontap2: () {
                        Get.back();


                      },
                      buttonname1: 'Chat with parent',
                      buttonname2: 'Delete from list',
                    ),
                  ),
                );
                //content:
              },
            ),
            SizedBox(height: 16.h),

            CustomCardnew(
              title: 'Smith Family',
              subtitle: 'Class 2',
              imagePath: 'assets/backround/Rectangle 5050 (2).png',
              iconName: 'Reject by you',
              onTap: () {
                print('reject');
              },
            ),
            SizedBox(height: 16.h),
            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Class 1',
              imagePath: 'assets/backround/Rectangle 5050 (5).png',
              iconName: 'Reject by you',
              onTap: () {
                print('reject');
              },
            ),
          ],
        ),
      ),
    );
  }
}
