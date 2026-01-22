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

class Bokking2 extends StatelessWidget {
  const Bokking2({super.key});

  @override
  Widget build(BuildContext context) {
    // ======================== Controller Injection ========================
    final Bookingtecherlistcontroller controller = Get.put(
      Bookingtecherlistcontroller(),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const NavButton2(selectIndex: 1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),

            Text(
              'Bookings',
              style: TextStyle(
                color: Appgradient.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 22.sp,
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              'You can manage your booking requests here',
              style: TextStyle(color: const Color(0xff888888), fontSize: 13.sp),
            ),

            SizedBox(height: 30.h),

            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                // ---------- গ্রুপ করা বুকিং ডাটা (Class ID অনুযায়ী) ----------
                final groupedMap = controller.groupedBookings;
                final classKeys = groupedMap.keys.where((classId) {
                  return groupedMap[classId]!.any((b) => b.status == "pending");
                }).toList();

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

                return RefreshIndicator(
                  onRefresh: () => controller.fetchMyBookings(),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: classKeys.length,
                    itemBuilder: (context, index) {
                      final int classId = classKeys[index];
                      // ✅ ওই নির্দিষ্ট ক্লাসের সব বুকিংয়ের লিস্ট (যেমন: ৫টি পেন্ডিং)
                      final List<BookingModel> bookingsInClass =
                          groupedMap[classId]!;

                      // প্রথম বুকিং থেকে ক্লাসের তথ্য (Subject, Level) নেওয়া হচ্ছে
                      final BookingModel firstBooking = bookingsInClass.first;
                      final properties = firstBooking.classDetails?.properties;

                      // ✅ শুধুমাত্র পেন্ডিং বুকিংয়ের সংখ্যা বের করা
                      final int pendingCount = bookingsInClass
                          .where((b) => b.status == "pending")
                          .length;

                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: CustomCardnew(
                          title: properties?.subject ?? 'Subject',
                          subtitle: 'Class ${properties?.level ?? 'N/A'}',
                          // ডানপাশে পেন্ডিং সংখ্যা দেখাবে
                          iconName: 'Pending - $pendingCount',
                          onTap: () {
                            // ✅ লজিক: পরের স্ক্রিনে (BokkingDetels2) এই ৫টি বুকিংয়ের লিস্ট পাঠানো হচ্ছে।
                            // এর ফলে পরের স্ক্রিনে ৫টি আলাদা কার্ড জেনারেট হবে।
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
