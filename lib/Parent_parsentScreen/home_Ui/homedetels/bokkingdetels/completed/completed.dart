import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Services/Controller_view/bokinglistcontroller.dart';
import '../../../../../core/route/route.dart';
import '../../../../../teacher_presentScreen/techerall_widget/customcard/customcard.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    // ১. কন্ট্রোলার খুঁজে নেওয়া
    final BookingListController controller = Get.find<BookingListController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        // ২. ডাটা লোড হওয়ার সময় লোডার দেখানো
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff2563EB)),
          );
        }

        // ৩. যদি কমপ্লিটেড লিস্ট খালি থাকে
        if (controller.completedBookings.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.assignment_turned_in_outlined, size: 80.sp, color: Colors.grey[200]),
                SizedBox(height: 16.h),
                Text(
                  "No completed lessons found",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 8.h),
                TextButton(
                  onPressed: () => controller.fetchBookings(),
                  child: const Text("Refresh Now"),
                )
              ],
            ),
          );
        }

        // ৪. ডাইনামিক লিস্ট বিল্ডার
        return RefreshIndicator(
          color: const Color(0xff2563EB),
          onRefresh: () async => await controller.fetchBookings(),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.completedBookings.length,
            itemBuilder: (context, index) {
              final data = controller.completedBookings[index];

              // ৫. নেটওয়ার্ক ইমেজ হ্যান্ডলিং (Null-safe)
              final String profileImg = (data.tutorDetails?.profilePicture != null &&
                  data.tutorDetails!.profilePicture!.isNotEmpty)
                  ? data.tutorDetails!.profilePicture!
                  : 'assets/backround/boking1.png';

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CustomCardnew(
                  // টিউটর নাম: tutorDetails থেকে নেওয়া
                  title: data.tutorDetails?.fullName ?? 'Unknown Tutor',

                  // সাবজেক্ট: classDetails -> properties থেকে নেওয়া
                  subtitle: data.classDetails?.properties?.subject ?? 'Subject not specified',

                  iconName: 'Completed',
                  imagePath: profileImg,

                  // রেটিং যদি প্রোফাইলে থাকে তবে সেটি দেখানো (ডিফল্ট ৪.৫ রাখা হয়েছে)
                  rating: data.tutorDetails?.profile?.averageRating ?? 4.5,

                  onTap: () {
                    // রিভিউ স্ক্রিনে যাওয়ার সময় পুরো 'data' অবজেক্ট পাঠানো হচ্ছে
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