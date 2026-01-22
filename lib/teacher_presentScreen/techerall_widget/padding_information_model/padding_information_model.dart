<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Parent_parsentScreen/widget/custom_button/custom_button.dart';
import '../../../Services/model_class/bokkingmodelclass.dart';
import '../../../unity/app_colors/app_gradient.dart';

//======================= Student Info Dialog ==========================
=======
import 'package:first_project/Parent_parsentScreen/widget/custom_button/custom_button.dart';
import 'package:first_project/unity/app_colors/app_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Services/model_class/bokkingmodelclass.dart';

>>>>>>> origin/main
class Paddinginpormationmodel extends StatelessWidget {
  final VoidCallback reject;
  final VoidCallback chat;
  final VoidCallback accept;
<<<<<<< HEAD
  final BookingModel booking; // Booking object to display student info
=======
>>>>>>> origin/main

  const Paddinginpormationmodel({
    super.key,
    required this.reject,
    required this.chat,
    required this.accept,
<<<<<<< HEAD
    required this.booking,
=======
>>>>>>> origin/main
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    //======================= Extract Student Data ==========================
    String studentName = booking.studentName ?? "N/A";
    String studentAge = (booking.studentAge != null && booking.studentAge! > 0)
        ? "${booking.studentAge} years old"
        : "N/A";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 480.h,
      width: 440.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
=======
    return Container(
      height: 420.h,

      width: 440.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
>>>>>>> origin/main
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
<<<<<<< HEAD
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
=======
                fontSize: 20,
                fontWeight: .w700,
>>>>>>> origin/main
              ),
            ),
          ),
          SizedBox(height: 40.h),
<<<<<<< HEAD

          //======================= Student Name ==========================
          Text('What is the student name?',
              style: TextStyle(color: Color(0xff888888), fontSize: 14.sp)),
          SizedBox(height: 12.h),
          Text(studentName,
              style: TextStyle(
                  color: Appgradient.textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 24.h),

          //======================= Student Age ==========================
          Text('What is the student age?',
              style: TextStyle(color: Color(0xff888888), fontSize: 14.sp)),
          SizedBox(height: 12.h),
          Text(studentAge,
              style: TextStyle(
                  color: Appgradient.textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 40.h),

          //======================= Action Buttons ==========================
=======
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

>>>>>>> origin/main
          Row(
            children: [
              Expanded(
                child: CustomSuperButton(
<<<<<<< HEAD
                  text: 'Reject',
                  onTap: reject,
=======
                  width: 144,
                  height: 48,

                  text: 'reject',
                  onTap: () {
                    reject();
                  },
>>>>>>> origin/main
                  borderColor: Colors.red,
                  textColor: Colors.red,
                ),
              ),
              SizedBox(width: 8.w),
<<<<<<< HEAD
              Expanded(
                child: CustomSuperButton(
                  text: 'Accept Request',
                  onTap: accept,
                  bgGradient: LinearGradient(
                    colors: [Color(0xff2563EB), Color(0xff2563EB)],
                  ),
                  fontSize: 14.sp,
                ),
=======
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
>>>>>>> origin/main
              ),
            ],
          ),
          SizedBox(height: 14.h),
<<<<<<< HEAD

          //======================= Chat Button ==========================
          CustomSuperButton(
            text: 'Chat with parent',
            onTap: chat,
=======
          CustomSuperButton(
            text: 'chat with parent',
            onTap: () {
              chat();
            },
>>>>>>> origin/main
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

<<<<<<< HEAD
//======================= Extra Buttons Dialog ==========================
=======
//==============================other button==============================================















>>>>>>> origin/main
class Extrabuttonpaddinginpormationmodel extends StatelessWidget {
  final VoidCallback ontap1;
  final VoidCallback ontap2;
  final String buttonname1;
  final String buttonname2;
<<<<<<< HEAD
=======

  // ✅ লজিক আপডেট: সরাসরি আপডেট করা মডেল অবজেক্টটি রিসিভ করা হচ্ছে
>>>>>>> origin/main
  final BookingModel bookingData;

  const Extrabuttonpaddinginpormationmodel({
    super.key,
    required this.ontap1,
    required this.ontap2,
    required this.buttonname1,
    required this.buttonname2,
<<<<<<< HEAD
    required this.bookingData,
  });

  @override
  Widget build(BuildContext context) {
    final String studentName = bookingData.studentName ?? "N/A";
    final String studentAge = (bookingData.studentAge != null && bookingData.studentAge! > 0)
        ? "${bookingData.studentAge} years old"
        : "N/A";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      constraints: BoxConstraints(maxHeight: 520.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Student Information',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 35.h),
            _buildInfoTile('What is the student name?', studentName),
            SizedBox(height: 24.h),
            _buildInfoTile('What is the student age?', studentAge),
            SizedBox(height: 35.h),

            //======================= Action Buttons ==========================
            CustomSuperButton(
                text: buttonname1,
                onTap: ontap1,
                bgGradient: const LinearGradient(colors: [Color(0xff2563EB), Color(0xff2563EB)])),
            SizedBox(height: 12.h),
            CustomSuperButton(
                text: buttonname2,
                onTap: ontap2,
                borderColor: const Color(0xff2563EB),
                textGradient: const LinearGradient(colors: [Color(0xff2563EB), Color(0xff2563EB)])),
          ],
        ),
      ),
    );
  }

  //======================= Info Tile Helper ==========================
  Widget _buildInfoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
        SizedBox(height: 8.h),
        Text(value, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

//======================= Rejection Dialog ==========================
class Rejecationpaddinginpormationmodel extends StatelessWidget {
  final VoidCallback ontap1;
  final VoidCallback ontap2;
  final String buttonname1;
  final String buttonname2;
  final BookingModel bookingData;

  const Rejecationpaddinginpormationmodel({
    super.key,
    required this.ontap1,
    required this.ontap2,
    required this.buttonname1,
    required this.buttonname2,
    required this.bookingData,
=======
    required this.bookingData, // প্রতিটি কার্ডের আলাদা ডাটা এখানে আসবে
>>>>>>> origin/main
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    // ✅ লজিক: মডেলের ভেতর থেকে ডাইনামিক স্টুডেন্ট নাম ও বয়স নেওয়া হচ্ছে
    // মডেলটি এখন parent_details থেকেও ডাটা খুঁজে আনতে সক্ষম।
>>>>>>> origin/main
    final String studentName = bookingData.studentName ?? "N/A";
    final String studentAge = (bookingData.studentAge != null && bookingData.studentAge! > 0)
        ? "${bookingData.studentAge} years old"
        : "N/A";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
<<<<<<< HEAD
=======
      // constraints ৩.১ পিক্সেল ওভারফ্লো এররটি ফিক্স করবে
>>>>>>> origin/main
      constraints: BoxConstraints(maxHeight: 520.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
<<<<<<< HEAD
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SingleChildScrollView(
        child: Column(
=======
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
>>>>>>> origin/main
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Center(
<<<<<<< HEAD
              child: Text('Student Information',
                  style: TextStyle(
                      color: Appgradient.textColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 35.h),

            //======================= Student Name ==========================
            _buildInfoTile('What is the student name?', studentName),
            SizedBox(height: 24.h),

            //======================= Student Age ==========================
            _buildInfoTile('What is the student age?', studentAge),
            SizedBox(height: 35.h),

            //======================= Action Buttons ==========================
            CustomSuperButton(
                text: buttonname1,
                onTap: ontap1,
                bgGradient: const LinearGradient(colors: [Color(0xff2563EB), Color(0xff2563EB)])),
            SizedBox(height: 12.h),
            CustomSuperButton(
              text: buttonname2,
              onTap: ontap2,
              borderColor: Colors.red,
              textColor: Colors.red,
=======
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
>>>>>>> origin/main
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

<<<<<<< HEAD
=======
  // UI ক্লিন রাখার জন্য হেল্পার উইজেট
>>>>>>> origin/main
  Widget _buildInfoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
<<<<<<< HEAD
        Text(label, style: TextStyle(color: const Color(0xff888888), fontSize: 14.sp)),
        SizedBox(height: 8.h),
        Text(value,
            style: TextStyle(
                color: Appgradient.textColor, fontSize: 16.sp, fontWeight: FontWeight.w600)),
=======
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
>>>>>>> origin/main
      ],
    );
  }
}
<<<<<<< HEAD
=======
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


>>>>>>> origin/main
