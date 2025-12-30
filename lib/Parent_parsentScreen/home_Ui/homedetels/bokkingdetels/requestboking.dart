import 'package:first_project/Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../core/succesfullcontroler/succesfullcontroler.dart';
import '../../../../unity/appColors/appGradient.dart';
import '../../../widget/coustom_button/coustom_button.dart';
import '../../../widget/successfullmsg/successfullmsg.dart';

class Requestboking extends StatelessWidget {
  const Requestboking({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namcontroler = TextEditingController();
    TextEditingController agecontroler = TextEditingController();
    TextEditingController classcontroler = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 30),
              Center(
                child: Text(
                  'Request for booking',
                  style: TextStyle(
                    color: Color(0xff2B2B2B),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  'We need some basic information from your side.',
                  style: TextStyle(color: Color(0xff888888), fontSize: 12),
                ),
              ),

              SizedBox(height: 40),
              Text(
                'What is the student name?',
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),

              SizedBox(height: 12.h),
              SimpleCard(controller: namcontroler, hintText: 'Write here..'),

              SizedBox(height: 16),
              Text(
                'What is the student age?',
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),
              SizedBox(height: 12),
              SimpleCard(controller: agecontroler, hintText: 'Write here..'),

              SizedBox(height: 16),
              Text(
                'Which class the student read in?',
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),
              SizedBox(height: 12),
              SimpleCard(controller: classcontroler, hintText: 'Write here..'),

              SizedBox(height: 40),

              CustomSuperButton(
                text: 'Submit',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                onTap: () {
                  /////=============showdialog=====================

                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      backgroundColor: Colors.white,

                      content: Successfullmsg(
                        name: 'Successful',
                        namedetels:
                            'Your request have been sent successfully at tutor. Please wait for tutor acceptance. ',
                        bu_name1: 'Track booking',
                        ontap1: () {
                          //====================Request====================done
                        },
                        bu_name2: 'Back to home',
                        // ontap2: () {
                        //   Get.back();
                        // },
                      ),
                    ),
                  );
                },

                /////=============showdialog=====================
                bgGradient: LinearGradient(
                  colors: [Color(0xff2563EB), Color(0xff2563EB)],
                ),
              ),

              SizedBox(height: 16.h),

              CustomSuperButton(
                text: 'Close',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                onTap: () {
                  Get.back();
                },
                borderColor: Color(0xff2563EB),
                textGradient: Appgradient.primaryGradient,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
