import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ======================= CONTROLLER IMPORT =======================
import '../../../Services/Controller_view/tutorprofile.dart';

// ======================= TUTOR PROFILE SCREEN =======================
class TutorProfileScreen extends StatelessWidget {
  const TutorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ======================= CONTROLLER INITIALIZATION =======================
    // Initialize controller using GetX (keeps data in memory)
    Get.put(TutorPublicProfileController());

    return Scaffold(
      backgroundColor: Colors.white,

      // ======================= STATE BUILDER =======================
      // GetBuilder rebuilds UI when controller updates
      body: GetBuilder<TutorPublicProfileController>(
        builder: (ctrl) {
          // ======================= LOADING STATE =======================
          // Show loader if both tutor and booking data are null
          if (ctrl.tutor == null && ctrl.bokking == null) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          }

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h),

                // ======================= BACK BUTTON =======================
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blue,
                          size: 20.sp,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                // ======================= PROFILE IMAGE =======================
                // Network image with error handling
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      ctrl.image, // Common image getter from controller
                      width: 200.w,
                      height: 180.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/backround/placeholder.png',
                        width: 200.w,
                        height: 180.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // ======================= TUTOR INFORMATION =======================
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ======================= NAME & RATING =======================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              ctrl.name, // Tutor name getter
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                ctrl.rating.toString(), // Rating getter
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),

                      // ======================= BIO SECTION =======================
                      Text(
                        ctrl.bio, // Tutor bio getter
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                      ),

                      SizedBox(height: 25.h),

                      // ======================= VERIFICATION TITLE =======================
                      Text(
                        "Verification Status",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 10.h),

                      // ======================= VERIFICATION STATUS =======================
                      Row(
                        children: [
                          const Icon(Icons.verified, color: Colors.blue),
                          SizedBox(width: 8.w),
                          Text(
                            "Verified",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
