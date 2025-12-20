import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:first_project/unity/appColors/appGradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Paddinginpormationmodel extends StatelessWidget {
  final VoidCallback Reject;
  final VoidCallback Chat;
  final VoidCallback Accept;

  const Paddinginpormationmodel({
    super.key,
    required this.Reject,
    required this.Chat,
    required this.Accept,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.h,

      width: 440.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Center(
            child: Text(
              'Student Information',
              style: TextStyle(
                color: Appgradient.TextColor,
                fontSize: 20,
                fontWeight: .w700,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Text(
            'What is the student name?',
            style: TextStyle(
              color: Color(0xff888888),
              fontSize: 14,
              fontWeight: .w400,
            ),
          ),
          SizedBox(height: 12.h),

          Text(
            'Student 1',
            style: TextStyle(
              color: Appgradient.TextColor,
              fontSize: 16,
              fontWeight: .w500,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'What is the student age?',
            style: TextStyle(
              color: Color(0xff888888),
              fontSize: 14,
              fontWeight: .w400,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'S16 years old',
            style: TextStyle(
              color: Appgradient.TextColor,
              fontSize: 16,
              fontWeight: .w500,
            ),
          ),
          SizedBox(height: 40.h),

          Row(
            children: [
              Expanded(
                child: CustomSuperButton(
                  width: 144,
                  height: 48,

                  text: 'Reject',
                  onTap: () {
                    Reject();
                  },
                  borderColor: Colors.red,
                  textColor: Colors.red,
                ),
              ),
              SizedBox(width: 8.w),
              CustomSuperButton(
                width: 150,
                height: 48,
                text: 'Accept Request',
                onTap: () {
                  Accept();
                },
                bgGradient: LinearGradient(
                  colors: [Color(0xff2563EB), Color(0xff2563EB)],
                ),
                fontSize: 15,
              ),
            ],
          ),
          SizedBox(height: 14.h),
          CustomSuperButton(
            text: 'Chat with parent',
            onTap: () {
              Chat();
            },
            borderColor: Colors.blue,
            textGradient: LinearGradient(
              colors: [Color(0xff2563EB), Color(0xff2563EB)],
            ),
          ),
        ],
      ),
    );
  }
}

//==============================other button==============================================

class Extrabuttonpaddinginpormationmodel extends StatelessWidget {
  final VoidCallback ontap1;
  final VoidCallback ontap2;
  final String buttonname1;
  final String buttonname2;



  const Extrabuttonpaddinginpormationmodel(
       {
        super.key,
        required this.ontap1,
        required this.ontap2,
        required this.buttonname1,
        required this.buttonname2,

      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Center(
            child: Text(
              'Student Information',
              style: TextStyle(
                color: Appgradient.TextColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Text(
            'What is the student name?',
            style: TextStyle(
              color: Color(0xff888888),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),

          Text(
            'Student 1',
            style: TextStyle(
              color: Appgradient.TextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'What is the student age?',
            style: TextStyle(
              color: Color(0xff888888),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            '16 years old',
            style: TextStyle(
              color: Appgradient.TextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 30.h),

          // Always show the first button
          Column(
            children: [
              SizedBox(width: 16.w),
              CustomSuperButton(
                text: buttonname1,
                onTap: ontap1,
                bgGradient: LinearGradient(
                  colors: [Color(0xff2563EB), Color(0xff2563EB)],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // Always show the second button
          CustomSuperButton(
            text: buttonname2,
            onTap: ontap2,
            borderColor: Colors.blue,
            textGradient: LinearGradient(
              colors: [Color(0xff2563EB), Color(0xff2563EB)],
            ),
          ),



        ],
      ),
    );
  }
}


//=================Rejecation================================

class Rejecationpaddinginpormationmodel extends StatelessWidget {
  final VoidCallback ontap1;
  final VoidCallback ontap2;
  final String buttonname1;
  final String buttonname2;



  const Rejecationpaddinginpormationmodel(
      {
        super.key,
        required this.ontap1,
        required this.ontap2,
        required this.buttonname1,
        required this.buttonname2,

      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Center(
            child: Text(
              'Student Information',
              style: TextStyle(
                color: Appgradient.TextColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Text(
            'What is the student name?',
            style: TextStyle(
              color: Color(0xff888888),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),

          Text(
            'Student 1',
            style: TextStyle(
              color: Appgradient.TextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'What is the student age?',
            style: TextStyle(
              color: Color(0xff888888),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            '16 years old',
            style: TextStyle(
              color: Appgradient.TextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 40.h),

          // Always show the first button
          Column(
            children: [
              SizedBox(width: 16.w),
              CustomSuperButton(
                text: buttonname1,
                onTap: ontap1,
                bgGradient: LinearGradient(
                  colors: [Color(0xff2563EB), Color(0xff2563EB)],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),

          // Always show the second button
          CustomSuperButton(
            text: buttonname2,
            onTap: ontap2,
            borderColor: Colors.red,
            textColor: Colors.red,
          ),



        ],
      ),
    );
  }
}


