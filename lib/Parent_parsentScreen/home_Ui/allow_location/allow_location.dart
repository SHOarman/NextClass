import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//======================== Location Controller ========================
import 'package:first_project/core/route/general_controller/location_controller.dart';

//======================== Allow Location Dialog ========================
class AllowLocationDialog extends StatelessWidget {
  const AllowLocationDialog({super.key});

  @override
  Widget build(BuildContext context) {

    //======================== Get or Create Controller ========================
    // If controller already exists, find it
    // Otherwise, create a new one
    final UserLocationController locationController =
    Get.isRegistered<UserLocationController>()
        ? Get.find<UserLocationController>()
        : Get.put(UserLocationController());

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),

      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            SizedBox(height: 10.h),

            //======================== Location Icon ========================
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.location_on,
                color: Colors.blue,
                size: 30.sp,
              ),
            ),

            SizedBox(height: 15.h),

            //======================== Title Text ========================
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

            //======================== Description Text ========================
            Text(
              "NextClass needs your location to find nearby tutors and connect you with students in your area.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[600],
              ),
            ),

            SizedBox(height: 20.h),

            //======================== Map Image ========================
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/backround/map_maker_standard.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(height: 25.h),

            //======================== Action Buttons ========================

            // Allow Location Access
            _buildOptionButton(
              label: "Allow Location Access",
              color: Colors.blue,
              textColor: Colors.white,
              onTap: () async {
                Get.back(); // Close dialog
                await locationController.getUserLocation();
              },
            ),

            SizedBox(height: 10.h),

            // Don't Allow Location Access
            _buildOptionButton(
              label: "Don't Allow",
              color: const Color(0xFFE3F2FD),
              textColor: Colors.blue,
              onTap: () {
                Get.back(); // Close dialog
              },
            ),
          ],
        ),
      ),
    );
  }

  //======================== Reusable Button Widget ========================
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
