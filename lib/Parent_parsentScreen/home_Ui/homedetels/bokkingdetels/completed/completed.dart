import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//======================== Controllers ========================
import '../../../../../Services/Controller_view/bokinglistcontroller.dart';
import '../../../../../Services/Controller_view/my_review_controller.dart';

//======================== Routes ========================
import '../../../../../core/route/route.dart';

//======================== Custom Widget ========================
import '../../../../../teacher_presentScreen/techerall_widget/customcard/customcard.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    // Find already-initialized controllers
    final BookingListController bookingController = Get.put(BookingListController());
    final MyReviewController reviewController = Get.put(MyReviewController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        // Global loading state
        if (bookingController.isLoading.value || reviewController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff2563EB)),
          );
        }

        // Empty state with pull-to-refresh
        if (bookingController.completedBookings.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await bookingController.fetchBookings();
              await reviewController.fetchMyReviews();
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: 200.h),
                Center(
                  child: Text(
                    'No completed lessons found',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        // Completed booking list
        return RefreshIndicator(
          color: const Color(0xff2563EB),
          onRefresh: () async {
            await bookingController.fetchBookings();
            await reviewController.fetchMyReviews();
          },
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: bookingController.completedBookings.length,
            itemBuilder: (context, index) {
              final data = bookingController.completedBookings[index];

              // Check if a review exists for this booking
              final reviewData = reviewController.reviews.firstWhereOrNull(
                    (rev) => rev.booking == data.id,
              );

              final String tutorName = data.tutorDetails?.fullName ?? 'Unknown Tutor';
              final String subject =
                  data.classDetails?.properties?.subject ?? 'Subject not specified';

              final String profileImage =
              (data.tutorDetails?.profilePicture?.isNotEmpty ?? false)
                  ? data.tutorDetails!.profilePicture!
                  : 'assets/backround/boking1.png';

              // Display rating only if a review exists
              final double displayRating = reviewData?.rating?.toDouble() ?? 0.0;

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CustomCardnew(
                  showRating: displayRating > 0,
                  title: tutorName,
                  subtitle: subject,
                  iconName: '',
                  imagePath: profileImage,
                  rating: displayRating,
                  fullscrenonTap: () {
                    if (displayRating > 0) {
                      // Navigate to completed details screen
                      Get.toNamed(
                        AppRoute.tutionComplectadePage1,
                        arguments: data,
                      );
                    } else {
                      // Navigate to add review screen
                      Get.toNamed(
                        AppRoute.tusioncomplectfullreviewscreen,
                        arguments: data,
                      );
                    }
                  },
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
