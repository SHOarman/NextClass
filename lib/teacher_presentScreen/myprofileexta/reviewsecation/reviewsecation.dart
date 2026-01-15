import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../../teacher_presentScreen/techerall_widget/customcard/customcard.dart';
import '../../../Parent_parsentScreen/widget/back_slash/back_slash.dart';

class Reviewsecation extends StatelessWidget {
  const Reviewsecation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 60),

              BackSlashButton(
                onTap: () {
                  Get.back();
                },
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  //==========================================
                },
                child: CustomCardnew(
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
              ),

              SizedBox(height: 16),
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: '',

                imagePath: 'assets/backround/boking6.png',
                showRating: true,
                rating: 4.5,
              ),
              SizedBox(height: 16),
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: '',
                imagePath: 'assets/backround/boking5.png',
              ),

              SizedBox(height: 16),
              InkWell(
                onTap: () {},
                child: CustomCardnew(
                  title: 'Tutor name',
                  subtitle: 'Subject name',
                  iconName: '',
                  imagePath: 'assets/backround/boking4.png',
                  showRating: true,
                  rating: 4.5,
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  //================================
                },
                child: CustomCardnew(
                  title: 'Tutor name',
                  subtitle: 'Subject name',
                  iconName: '',
                  imagePath: 'assets/backround/boking3.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
