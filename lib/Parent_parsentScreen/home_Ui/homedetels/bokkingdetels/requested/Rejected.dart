import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../teacher_presentScreen/techerall_widget/customcard/customcard.dart';



class Rejected extends StatelessWidget {
  const Rejected({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: 'Reject by you',
                imagePath: 'assets/backround/boking1.png',
                onTap: (){

                  Get.toNamed(AppRoute.rejectiondetels);
                },

              ),
              SizedBox(height: 16),
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: 'Reject by you',
                imagePath: 'assets/backround/boking2.png',
                onTap: (){

                  Get.toNamed(AppRoute.rejectiondetels);
                },
              ),

              SizedBox(height: 16),
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: 'Reject by you',

                imagePath: 'assets/backround/boking6.png',
                onTap: (){

                  Get.toNamed(AppRoute.rejectiondetels);
                },

              ),
              SizedBox(height: 16),
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: 'Reject by you',
                imagePath: 'assets/backround/boking5.png',
                onTap: (){

                  Get.toNamed(AppRoute.rejectiondetels);
                },
              ),

              SizedBox(height: 16),
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: 'Reject by you',
                imagePath: 'assets/backround/boking4.png',

                onTap: (){

                  Get.toNamed(AppRoute.rejectiondetels);
                },

              ),
              SizedBox(height: 16),
              CustomCardnew(
                title: 'Tutor name',
                subtitle: 'Subject name',
                iconName: 'Reject by you',
                imagePath: 'assets/backround/boking3.png',
              onTap: (){

                Get.toNamed(AppRoute.rejectiondetels);
              },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
