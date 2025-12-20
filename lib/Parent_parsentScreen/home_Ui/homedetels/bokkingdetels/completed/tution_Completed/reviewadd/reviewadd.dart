import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../../../../core/succesfullcontroler/succesfullcontroler.dart';
import '../../../../../../../unity/appColors/appGradient.dart';
import '../../../../../../widget/coustom_Textfield/coustom_Textfield.dart';
import '../../../../../../widget/coustom_button/coustom_button.dart';

class Reviewadd extends StatefulWidget {
  const Reviewadd({super.key});

  @override
  State<Reviewadd> createState() => _ReviewaddState();
}

class _ReviewaddState extends State<Reviewadd> {
  TextEditingController reviewController = TextEditingController();

  bool isFavorite1 = false;
  bool isFavorite2 = false;
  bool isFavorite3 = false;
  bool isFavorite4 = false;
  bool isFavorite5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .start,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  'Rating & Review',
                  style: TextStyle(
                    color: Color(0xff2B2B2B),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 8.h),

              Center(
                child: Text(
                  'You can give rating & review about the tutor & class.',
                  style: TextStyle(color: Color(0xff888888), fontSize: 12),
                ),
              ),
              SizedBox(height: 40.h),

              Text(
                'Rating',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  SizedBox(width: 4.w),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite1 = !isFavorite1;
                      });
                    },
                    icon: Icon(
                      Icons.star,
                      color: isFavorite1
                          ? Color(0xffFFC107)
                          : Color(0xff888888),
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite2 = !isFavorite2;
                      });
                    },
                    icon: Icon(
                      Icons.star,
                      color: isFavorite2
                          ? Color(0xffFFC107)
                          : Color(0xff888888),
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite3 = !isFavorite3;
                      });
                    },
                    icon: Icon(
                      Icons.star,
                      color: isFavorite3
                          ? Color(0xffFFC107)
                          : Color(0xff888888),
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite4 = !isFavorite4;
                      });
                    },
                    icon: Icon(
                      Icons.star,
                      color: isFavorite4
                          ? Color(0xffFFC107)
                          : Color(0xff888888),
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite5 = !isFavorite5;
                      });
                    },
                    icon: Icon(
                      Icons.star,
                      color: isFavorite5
                          ? Color(0xffFFC107)
                          : Color(0xff888888),
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Text(
                'Review',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12.h),

              Customdetesl(
                controller: reviewController,
                hintText: 'Write here..',
              ),
              SizedBox(height: 40.h),

              CustomSuperButton(
                text: 'Submit',
                fontSize: 20,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      backgroundColor: Colors.white,

                      content: Reviewpopupmsg(
                        name: 'Thank you!',
                        namedetels:
                            'Your rating & review submitted successfully.',
                        bu_name1: 'Back to booking',
                        ontap1: () {

                          Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Success',
                              message: 'Your review has been added successfully',
                              duration: Duration(seconds: 2),
                              backgroundColor: Color(0xff2563EB),
                              snackPosition: SnackPosition.BOTTOM,
                              margin: EdgeInsets.all(16),
                              borderRadius: 8,
                              icon: Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              ),
                            ),
                          );

                          Future.delayed(const Duration(seconds: 2), () {
                           Get.toNamed(AppRoute.bokkingdetels);
                          });



                        },
                      ),
                    ),
                  );
                },
                bgGradient: Appgradient.primaryGradient,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
