import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//======================== Controller ========================
import '../../../../../Services/Controller_view/bokinglistcontroller.dart';

//======================== Routes ========================
import '../../../../../core/route/route.dart';

//======================== Custom Widget ========================
import '../../../../../teacher_presentScreen/techerall_widget/customcard/customcard.dart';

//======================== Rejected Booking Screen ========================
class Rejected extends StatelessWidget {
  const Rejected({super.key});

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
        if (controller.rejectedBookings.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => controller.fetchBookings(),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: 200.h),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cancel_presentation_outlined,
                        size: 80.sp,
                        color: Colors.grey[300],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "No rejected bookings found",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextButton(
                        onPressed: () => controller.fetchBookings(),
                        child: const Text("Try Refreshing"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        //======================== Rejected Booking List ========================
        return RefreshIndicator(
          color: const Color(0xff2563EB),
          onRefresh: () => controller.fetchBookings(),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.rejectedBookings.length,
            itemBuilder: (context, index) {
              final data =
              controller.rejectedBookings[index];

              //======================== Status Logic ========================
              final String status =
              (data.status ?? "").toLowerCase();

              //======================== Profile Image Logic ========================
              final String profileImage =
              (data.tutorDetails?.profilePicture != null &&
                  data.tutorDetails!.profilePicture!.isNotEmpty)
                  ? data.tutorDetails!.profilePicture!
                  : 'assets/backround/boking1.png';

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CustomCardnew(
                  // Tutor name
                  title:
                  data.tutorDetails?.fullName ?? 'Unknown Tutor',

                  // Subject name
                  subtitle: data.classDetails?.properties?.subject ??
                      'Subject not specified',

                  // Status badge
                  iconName: status,

                  // Profile image
                  imagePath: profileImage,

                  // Navigate to rejection details screen
                  onTap: () {
                    Get.toNamed(
                      AppRoute.rejectiondetels,
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
