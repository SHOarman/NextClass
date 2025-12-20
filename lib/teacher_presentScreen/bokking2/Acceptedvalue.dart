import 'package:first_project/core/route/route.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../techerall_widget/paddinginpormationmodel/paddinginpormationmodel.dart';

class Acceptedvalue extends StatelessWidget {
  const Acceptedvalue({super.key});

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
              fullscrenonTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.white,
                    content: Extrabuttonpaddinginpormationmodel(
                      ontap1: () {},
                      ontap2: () {

                        Get.toNamed(AppRoute.convarcation);
                      },
                      buttonname1: 'Move to Rejected',
                      buttonname2: 'Chat with parent',
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),

            CustomCardnew(
              title: 'Smith Family',
              subtitle: 'Class 2',
              imagePath: 'assets/backround/Rectangle 5050 (2).png',
            ),
            SizedBox(height: 16.h),
            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Class 1',
              imagePath: 'assets/backround/Rectangle 5050 (5).png',
            ),
          ],
        ),
      ),
    );
  }
}
