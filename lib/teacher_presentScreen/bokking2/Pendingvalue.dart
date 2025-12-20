import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/paddinginpormationmodel/paddinginpormationmodel.dart';

class Pendingvalue extends StatelessWidget {
  const Pendingvalue({super.key});

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
                // Show dialog on tapping the card
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.white,
                    content: Paddinginpormationmodel(
                      Reject: () {
                        // Close the dialog when Reject is tapped
                        Get.back();
                      },
                      Chat: () {
                        // Navigate to chat screen
                        Get.toNamed(AppRoute.convarcation);
                      },
                      Accept: () {
                        // Show Snackbar when Accept is tapped
                        Get.showSnackbar(
                          GetSnackBar(
                            title: 'Request Accepted',
                            message: 'You have successfully accepted the request.',
                            backgroundColor: Colors.green,
                            snackPosition: SnackPosition.BOTTOM,
                            duration: Duration(seconds: 2),
                          ),
                        );

                        // Close the dialog after showing the snackbar
                        Get.back();
                      },
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
            SizedBox(height: 16.h),
            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Class 1',
              imagePath: 'assets/backround/Rectangle 5050 (1).png',
            ),
            SizedBox(height: 16.h),
            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Class 1',
              imagePath: 'assets/backround/Rectangle 5050 (1).png',
            ),
            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Class 1',
              imagePath: 'assets/backround/Rectangle 5050 (1).png',
            ),
            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Class 1',
              imagePath: 'assets/backround/Rectangle 5050 (1).png',
            ),
          ],
        ),
      ),
    );
  }
}
