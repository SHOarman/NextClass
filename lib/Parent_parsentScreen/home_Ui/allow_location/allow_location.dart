// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import 'package:first_project/core/route/Genaral_Controler/location_controller.dart';
//
// class AllowLocationDialog extends StatelessWidget {
//   const AllowLocationDialog({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // ⚠️ Safe Initialization:
//     // এটি চেক করবে কন্ট্রোলারটি মেমোরিতে আছে কিনা। থাকলে খুঁজে নিবে, না থাকলে তৈরি করবে।
//     // এতে টাইপ এরর হওয়ার সুযোগ থাকে না।
//     final UserLocationController locationController =
//         Get.isRegistered<UserLocationController>()
//         ? Get.find<UserLocationController>()
//         : Get.put(UserLocationController());
//
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
//       backgroundColor: Colors.white,
//       insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
//       child: Padding(
//         padding: EdgeInsets.all(20.w), // ভিতরের স্পেসিং
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: 10.h),
//
//             // --- Icon Section ---
//             Container(
//               height: 60.h,
//               width: 60.w,
//               decoration: BoxDecoration(
//                 color: Colors.blue.withValues(alpha: 0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(Icons.location_on, color: Colors.blue, size: 30.sp),
//             ),
//             SizedBox(height: 15.h),
//
//             // --- Text Section ---
//             Text(
//               "Access your location",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 8.h),
//             Text(
//               "NextClass needs your location to find nearby tutors and connect you with students in your area.",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
//             ),
//             SizedBox(height: 20.h),
//
//             // --- Image Section ---
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12.r),
//               child: Container(
//                 height: 100.h,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   image: DecorationImage(
//                     // ইমেজ পাথটি নিশ্চিত হয়ে নিন
//                     image: AssetImage(
//                       'assets/backround/🌎 Map Maker_  (Standard).png',
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 25.h),
//
//             // --- Action Buttons ---
//
//             // 1. Allow Button
//             SizedBox(
//               width: double.infinity,
//               height: 45.h,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   Get.back(); // ডায়ালগ বন্ধ করা
//                   await locationController
//                       .getUserLocation(); // লোকেশন পারমিশন চাওয়া
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.r),
//                   ),
//                 ),
//                 child: Text(
//                   "Allow Location Access",
//                   style: TextStyle(color: Colors.white, fontSize: 14.sp),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 10.h),
//
//             // 2. Don't Allow Button
//             SizedBox(
//               width: double.infinity,
//               height: 45.h,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue[50],
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.r),
//                   ),
//                 ),
//                 child: Text(
//                   "Don't Allow",
//                   style: TextStyle(color: Colors.blue, fontSize: 14.sp),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:first_project/core/route/Genaral_Controler/location_controller.dart';

class AllowLocationDialog extends StatelessWidget {
  AllowLocationDialog({super.key});

  // Best Practice: Use Get.find if it was initialized in main bindings,
  // otherwise Get.put is okay but be aware of lifecycle.
  final UserLocationController locationController =
      Get.find<UserLocationController>();
  // If you haven't put it in main.dart/bindings yet, use: Get.put(UserLocationController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // Wrapped in Dialog widget for better native padding handling
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Padding(
        padding: EdgeInsets.all(20.w), // Internal padding for content
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h),

            // --- Icon Section ---
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.location_on, color: Colors.blue, size: 30.sp),
            ),
            SizedBox(height: 15.h),

            // --- Text Section ---
            Text(
              "Access your location",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "NextClass needs your location to find nearby tutors and connect you with students in your area.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 20.h),

            // --- Image Section ---
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  image: DecorationImage(
                    // ⚠️ IMPORTANT: Rename your asset to remove emojis/spaces
                    // Example: assets/background/map_preview.png
                    image: AssetImage(
                      'assets/backround/🌎 Map Maker_  (Standard).png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),

            // --- BUTTONS ---

            // 1. Grant Permission Button
            _buildOptionButton(
              label: "Allow Location Access",
              color: Colors.blue,
              textColor: Colors.white,
              onTap: () async {
                Get.back(); // Close dialog first
                // This triggers the actual OS System Dialog
                await locationController.getUserLocation();
              },
            ),

            SizedBox(height: 10.h),

            // 2. Deny / Maybe Later
            _buildOptionButton(
              label: "Don't Allow",
              color: Colors.blue[50]!,
              textColor: Colors.blue,
              onTap: () {
                Get.back();
                // Optional: Handle what happens if they deny
                // (e.g., show a snackbar or load default location)
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to keep code clean and consistent
  Widget _buildOptionButton({
    required String label,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
