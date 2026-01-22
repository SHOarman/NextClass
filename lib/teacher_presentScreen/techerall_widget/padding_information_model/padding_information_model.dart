import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Parent_parsentScreen/widget/custom_button/custom_button.dart';
import '../../../Services/model_class/bokkingmodelclass.dart';
import '../../../unity/app_colors/app_gradient.dart';

//======================= Student Info Dialog (Main) ==========================
class Paddinginpormationmodel extends StatelessWidget {
  final VoidCallback reject;
  final VoidCallback chat;
  final VoidCallback accept;
  final BookingModel booking;

  const Paddinginpormationmodel({
    super.key,
    required this.reject,
    required this.chat,
    required this.accept,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    String studentName = booking.studentName ?? "N/A";
    String studentAge = (booking.studentAge != null && booking.studentAge! > 0)
        ? "${booking.studentAge} years old"
        : "N/A";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      width: 440.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Student Information',
              style: TextStyle(
                color: Appgradient.textColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 35.h),
          _buildInfoTile('What is the student name?', studentName),
          SizedBox(height: 24.h),
          _buildInfoTile('What is the student age?', studentAge),
          SizedBox(height: 40.h),
          Row(
            children: [
              Expanded(
                child: CustomSuperButton(
                  text: 'Reject',
                  onTap: reject,
                  borderColor: Colors.red,
                  textColor: Colors.red,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: CustomSuperButton(
                  text: 'Accept Request',
                  onTap: accept,
                  bgGradient: const LinearGradient(
                    colors: [Color(0xff2563EB), Color(0xff2563EB)],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          CustomSuperButton(
            text: 'Chat with parent',
            onTap: chat,
            borderColor: Colors.blue,
            textGradient: const LinearGradient(
              colors: [Color(0xff2563EB), Color(0xff2563EB)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: const Color(0xff888888), fontSize: 14.sp)),
        SizedBox(height: 8.h),
        Text(value, style: TextStyle(color: Appgradient.textColor, fontSize: 16.sp, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

//======================= Extra Buttons Dialog ==========================
class Extrabuttonpaddinginpormationmodel extends StatelessWidget {
  final VoidCallback ontap1;
  final VoidCallback ontap2;
  final String buttonname1;
  final String buttonname2;
  final BookingModel bookingData;

  const Extrabuttonpaddinginpormationmodel({
    super.key,
    required this.ontap1,
    required this.ontap2,
    required this.buttonname1,
    required this.buttonname2,
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
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('Student Information', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Appgradient.textColor)),
          ),
          SizedBox(height: 35.h),
          _buildInfoTile('What is the student name?', studentName),
          SizedBox(height: 24.h),
          _buildInfoTile('What is the student age?', studentAge),
          SizedBox(height: 35.h),
          CustomSuperButton(
            text: buttonname1,
            onTap: ontap1,
            bgGradient: const LinearGradient(colors: [Color(0xff2563EB), Color(0xff2563EB)]),
          ),
          SizedBox(height: 12.h),
          CustomSuperButton(
            text: buttonname2,
            onTap: ontap2,
            borderColor: const Color(0xff2563EB),
            textGradient: const LinearGradient(colors: [Color(0xff2563EB), Color(0xff2563EB)]),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: const Color(0xff888888), fontSize: 14.sp)),
        SizedBox(height: 8.h),
        Text(value, style: TextStyle(color: Appgradient.textColor, fontSize: 16.sp, fontWeight: FontWeight.w600)),
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
  });

  @override
  Widget build(BuildContext context) {
    final String studentName = bookingData.studentName ?? "N/A";
    final String studentAge = (bookingData.studentAge != null && bookingData.studentAge! > 0)
        ? "${bookingData.studentAge} years old"
        : "N/A";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('Student Information', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Appgradient.textColor)),
          ),
          SizedBox(height: 35.h),
          _buildInfoTile('What is the student name?', studentName),
          SizedBox(height: 24.h),
          _buildInfoTile('What is the student age?', studentAge),
          SizedBox(height: 35.h),
          CustomSuperButton(
            text: buttonname1,
            onTap: ontap1,
            bgGradient: const LinearGradient(colors: [Color(0xff2563EB), Color(0xff2563EB)]),
          ),
          SizedBox(height: 12.h),
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

  Widget _buildInfoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: const Color(0xff888888), fontSize: 14.sp)),
        SizedBox(height: 8.h),
        Text(value, style: TextStyle(color: Appgradient.textColor, fontSize: 16.sp, fontWeight: FontWeight.w600)),
      ],
    );
  }
}