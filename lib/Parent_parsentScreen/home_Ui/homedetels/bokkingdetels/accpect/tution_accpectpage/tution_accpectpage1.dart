import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../Services/Controller_view/bokkingdetels_controller.dart';
import '../../../../../../core/route/route.dart';
import '../../../../../../unity/app_colors/app_gradient.dart';
import '../../../../../widget/back_slash/back_slash.dart';
import '../../../../../widget/custom_button/custom_button.dart';

class TutionAccpectpage1 extends StatefulWidget {
  const TutionAccpectpage1({super.key});

  @override
  State<TutionAccpectpage1> createState() => _TutionAccpectpage1();
}

class _TutionAccpectpage1 extends State<TutionAccpectpage1> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // Get controller and fetch booking data
    final controller = Get.put(BookingDetailsController());
    final data = controller.bookingData;

    // Show loading if data not yet available
    // Data is guaranteed to be non-null by the time this widget builds
    // if (data == null) { return ... } check removed as it was dead code

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),

            /// ===== Top Bar: Back + Favorite Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackSlashButton(onTap: () => Get.back()),

                // Favorite toggle
                GestureDetector(
                  onTap: () => setState(() => isFavorite = !isFavorite),
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withValues(alpha: 0.1),
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : const Color(0xff2B2B2B),
                      size: 24.sp,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// ===== Tutor Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  data.tutorDetails?.profilePicture ?? "",
                  width: 200.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/backround/Frame 91.png',
                    width: 200.w,
                    height: 200.h,
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            /// ===== View Tutor Profile Button
            Center(
              child: OutlinedButton(
                onPressed: () {
                  if (data.tutorDetails != null) {
                    Get.toNamed(
                      AppRoute.viewtotureprofile,
                      arguments: data.tutorDetails,
                    );
                  }
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xff2563EB)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  "View Tutor Profile",
                  style: TextStyle(
                    color: const Color(0xff2563EB),
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            /// ===== Tutor Name
            Text(
              data.tutorDetails?.fullName ?? 'Unknown Tutor',
              style: TextStyle(
                color: const Color(0xff2B2B2B),
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20.h),

            /// ===== Booking & Student Details
            _buildDetailText(
              "Subject: ${data.classDetails?.properties?.subject ?? 'N/A'}",
            ),
            _buildDetailText(
              "Level: ${data.classDetails?.properties?.level ?? 'N/A'}",
            ),
            _buildDetailText("Student Name: ${data.studentName ?? 'N/A'}"),
            _buildDetailText(
              "Student Age: ${data.studentAge != null ? "${data.studentAge} Yrs" : 'N/A'}",
            ),
            _buildDetailText('Booking Date: ${data.bookingDate ?? 'N/A'}'),
            _buildDetailText(
              'Address: ${data.classDetails?.properties?.address ?? 'No Address'}',
            ),

            SizedBox(height: 24.h),

            /// ===== Price Section
            Text(
              '\$${data.totalPrice ?? '0.00'}/monthly',
              style: TextStyle(
                color: const Color(0xff2563EB),
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 40.h),

            /// ===== Start Date
            // Center(
            //   child: Text(
            //     'Starts on ${data.startTime ?? 'TBA'}',
            //     style: TextStyle(color: const Color(0xff1A73E8), fontSize: 13.sp),
            //   ),
            // ),
            SizedBox(height: 16.h),

            /// ===== Action Buttons
            CustomSuperButton(
              text: 'Cancel booking',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              onTap: () =>
                  Get.toNamed(AppRoute.cancelModel, arguments: data.id),
              bgGradient: const LinearGradient(
                colors: [Color(0xff2563EB), Color(0xff2563EB)],
              ),
            ),

            SizedBox(height: 16.h),

            CustomSuperButton(
              text: 'Chat with tutor',
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              onTap: () => Get.toNamed(
                AppRoute.chatConationTeacher,
                arguments: data.tutorDetails,
              ),
              borderColor: const Color(0xff2563EB),
              textGradient: Appgradient.primaryGradient,
            ),

            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  /// Helper method for consistent detail text styling
  Widget _buildDetailText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xff2B2B2B),
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
