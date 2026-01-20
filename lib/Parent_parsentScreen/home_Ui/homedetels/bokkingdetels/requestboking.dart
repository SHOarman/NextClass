//======================== Request Booking Screen ========================
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:first_project/Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/bokkingcontroller.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
import '../../../../unity/app_colors/app_gradient.dart';
import '../../../widget/custom_button/custom_button.dart';
import '../../../../Services/model_class/usershow_model.dart';

class Requestboking extends StatelessWidget {
  const Requestboking({super.key});

  @override
  Widget build(BuildContext context) {
    // কন্ট্রোলার ইনিশিয়ালাইজ
    final Bokkingcontroller bokkingcontroller = Get.put(Bokkingcontroller());

    // ১. আর্গুমেন্ট ডাটা রিসিভ (Null safety সহ)
    final dynamic data = Get.arguments;

    // ২. আইডি বের করার নিরাপদ পদ্ধতি (এরর ফিক্স করা হয়েছে)
    int? classListingId;
    if (data != null) {
      if (data is ClassFeature) {
        classListingId = data.id;
      } else if (data is int) {
        classListingId = data;
      }
    }

    // ৩. যদি আইডি না পাওয়া যায় তবে ইউজারকে মেসেজ দেখানো
    if (classListingId == null) {
      return const Scaffold(
        body: Center(child: Text("Error: Booking info missing!")),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
            () => Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
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

                    // স্টুডেন্ট নাম
                    Text('What is the student name?'),
                    SizedBox(height: 12.h),
                    SimpleCard(
                      controller: bokkingcontroller.namcontroler,
                      hintText: 'Write here..',
                    ),

                    SizedBox(height: 16.h),

                    // স্টুডেন্ট বয়স (সংখ্যা ইনপুট দিতে কিবোর্ড টাইপ যুক্ত করা উচিত)
                    Text('What is the student age?'),
                    SizedBox(height: 12.h),
                    SimpleCard(
                      controller: bokkingcontroller.agecontroler,
                      hintText: 'Write here..',
                    ),

                    SizedBox(height: 40.h),

                    // সাবমিট বাটন
                    CustomSuperButton(
                      text: bokkingcontroller.isLoading.value
                          ? 'Processing...'
                          : 'Submit',
                      onTap: () {
                        // কন্ট্রোলার কল (আইডি পাস করা হচ্ছে)
                        bokkingcontroller.createBooking(
                          classListingId!, // এখানে নিশ্চিত আইডি পাওয়া গেছে
                          context,
                        );
                      },
                      bgGradient: const LinearGradient(
                        colors: [Color(0xff2563EB), Color(0xff2563EB)],
                      ),
                    ),

                    SizedBox(height: 16.h),

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

            // লোডিং ইন্ডিকেটর
            if (bokkingcontroller.isLoading.value)
              Container(
                color: Colors.black26,
                child: const Center(
                  child: CircularProgressIndicator(color: Color(0xff2563EB)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}