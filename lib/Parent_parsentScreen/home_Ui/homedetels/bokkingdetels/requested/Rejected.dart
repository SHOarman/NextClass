import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Services/Controller_view/bokinglistcontroller.dart';
import '../../../../../core/route/route.dart';
import '../../../../../teacher_presentScreen/techerall_widget/customcard/customcard.dart';

class Rejected extends StatelessWidget {
  const Rejected({super.key});

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

        // ৩. রিজেক্টেড লিস্ট খালি থাকলে এম্পটি স্টেট দেখানো
        if (controller.rejectedBookings.isEmpty) {
          return Center(
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
                )
              ],
            ),
          );
        }

        // ৪. ডাইনামিক লিস্ট (RefreshIndicator সহ)
        return RefreshIndicator(
          color: const Color(0xff2563EB),
          onRefresh: () async => await controller.fetchBookings(),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.rejectedBookings.length,
            itemBuilder: (context, index) {
              final data = controller.rejectedBookings[index];
              final String status = (data.status ?? "").toLowerCase().trim();

              // ৫. প্রোফাইল ইমেজ লজিক (নতুন মডেল অনুযায়ী)
              final String profileImg = (data.tutorDetails?.profilePicture != null &&
                  data.tutorDetails!.profilePicture!.isNotEmpty)
                  ? data.tutorDetails!.profilePicture!
                  : 'assets/backround/boking1.png';

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CustomCardnew(
                  // টিউটর নাম: tutorDetails থেকে নেওয়া
                  title: data.tutorDetails?.fullName ?? 'Unknown Tutor',

                  // বিষয়ের নাম: classDetails -> properties থেকে নেওয়া
                  subtitle: data.classDetails?.properties?.subject ?? 'Subject not specified',

                  // স্ট্যাটাস অনুযায়ী ব্যাজ টেক্সট
                  iconName: status == "rejected" ? 'Rejected' : 'Cancelled',

                  // ইমেজ পাথ
                  imagePath: profileImg,

                  // কার্ডে ক্লিক করলে ডিটেইলস পেজে ডাটা পাঠানো
                  onTap: () {
                    Get.toNamed(
                      AppRoute.rejectiondetels,
                      arguments: data, // পুরো 'BookingModel' অবজেক্ট পাঠানো হলো
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