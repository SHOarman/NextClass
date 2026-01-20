import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//======================== Controller ========================
import '../../../../../Services/Controller_view/bokinglistcontroller.dart';

//======================== Routes ========================
import '../../../../../core/route/route.dart';

//======================== Custom Widget ========================
import '../../../../../teacher_presentScreen/techerall_widget/customcard/customcard.dart';

//======================== Accepted & Pending Booking Screen ========================
class Accpectd extends StatelessWidget {
  const Accpectd({super.key});

  @override
  Widget build(BuildContext context) {

    //======================== Get Controller ========================
    // Using Get.find because controller is already put in parent page
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
        if (controller.acceptedAndPendingBookings.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.event_available_outlined,
                  size: 70.sp,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 10.h),
                Text(
                  "No pending or accepted bookings",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }

        //======================== Booking List ========================
        return RefreshIndicator(
          color: const Color(0xff2563EB),

          // Pull to refresh bookings
          onRefresh: () => controller.fetchBookings(),

          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 20.h,
            ),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.acceptedAndPendingBookings.length,
            itemBuilder: (context, index) {

              // Current booking data
              final data =
              controller.acceptedAndPendingBookings[index];

              //======================== Status Logic ========================
              // pending  -> Pending
              // confirmed -> Accepted
              final String status =
              (data.status ?? "").toLowerCase().trim();

              String displayLabel =
              status == "pending" ? "Pending" : "Accepted";

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CustomCardnew(

                  //======================== Tutor Name ========================
                  title: data.tutorDetails?.fullName ??
                      'No Name Found',

                  //======================== Subject ========================
                  subtitle: data.classDetails?.properties?.subject ??
                      'Subject Not Specified',

                  //======================== Status Badge ========================
                  iconName: displayLabel,

                  //======================== Profile Image ========================
                  imagePath:
                  (data.tutorDetails?.profilePicture != null &&
                      data.tutorDetails!.profilePicture!
                          .isNotEmpty)
                      ? data.tutorDetails!.profilePicture!
                      : 'assets/backround/boking1.png',

                  //======================== Card Tap Action ========================
                  onTap: () {
                    // Navigate to booking details page
                    // Full booking object is passed as argument
                    Get.toNamed(
                      AppRoute.tutionAccpectPage1,
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
