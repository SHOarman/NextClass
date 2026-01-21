import 'package:first_project/Parent_parsentScreen/widget/custom_button/custom_button.dart';
import 'package:first_project/unity/app_colors/app_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Services/model_class/bokkingmodelclass.dart';

class Paddinginpormationmodel extends StatelessWidget {
  final VoidCallback reject;
  final VoidCallback chat;
  final VoidCallback accept;

  const Paddinginpormationmodel({
    super.key,
    required this.reject,
    required this.chat,
    required this.accept,
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
                color: Appgradient.textColor,
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
              color: Appgradient.textColor,
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
              color: Appgradient.textColor,
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

                  text: 'reject',
                  onTap: () {
                    reject();
                  },
                  borderColor: Colors.red,
                  textColor: Colors.red,
                ),
              ),
              SizedBox(width: 8.w),
              CustomSuperButton(
                width: 150,
                height: 48,
                text: 'accept Request',
                onTap: () {
                  accept();
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
            text: 'chat with parent',
            onTap: () {
              chat();
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

  // ✅ লজিক আপডেট: সরাসরি আপডেট করা মডেল অবজেক্টটি রিসিভ করা হচ্ছে
  final BookingModel bookingData;

  const Extrabuttonpaddinginpormationmodel({
    super.key,
    required this.ontap1,
    required this.ontap2,
    required this.buttonname1,
    required this.buttonname2,
    required this.bookingData, // প্রতিটি কার্ডের আলাদা ডাটা এখানে আসবে
  });

  @override
  Widget build(BuildContext context) {
    // ✅ লজিক: মডেলের ভেতর থেকে ডাইনামিক স্টুডেন্ট নাম ও বয়স নেওয়া হচ্ছে
    // মডেলটি এখন parent_details থেকেও ডাটা খুঁজে আনতে সক্ষম।
    final String studentName = bookingData.studentName ?? "N/A";
    final String studentAge = (bookingData.studentAge != null && bookingData.studentAge! > 0)
        ? "${bookingData.studentAge} years old"
        : "N/A";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      // constraints ৩.১ পিক্সেল ওভারফ্লো এররটি ফিক্স করবে
      constraints: BoxConstraints(maxHeight: 520.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Center(
              child: Text(
                'Student Information',
                style: TextStyle(
                    color: Appgradient.textColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 35.h),

            // --- ডাইনামিক স্টুডেন্ট নাম ---
            _buildInfoTile('What is the student name?', studentName),

            SizedBox(height: 24.h),

            // --- ডাইনামিক স্টুডেন্ট বয়স ---
            _buildInfoTile('What is the student age?', studentAge),

            SizedBox(height: 35.h),

            // বাটন ১: Reject Request
            CustomSuperButton(
                text: buttonname1,
                onTap: ontap1,
                bgGradient: const LinearGradient(
                    colors: [Color(0xff2563EB), Color(0xff2563EB)]
                )
            ),
            SizedBox(height: 12.h),

            // বাটন ২: Chat with Parent
            CustomSuperButton(
                text: buttonname2,
                onTap: ontap2,
                borderColor: const Color(0xff2563EB),
                textGradient: const LinearGradient(
                    colors: [Color(0xff2563EB), Color(0xff2563EB)]
                )
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // UI ক্লিন রাখার জন্য হেল্পার উইজেট
  Widget _buildInfoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 14.sp)
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: TextStyle(
              color: Appgradient.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600
          ),
        ),
      ],
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
                color: Appgradient.textColor,
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
              color: Appgradient.textColor,
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
              color: Appgradient.textColor,
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


