import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/route/Genaral_Controler/locationController.dart';

class Profilesecation extends StatelessWidget {
  const Profilesecation({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller initialize
    final UserLocationController locationController = Get.put(UserLocationController());

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Center align for better look
        children: [
         // SizedBox(height: 12.h,),
          // 1. Profile Image
          GestureDetector(
            onTap: () {
              // Profile e click korle jai hobe
            },
            child:Image.asset('assets/backround/Rectangle 5040.png'

            ,
            height: 50.h,
            width: 50.w,
            ),
          ),

          SizedBox(width: 12.w), // Image ar text er majhe gap

          // 2. Name and Location Column
          Expanded( 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, 
              children: [
                Text(
                  "Hi, Hans",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff121212),
                  ),
                ),
                SizedBox(height: 4.h),

                // ✅ Location with Obx
                Obx(() => Row( 
                  children: [
                  //  Icon(Icons.location_on, size: 14.sp, color: Colors.grey),
                   // SizedBox(width: 4.w),
                    Flexible( 
                      child: Text(
                        locationController.isLoading.value
                            ? "Locating..."
                            : locationController.currentAddress.value.isEmpty
                            ? "Location not found"
                            : locationController.currentAddress.value,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                        overflow: TextOverflow.ellipsis, 
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                ),
              ],
            ),
          ),

          
        ],
      ),
    );
  }
}