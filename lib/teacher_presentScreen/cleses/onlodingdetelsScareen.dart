import 'package:first_project/Parent_parsentScreen/widget/backSleash/backSleash.dart';
import 'package:first_project/core/route/route.dart';
import 'package:first_project/unity/appColors/appGradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import '../bokking2/bokkingWidget/Tuitiondetails.dart';
import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/markasinactive/markasinactive.dart';
import '../techerall_widget/paddinginpormationmodel/paddinginpormationmodel.dart';

class Onlodingdetelsscareen extends StatelessWidget {
  const Onlodingdetelsscareen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackSlashButton(
                    onTap: () {
                      Get.back();
                    },
                  ),

                  //=============Mark as inactive=================================
                  Markasinactive(
                    text: 'Mark as inactive',
                    ontap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          backgroundColor: Colors.white,
                          content: Extrabuttonpaddinginpormationmodel(
                            ontap1: () {
                             Get.toNamed(AppRoute.home2);

                            },
                            ontap2: () {
                              Get.back();

                            },
                            buttonname1: 'Mark as complete',
                            buttonname2: 'Close',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              SimpleCard(
                controller: nameController,
                hintText: 'Search by name',
                prefixicon: true,
              ),

              SizedBox(height: 24.h),

              const Tuitiondetails(
                title: 'Tuition details',
                title2: 'Mathematics',
                title3: '\$560.00',
                title4: 'Group class',
                title1: 'Class 1-4',
              ),
              SizedBox(height: 32.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Booking by',
                    style: TextStyle(
                      color: Appgradient.TextColor,
                      fontSize: 20,
                      fontWeight: .w600,
                    ),
                  ),

                  Text(
                    '40',
                    style: TextStyle(
                      color: Appgradient.TextColor,
                      fontSize: 20,
                      fontWeight: .w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              Text(
                'Go to the Bookings section to accept new student requests.',
                style: TextStyle(
                  color: Color(0xff888888),
                  fontSize: 12,
                  fontWeight: .w400,
                ),
              ),
              SizedBox(height: 24.h),

              CustomCardnew(
                title: 'Parent name',
                subtitle: 'Class 1',
                iconName: 'Student name',
                fullscrenonTap: () {},
                imagePath: 'assets/backround/Rectangle 5050 (6).png',
              ),
              SizedBox(height: 16.h),
              CustomCardnew(
                title: 'Smith Family',
                subtitle: 'Class 2',
                iconName: 'Emily Smith',
                fullscrenonTap: () {},
                imagePath: 'assets/backround/Rectangle 5050 (1).png',
              ),

              // CustomCardnew(
              //   title: 'JWilliams Family',
              //   subtitle: 'Class 1',
              //   iconName: 'Michael Johnson',
              //   fullscrenonTap: () {},
              //   imagePath: 'assets/backround/Rectangle 5050 (2).png',
              // ),
              SizedBox(height: 16.h),
              CustomCardnew(
                title: 'Williams Family',
                subtitle: 'Class 3',
                iconName: 'Sarah Williams',
                fullscrenonTap: () {},
                imagePath: 'assets/backround/Rectangle 5050 (3).png',
              ),
              SizedBox(height: 16.h),

              CustomCardnew(
                title: 'James Brown',
                subtitle: 'Class 4',
                iconName: 'Sarah Williams',
                fullscrenonTap: () {},
                imagePath: 'assets/backround/Rectangle 5050 (3).png',
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
