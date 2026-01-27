import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../unity/app_colors/app_gradient.dart';
import '../../../../widget/back_slash/back_slash.dart';
import '../../../../widget/custom_button/custom_button.dart';

//==================== TUITION REJECTION DETAILS PAGE ==================

//=====================================================================

class Tusionrejestiondetels extends StatefulWidget {
  const Tusionrejestiondetels({super.key});

  @override
  State<Tusionrejestiondetels> createState() => _Tusionrejestiondetels();
}

class _Tusionrejestiondetels extends State<Tusionrejestiondetels> {
  //==================== STATE VARIABLES ===============================
  // Controls favorite (heart) icon state
  bool isFavorite = false;
  //===================================================================

  @override
  Widget build(BuildContext context) {
    //==================== RECEIVE ARGUMENTS ===========================
    // Receiving booking model data from previous screen
    final dynamic data = Get.arguments;
    //==================================================================

    //==================== DATA MAPPING ================================
    // Safely extracting data from API response
    final String tutorName = data?.tutorDetails?.fullName ?? 'Unknown Tutor';
    final String subject = data?.classDetails?.properties?.subject ?? 'Subject';
    final String classLevel = data?.classDetails?.properties?.level ?? 'N/A';
    final String address =
        data?.classDetails?.properties?.address ?? 'Location not specified';
    final String price = data?.totalPrice?.toString() ?? '0.00';
    final String bio =
        data?.tutorDetails?.profile?.bio ?? "No description available.";
    final double rating = data?.tutorDetails?.profile?.averageRating ?? 0.0;
    //==================================================================

    //==================== PROFILE IMAGE LOGIC =========================
    // Use network image if available, otherwise fallback to asset
    final String profileImage =
        (data?.tutorDetails?.profilePicture != null &&
            data!.tutorDetails!.profilePicture!.isNotEmpty)
        ? data.tutorDetails!.profilePicture!
        : 'assets/backround/Frame 91.png';
    //==================================================================

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //==================== TOP BAR ===============================
            // Back button and favorite icon
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
            const SizedBox(height: 20),

            //==================== TUTOR IMAGE ===========================
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: profileImage.startsWith('http')
                    ? Image.network(
                        profileImage,
                        width: 200.w,
                        height: 200.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                              'assets/backround/boking1.png',
                              width: 200.w,
                              height: 200.h,
                            ),
                      )
                    : Image.asset(
                        profileImage,
                        width: 200.w,
                        height: 200.h,
                        fit: BoxFit.cover,
                      ),
              ),
            ),

            //============================================================
            SizedBox(height: 12.h),

            //==================== VIEW PROFILE BUTTON ===================
            Center(
              child: OutlinedButton(
                onPressed: () => Get.toNamed(
                  AppRoute.viewtotureprofile,
                  arguments: data?.tutorDetails,
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xffDBDBDB), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'View Tutor Profile',
                  style: TextStyle(color: Color(0xff2563EB)),
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
                    color: const Color(0xff2B2B2B),
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
                      rating.toString(),
                      style: TextStyle(
                        color: const Color(0xff2B2B2B),
                        fontSize: 18.sp,
                      ),
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
              style: TextStyle(color: const Color(0xff888888), fontSize: 16),
            ),

            //============================================================
            SizedBox(height: 16.h),

            //==================== CLASS DETAILS =========================
            _buildDetailText(subject),
            _buildDetailText('Class $classLevel'),
            _buildDetailText('Group class'),
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
            SizedBox(height: 62.h),

            //==================== CHAT BUTTON ===========================
            CustomSuperButton(
              bgGradient: Appgradient.primaryGradient,
              text: 'chat with tutor',
              onTap: () {
                // Navigate to chat screen with tutor data
                Get.toNamed(
                  AppRoute.chatConationTeacher,
                  arguments: data?.tutorDetails,
                );
              },
              textColor: Colors.white,
              borderColor: Appgradient.primaryGradient.colors[0],
            ),

            //============================================================
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  //==================== DETAIL TEXT BUILDER ===========================
  // Reusable widget for displaying class details
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
