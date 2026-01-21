// ======================== Request Booking Screen ========================
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ======================== Imports ========================
import 'package:first_project/Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/bokkingcontroller.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
import '../../../../unity/app_colors/app_gradient.dart';
import '../../../widget/custom_button/custom_button.dart';
import '../../../../Services/model_class/usershow_model.dart';

// ======================== REQUEST BOOKING PAGE ========================
class Requestboking extends StatelessWidget {
  const Requestboking({super.key});

  @override
  Widget build(BuildContext context) {

    // ======================== CONTROLLER INITIALIZATION ========================
    // Initialize booking controller using GetX
    final Bokkingcontroller bokkingcontroller =
    Get.put(Bokkingcontroller());

    // ======================== RECEIVE ARGUMENT DATA ========================
    // Receive arguments safely from previous screen
    final dynamic data = Get.arguments;

    // ======================== CLASS LISTING ID HANDLING ========================
    // Extract classListingId safely (fixes possible runtime error)
    int? classListingId;
    if (data != null) {
      if (data is ClassFeature) {
        classListingId = data.id;
      } else if (data is int) {
        classListingId = data;
      }
    }

    // ======================== ERROR STATE ========================
    // Show error message if booking id is missing
    if (classListingId == null) {
      return const Scaffold(
        body: Center(
          child: Text("Error: Booking info missing!"),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,

      // ======================== REACTIVE UI ========================
      // Obx rebuilds UI when loading state changes
      body: Obx(
            () => Stack(
          children: [

            // ======================== MAIN CONTENT ========================
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),

                    // ======================== TITLE ========================
                    Center(
                      child: Text(
                        'Request for booking',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // ======================== STUDENT NAME INPUT ========================
                    Text('What is the student name?'),
                    SizedBox(height: 12.h),
                    SimpleCard(
                      controller: bokkingcontroller.namcontroler,
                      hintText: 'Write here..',
                    ),

                    SizedBox(height: 16.h),

                    // ======================== STUDENT AGE INPUT ========================
                    Text('What is the student age?'),
                    SizedBox(height: 12.h),
                    SimpleCard(
                      controller: bokkingcontroller.agecontroler,
                      hintText: 'Write here..',
                    ),

                    SizedBox(height: 40.h),

                    // ======================== SUBMIT BUTTON ========================
                    CustomSuperButton(
                      text: bokkingcontroller.isLoading.value
                          ? 'Processing...'
                          : 'Submit',
                      onTap: () {
                        // Call create booking API with class ID
                        bokkingcontroller.createBooking(
                          classListingId!, // ID is guaranteed here
                          context,
                        );
                      },
                      bgGradient: const LinearGradient(
                        colors: [
                          Color(0xff2563EB),
                          Color(0xff2563EB),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // ======================== CLOSE BUTTON ========================
                    CustomSuperButton(
                      text: 'Close',
                      onTap: () => Get.back(),
                      borderColor: const Color(0xff2563EB),
                      textGradient: Appgradient.primaryGradient,
                    ),
                  ],
                ),
              ),
            ),

            // ======================== LOADING OVERLAY ========================
            // Show loading indicator while API call is running
            if (bokkingcontroller.isLoading.value)
              Container(
                color: Colors.black26,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff2563EB),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
