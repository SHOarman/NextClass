import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../../core/route/route.dart';
import '../../../../../teacher_presentScreen/techerall_widget/customcard/customcard.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.tusioncomplectfullreviewscreen);
              },
              child: CustomCardnew(
                fullscrenonTap: () {
                  Get.toNamed(AppRoute.tusioncomplectfullreviewscreen);
                },
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: '',
                imagePath: 'assets/backround/boking1.png',
                showRating: true,
                rating: 4.5,
              ),
            ),
            SizedBox(height: 16),
            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Subject name',
              iconName: '',
              imagePath: 'assets/backround/boking2.png',

              fullscrenonTap: () {
                Get.toNamed(AppRoute.tutionComplectadePage1);
              },
            ),

            SizedBox(height: 16),
            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Subject name',
              iconName: '',

              imagePath: 'assets/backround/boking6.png',
              showRating: true,
              rating: 4.5,

              fullscrenonTap: () {
                Get.toNamed(AppRoute.tusioncomplectfullreviewscreen);
              },
            ),
            SizedBox(height: 16),
            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Subject name',
              iconName: '',
              imagePath: 'assets/backround/boking5.png',

              fullscrenonTap: () {
                Get.toNamed(AppRoute.tutionComplectadePage1);
              },
            ),

            SizedBox(height: 16),

            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Subject name',
              iconName: '',
              imagePath: 'assets/backround/boking4.png',
              showRating: true,
              rating: 4.5,
              fullscrenonTap: () {
                Get.toNamed(AppRoute.tusioncomplectfullreviewscreen);
              },
            ),

            SizedBox(height: 16),
            CustomCardnew(
              title: 'Tutor name',
              subtitle: 'Subject name',
              iconName: '',
              imagePath: 'assets/backround/boking3.png',
              fullscrenonTap: () {
                Get.toNamed(AppRoute.tutionComplectadePage1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
