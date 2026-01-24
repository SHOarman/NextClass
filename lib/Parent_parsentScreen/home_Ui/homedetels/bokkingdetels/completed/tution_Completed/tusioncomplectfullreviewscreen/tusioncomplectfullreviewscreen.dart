import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../core/route/route.dart';

class Tusioncomplectfullreviewscreen extends StatefulWidget {
  const Tusioncomplectfullreviewscreen({super.key});

  @override
  State<Tusioncomplectfullreviewscreen> createState() =>
      _Tusioncomplectfullreviewscreen();
}

class _Tusioncomplectfullreviewscreen
    extends State<Tusioncomplectfullreviewscreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // Receive BookingModel from previous screen
    final dynamic data = Get.arguments;

    // Map data safely from BookingModel
    final String tutorName = data?.tutorDetails?.fullName ?? 'Unknown Tutor';
    final String subject =
        data?.classDetails?.properties?.subject ?? 'Subject not specified';
    final String classLevel =
        data?.classDetails?.properties?.level ?? 'N/A';
    final String address =
        data?.classDetails?.properties?.address ?? 'Location not specified';

    final String price =
        data?.totalPrice ??
            data?.classDetails?.properties?.pricePerHour ??
            '0.00';

    final String bio =
        data?.tutorDetails?.profile?.bio ?? 'No description available.';

    final String profileImage =
    (data?.tutorDetails?.profilePicture != null &&
        data.tutorDetails.profilePicture.isNotEmpty)
        ? data.tutorDetails.profilePicture
        : 'assets/backround/boking1.png';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row: Back button & Favorite icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff2563EB),
                            size: 18,
                          ),
                          label: Text(
                            'Back',
                            style: TextStyle(
                              color: const Color(0xff2563EB),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              setState(() => isFavorite = !isFavorite),
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                  Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite
                                  ? Colors.red
                                  : const Color(0xff2563EB),
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    // Tutor Image
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: profileImage.startsWith('http')
                            ? Image.network(
                          profileImage,
                          width: 140.w,
                          height: 140.h,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Image.asset(
                            'assets/backround/boking1.png',
                            width: 140.w,
                            height: 140.h,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Image.asset(
                          profileImage,
                          width: 140.w,
                          height: 140.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // View Tutor Profile Button
                    Center(
                      child: SizedBox(
                        height: 36.h,
                        width: 160.w,
                        child: OutlinedButton(
                          onPressed: () {
                            if (data?.tutorDetails != null) {
                              Get.toNamed(
                                AppRoute.viewtotureprofile,
                                arguments: data.tutorDetails,
                              );
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xff2563EB),
                              width: 1.2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'View Tutor Profile',
                            style: TextStyle(
                              color: const Color(0xff2563EB),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Tutor Name
                    Text(
                      tutorName,
                      style: TextStyle(
                        color: const Color(0xff2B2B2B),
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // Tutor Bio
                    Text(
                      bio,
                      style: TextStyle(
                        color: const Color(0xff888888),
                        fontSize: 15.sp,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),

                    SizedBox(height: 20.h),

                    // Class Details
                    _buildInfoText(subject, isBold: true),
                    _buildInfoText('Class $classLevel', isBold: true),
                    _buildInfoText('Group class', isBold: true),
                    _buildInfoText(address, isBold: true),

                    SizedBox(height: 24.h),

                    // Price
                    Text(
                      '\$$price/\$ monthly',
                      style: TextStyle(
                        color: const Color(0xff2563EB),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Action Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (data?.id != null) {
                          Get.toNamed(
                            AppRoute.reviewpage,
                            arguments: data.id,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1E3A8A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Write a review',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: OutlinedButton(
                      onPressed: () {
                        // Add chat navigation here
                      },
                      style: OutlinedButton.styleFrom(
                        side:
                        const BorderSide(color: Color(0xff2563EB)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Chat with tutor',
                        style: TextStyle(
                          color: const Color(0xff2563EB),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for displaying detail text
  Widget _buildInfoText(String text, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xff2B2B2B),
          fontSize: 16.sp,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}
