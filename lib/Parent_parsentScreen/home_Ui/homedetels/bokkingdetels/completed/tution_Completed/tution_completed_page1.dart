//==================== TUTION COMPLETED PAGE ==========================
// This screen shows completed tuition details including:
// - Tutor information
// - Booking related class details
// - User rating & review for this booking
//====================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';

import '../../../../../../Services/Controller_view/my_review_controller.dart';
import '../../../../../widget/back_slash/back_slash.dart';

class Tutioncomplectadepage1 extends StatefulWidget {
  const Tutioncomplectadepage1({super.key});

  @override
  State<Tutioncomplectadepage1> createState() => _Tutioncomplectadepage1();
}

class _Tutioncomplectadepage1 extends State<Tutioncomplectadepage1> {
  //==================== STATE VARIABLES ==============================
  // Used to toggle favorite (heart) icon state
  bool isFavorite = false;

  // Controller to manage and access user reviews
  final MyReviewController reviewController = Get.find<MyReviewController>();
  //===================================================================

  @override
  Widget build(BuildContext context) {
    //==================== RECEIVE ARGUMENTS ===========================
    // Receiving booking data passed from previous screen
    final dynamic data = Get.arguments;
    //===================================================================

    //==================== DATA MAPPING ================================
    // Safely mapping API / booking model data with fallback values
    final String tutorName = data?.tutorDetails?.fullName ?? 'Unknown Tutor';
    final String subject = data?.classDetails?.properties?.subject ?? 'Subject';
    final String address =
        data?.classDetails?.properties?.address ?? 'Location not specified';
    final String price = data?.totalPrice?.toString() ?? '0.00';
    final String bio =
        data?.tutorDetails?.profile?.bio ?? "No description available.";
    //===================================================================

    //==================== PROFILE IMAGE HANDLING ======================
    // If API image exists → use NetworkImage
    // Else → fallback to local asset image
    final String profileImage = (data?.tutorDetails?.profilePicture != null)
        ? data!.tutorDetails!.profilePicture!
        : 'assets/backround/Frame 91.png';
    //===================================================================

    //==================== FIND SPECIFIC REVIEW ========================
    // Finding review that matches current booking ID
    final specificReview = reviewController.reviews.firstWhereOrNull(
      (rev) => rev.booking == data?.id,
    );
    //===================================================================

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //==================== TOP BAR ===============================
            // Back button + Favorite icon
            SizedBox(height: 60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackSlashButton(onTap: () => Get.back()),
                IconButton(
                  onPressed: () => setState(() => isFavorite = !isFavorite),
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : const Color(0xff2B2B2B),
                  ),
                ),
              ],
            ),
            //============================================================

            //==================== TUTOR IMAGE ===========================
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: profileImage.startsWith('http')
                    ? Image.network(
                        profileImage,
                        width: 140.w,
                        height: 140.h,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        profileImage,
                        width: 140.w,
                        height: 140.h,
                        fit: BoxFit.cover,
                      ),
              ),
            ),

            //============================================================
            SizedBox(height: 24.h),

            //==================== NAME & RATING =========================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tutorName,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: const Color(0xffFFC107),
                      size: 20.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      specificReview?.rating?.toString() ?? '0.0',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ],
                ),
              ],
            ),

            //============================================================
            SizedBox(height: 16.h),

            //==================== TUTOR BIO =============================
            Text(
              bio,
              style: TextStyle(color: const Color(0xff888888), fontSize: 16.sp),
            ),

            //============================================================
            SizedBox(height: 16.h),

            //==================== CLASS DETAILS =========================
            _buildDetailText(subject),
            _buildDetailText(
              'Class ${data?.classDetails?.properties?.level ?? "N/A"}',
            ),
            _buildDetailText(address),

            //============================================================
            SizedBox(height: 24.h),

            //==================== PRICE ================================
            Text(
              '\$$price/monthly',
              style: TextStyle(
                color: const Color(0xff2563EB),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            //============================================================
            SizedBox(height: 30.h),

            //==================== RATING SECTION ========================
            const Text(
              'Rating',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18.sp),
                Text(' ${specificReview?.rating ?? "No Rating"}'),
              ],
            ),

            //============================================================
            SizedBox(height: 20.h),

            //==================== REVIEW SECTION ========================
            const Text(
              'Reviews',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              specificReview?.comment ?? "No review comment available yet.",
              style: const TextStyle(color: Color(0xff888888)),
            ),
            //============================================================
          ],
        ),
      ),
    );
  }

  //==================== REUSABLE DETAIL TEXT ==========================
  // Used for showing subject, class, address etc.
  Widget _buildDetailText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff2B2B2B),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  //===================================================================
}
