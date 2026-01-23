import 'package:first_project/Services/Controller_view/rejectbokking2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../Services/Controller_view/cancel_booking_controller.dart';
import '../../../../../../core/route/route.dart';
import '../../../../../../unity/app_colors/app_gradient.dart';
import '../../../Parent_parsentScreen/widget/custom_button/custom_button.dart';
import '../../../Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';


class resonwiget extends StatefulWidget {
  const resonwiget({super.key});

  @override
  State<resonwiget> createState() => _resonwigetState();
}

class _resonwigetState extends State<resonwiget> {
  bool isYesselected = false;
  bool isNoselected = false;

  final Rejectbokking2 cancelBookingController = Get.put(
    Rejectbokking2(),
  );

  @override
  Widget build(BuildContext context) {
    // Navigation Argument Handling
    final dynamic args = Get.arguments;
    int? bookingId;

    if (args is int) {
      bookingId = args;
    } else if (args != null) {
      try {
        bookingId = args.id;
      } catch (e) {
        debugPrint("Error extracting ID: $e");
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Are you sure?',
                style: TextStyle(
                  color: const Color(0xff2B2B2B),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Once you cancel, you won’t be able to join this class.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff888888),
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 24.h),

              // Selection Toggle Buttons
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
                              color: isYesselected
                                  ? Colors.white
                                  : const Color(0xff2B2B2B),
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
                        Get.offAllNamed(AppRoute.homedetels);
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
                              color: isNoselected
                                  ? Colors.white
                                  : const Color(0xff2B2B2B),
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
              Customdetesl(
                controller: cancelBookingController.reasonController,
                hintText: 'Write here..',
              ),
              SizedBox(height: 40.h),

              // Submission Section
              Obx(
                    () => CustomSuperButton(
                  text: cancelBookingController.isLoading.value
                      ? 'Loading...'
                      : 'Submit',
                  bgGradient: Appgradient.primaryGradient,
                  onTap: () {
                    if (!isYesselected) {
                      Get.snackbar(
                        "Notice",
                        "Please select 'Yes' to confirm cancellation",
                      );
                      return;
                    }

                    if (bookingId != null) {
                      cancelBookingController.cancelBooking(bookingId, context);
                    } else {
                      Get.snackbar("Error", "Booking ID not found!");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
