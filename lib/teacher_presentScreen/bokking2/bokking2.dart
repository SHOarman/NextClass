import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ======================== Imports ========================
import 'package:first_project/core/route/route.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/customcard/customcard.dart';
import 'package:first_project/unity/app_colors/app_gradient.dart';

import '../../Services/Controller_view/booking_teacher_list_controller.dart';
import '../../Services/model_class/bokkingmodelclass.dart';
import '../techerall_widget/nav_button/nav_button.dart';

//========================= Main Booking Screen =========================
class Bokking2 extends StatelessWidget {
  const Bokking2({super.key});

  @override
  Widget build(BuildContext context) {
    // ======================== Controller Injection ========================
    final Bookingtecherlistcontroller controller = Get.put(Bookingtecherlistcontroller());

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const NavButton2(selectIndex: 1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),

            //========================= Page Title =========================
            Text(
              'Bookings',
              style: TextStyle(
                color: Appgradient.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 22.sp,
              ),
            ),

            SizedBox(height: 8.h),

            //========================= Page Subtitle =========================
            Text(
              'You can manage your booking requests here',
              style: TextStyle(color: const Color(0xff888888), fontSize: 13.sp),
            ),

            SizedBox(height: 30.h),

            //========================= Booking List =========================
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                //---------- Group bookings by Class ID ----------
                final groupedMap = controller.groupedBookings;

                // Filter only classes that have pending bookings
                final classKeys = groupedMap.keys.where((classId) {
                  return groupedMap[classId]!.any((b) => b.status == "pending");
                }).toList();

                //========================= No Bookings Found =========================
                if (classKeys.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: () => controller.fetchMyBookings(),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Container(
                        height: 400.h,
                        alignment: Alignment.center,
                        child: const Text("No bookings found"),
                      ),
                    ),
                  );
                }

                //========================= List of Classes with Bookings =========================
                return RefreshIndicator(
                  onRefresh: () => controller.fetchMyBookings(),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: classKeys.length,
                    itemBuilder: (context, index) {
                      final int classId = classKeys[index];

                      // List of bookings in this class
                      final List<BookingModel> bookingsInClass = groupedMap[classId]!;

                      // Take the first booking to display class info (subject, level)
                      final BookingModel firstBooking = bookingsInClass.first;
                      final properties = firstBooking.classDetails?.properties;

                      // Count pending bookings
                      final int pendingCount =
                          bookingsInClass.where((b) => b.status == "pending").length;

                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: CustomCardnew(
                          title: properties?.subject ?? 'Subject',
                          subtitle: 'Class ${properties?.level ?? 'N/A'}',
                          // Show pending count on the card
                          iconName: 'Pending - $pendingCount',
                          onTap: () {
                            // Navigate to details screen with the list of bookings for this class
                            Get.toNamed(
                              AppRoute.bokkingdetels2,
                              arguments: bookingsInClass,
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
