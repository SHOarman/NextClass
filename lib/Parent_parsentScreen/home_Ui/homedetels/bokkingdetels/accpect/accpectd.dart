import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../teacher_presentScreen/techerall_widget/customcard/customcard.dart';

class Accpectd extends StatelessWidget {
  const Accpectd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              InkWell(
                child: CustomCardnew(
                  title: 'Tutor name',
                  subtitle: 'Subject name',
                  iconName: 'Pending',
                  imagePath: 'assets/backround/boking1.png',
                ),
              ),
              SizedBox(height: 16),
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: 'accepted',
                imagePath: 'assets/backround/boking2.png',

                onTap: () {
                  Get.toNamed(AppRoute.tutionAccpectPage1);
                },
              ),

              SizedBox(height: 16),

              // Get.toNamed()
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: 'accepted',
                imagePath: 'assets/backround/boking6.png',

                onTap: () {
                  Get.toNamed(AppRoute.tutionAccpectPage1);
                },
              ),

              SizedBox(height: 16),
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: 'accepted',
                imagePath: 'assets/backround/boking5.png',

                onTap: () {
                  Get.toNamed(AppRoute.tutionAccpectPage1);
                },
              ),

              SizedBox(height: 16),
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: 'Pending',
                imagePath: 'assets/backround/boking4.png',
              ),
              SizedBox(height: 16),

              CustomCardnew(
                onTap: () {
                  Get.toNamed(AppRoute.tutionAccpectPage1);
                },
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: 'accepted',
                imagePath: 'assets/backround/boking3.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
