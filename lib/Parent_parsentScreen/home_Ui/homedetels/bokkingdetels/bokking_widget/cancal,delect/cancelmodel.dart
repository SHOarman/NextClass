import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//======================== Imports ========================
import '../../../../../../Services/Controller_view/CancelBookingController.dart';
import '../../../../../../core/route/route.dart';
import '../../../../../../unity/app_colors/app_gradient.dart';
import '../../../../../widget/custom_button/custom_button.dart';
import '../../../../../widget/custom_textfield/custom_textfield.dart';
import '../../../../../../core/succesfullcontroler/succesfullcontroler.dart';

class CancelModel extends StatefulWidget {
  const CancelModel({super.key});

  @override
  State<CancelModel> createState() => _CancelModelState();
}

class _CancelModelState extends State<CancelModel> {
  bool isYesselected = false;
  bool isNoselected = false;

  // ১. কন্ট্রোলার ইনিশিয়ালাইজ (Get.find ব্যবহার করা নিরাপদ যদি আর্গুমেন্ট থেকে আইডি নিতে হয়)
  final CancelBookingController cancelBookingController = Get.put(CancelBookingController());

  @override
  Widget build(BuildContext context) {
    // ২. আর্গুমেন্ট থেকে বুকিং আইডি রিসিভ করা
    final int? bookingId = Get.arguments as int?;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),

              /// ===== Title
              Text(
                'Are you sure?',
                style: TextStyle(
                  color: const Color(0xff2B2B2B),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8.h),

              /// ===== Subtitle
              Text(
                'Once you cancel, you won’t be able to join this class.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff888888),
                  fontSize: 12.sp,
                ),
              ),

              SizedBox(height: 24.h),

              /// ===== Yes / No Buttons
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isYesselected = true;
                          isNoselected = false;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: isYesselected
                              ? const Color(0xff2563EB)
                              : const Color(0xffDBDBDB),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: isYesselected ? Colors.white : const Color(0xff2B2B2B),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isNoselected = true;
                          isYesselected = false;
                        });
                        Get.back(); // 'No' বললে সরাসরি ব্যাক করবে
                      },
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: isNoselected
                              ? const Color(0xff2563EB)
                              : const Color(0xffDBDBDB),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Center(
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: isNoselected ? Colors.white : const Color(0xff2B2B2B),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              /// ===== Reason Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What is your reason for cancelling?',
                  style: TextStyle(
                    color: Color(0xff2B2B2B),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              /// ===== Reason Input
              Customdetesl(
                controller: cancelBookingController.reasonController,
                hintText: 'Write here..',
              ),

              SizedBox(height: 40.h),

              /// ===== Submit Button (Controller এর সাথে যুক্ত)
              Obx(() => CustomSuperButton(
                text: cancelBookingController.isLoading.value ? 'Loading...' : 'Submit',
                bgGradient: Appgradient.primaryGradient,
                onTap: () {
                  // ৩. ভ্যালিডেশন চেক এবং এপিআই কল
                  if (!isYesselected) {
                    Get.snackbar("Notice", "Please select 'Yes' to confirm cancellation");
                    return;
                  }

                  if (bookingId != null) {
                    // কন্ট্রোলারের ক্যানসেল ফাংশন কল করা হচ্ছে
                    cancelBookingController.cancelBooking(bookingId, context);
                  } else {
                    Get.snackbar("Error", "Booking ID not found!");
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}