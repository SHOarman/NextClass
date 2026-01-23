import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//======================== Controller ========================
import '../../../../../Services/Controller_view/bokinglistcontroller.dart';

//======================== Routes ========================
import '../../../../../core/route/route.dart';

//======================== Custom Widget ========================
import '../../../../../teacher_presentScreen/techerall_widget/customcard/customcard.dart';

//======================== Completed Booking Screen ========================
class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller is already initialized in parent screen
    final BookingListController controller =
    Get.find<BookingListController>();

    return Scaffold(
      backgroundColor: Colors.white,

      //======================== Reactive UI ========================
      body: Obx(() {

        //======================== Loading State ========================
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xff2563EB),
            ),
          );
        }

        //======================== Empty State ========================
        if (controller.completedBookings.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => controller.fetchBookings(),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: 200.h),
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.assignment_turned_in_outlined,
                        size: 80.sp,
                        color: Colors.grey[200],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "No completed lessons found",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextButton(
                        onPressed: () => controller.fetchBookings(),
                        child: const Text("Refresh Now"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        //======================== Completed Booking List ========================
        return RefreshIndicator(
          color: const Color(0xff2563EB),
          onRefresh: () => controller.fetchBookings(),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.completedBookings.length,
            itemBuilder: (context, index) {
              final data =
              controller.completedBookings[index];

              //======================== Data Mapping ========================
              final String tutorName =
                  data.tutorDetails?.fullName ?? 'Unknown Tutor';

              final String subject =
                  data.classDetails?.properties?.subject ??
                      'Subject not specified';

              //======================== Profile Image Logic ========================
              final String profileImage =
              (data.tutorDetails?.profilePicture != null &&
                  data.tutorDetails!.profilePicture!.isNotEmpty)
                  ? data.tutorDetails!.profilePicture!
                  : 'assets/backround/boking1.png';

              //======================== Rating Logic ========================
              final double rating =
                  data.tutorDetails?.profile?.averageRating ?? 0.0;

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CustomCardnew(
                  title: tutorName,
                  subtitle: subject,
                  iconName: 'Completed',
                  imagePath: profileImage,
                  rating: rating,

                  // Navigate to full review screen
                  onTap: () {
                    Get.toNamed(
                      AppRoute.tusioncomplectfullreviewscreen,
                      arguments: data,
                    );
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
