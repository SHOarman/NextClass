import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:first_project/core/route/route.dart';

//======================== Controllers ========================
import '../../../../../../../Services/Controller_view/review_controller.dart';
import '../../../../../../../Services/Controller_view/my_review_controller.dart';
import '../../../../../../../Services/Controller_view/bokinglistcontroller.dart';

//======================== Widgets ========================
import '../../../../../../../core/succesfullcontroler/succesfullcontroler.dart';
import '../../../../../../widget/custom_button/custom_button.dart';
import '../../../../../../widget/custom_textfield/custom_textfield.dart';

class Reviewadd extends StatefulWidget {
  const Reviewadd({super.key});

  @override
  State<Reviewadd> createState() => _ReviewaddState();
}

class _ReviewaddState extends State<Reviewadd> {
  final ReviewController _controller = Get.put(ReviewController());
  final TextEditingController reviewController = TextEditingController();

  // Receive booking ID from navigation arguments
  final int bookingId = Get.arguments;
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),

                //================ Header Section ================
                Center(
                  child: Text(
                    'Rating & Review',
                    style: TextStyle(
                      color: const Color(0xff2B2B2B),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: Text(
                    'You can give rating & review about the tutor & class.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xff888888),
                      fontSize: 13.sp,
                    ),
                  ),
                ),

                SizedBox(height: 40.h),

                //================ Star Rating Section ================
                Text(
                  'Rating',
                  style: TextStyle(
                    color: const Color(0xff2B2B2B),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      onPressed: () =>
                          setState(() => selectedRating = index + 1),
                      icon: Icon(
                        Icons.star,
                        color: index < selectedRating
                            ? const Color(0xffFFC107)
                            : const Color(0xffD1D5DB),
                        size: 36.sp,
                      ),
                    );
                  }),
                ),

                SizedBox(height: 32.h),

                //================ Review Input Field ================
                Text(
                  'Review',
                  style: TextStyle(
                    color: const Color(0xff2B2B2B),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Customdetesl(
                  controller: reviewController,
                  hintText: 'Write here..',
                ),

                SizedBox(height: 48.h),

                //================ Submit Button Logic ================
                Obx(
                      () => _controller.isLoading.value
                      ? const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff2563EB),
                    ),
                  )
                      : CustomSuperButton(
                    text: 'Submit',
                    textColor: Colors.white,
                    bgColor: const Color(0xff2563EB),
                    onTap: () async {
                      // Validate rating selection
                      if (selectedRating == 0) {
                        Get.snackbar(
                          "Required",
                          "Please select a rating star",
                          backgroundColor: Colors.redAccent,
                          colorText: Colors.white,
                        );
                        return;
                      }

                      // Call review API
                      bool success = await _controller.createReview(
                        bookingId: bookingId,
                        rating: selectedRating,
                        comment: reviewController.text,
                      );

                      if (success) {
                        // Refresh review list if controller exists
                        if (Get.isRegistered<MyReviewController>()) {
                          await Get.find<MyReviewController>()
                              .fetchMyReviews();
                        }

                        // Refresh booking list
                        final BookingListController bookingCtrl =
                        Get.find<BookingListController>();
                        await bookingCtrl.fetchBookings();

                        _showSuccessDialog();
                      }
                    },
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Show success dialog after successful review submission
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        content: Reviewpopupmsg(
          name: 'Thank you!',
          namedetels: 'Your rating & review submitted successfully.',
          buName1: 'Back to booking',
          ontap1: () {
            Get.toNamed(AppRoute.homedetels);
          },
        ),
      ),
    );
  }
}
