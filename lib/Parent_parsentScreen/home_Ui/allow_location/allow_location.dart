// import 'package:first_project/unity/appColors/appGradient.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class AllowLocation extends StatelessWidget {
//   const AllowLocation({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         height: 462,
//         width: 370,
//         //
//         constraints: BoxConstraints(maxWidth: 392.w),
//         decoration: BoxDecoration(
//           color: const Color(0xffFFFFFF),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           mainAxisAlignment: .start,
//           crossAxisAlignment: .start,
//           children: [
//             SizedBox(height: 16.h),
//             Center(child: SvgPicture.asset('assets/icon/mapicon.svg')),
//
//             SizedBox(height: 32.h),
//
//             Text(
//               'Allow NextClass to access your location',
//               style: TextStyle(
//                 color: Color(0xff2B2B2B),
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//
//             SizedBox(height: 4.h),
//             Text(
//               'Allow location for nearby tutors find.',
//               style: TextStyle(color: Color(0xff2B2B2B), fontSize: 12),
//             ),
//             SizedBox(height: 20.h),
//             Image.asset(
//               'assets/backround/🌎 Map Maker_  (Standard).png',
//               //height: ,
//               //width: 310,
//             ),
//             SizedBox(height: 20.h),
//
//             //======================button1===================================
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 height: 32,
//                 width: 310,
//                 decoration: const BoxDecoration(
//                   color: Color(0xffD2E4FC),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(8),
//                     topRight: Radius.circular(8),
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'While using the app',
//                     style: TextStyle(color: Color(0xff2B2B2B), fontSize: 12),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 4),
//
//             //======================button2===================================
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 height: 32,
//                 width: 310,
//                 decoration: const BoxDecoration(
//                   color: Color(0xffD2E4FC),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(8),
//                     topRight: Radius.circular(8),
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'While using the app',
//                     style: TextStyle(color: Color(0xff2B2B2B), fontSize: 12),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 4),
//             //======================button3===================================
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 height: 32,
//                 width: 310,
//                 decoration: const BoxDecoration(
//                   color: Color(0xffD2E4FC),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(8),
//                     topRight: Radius.circular(8),
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'While using the app',
//                     style: TextStyle(color: Color(0xff2B2B2B), fontSize: 12),
//                   ),
//                 ),
//               ),
//             ),
//
//             //
//
//             // Center(
//             //   child: Text(
//             //     name,
//             //     style: TextStyle(
//             //       fontSize: 24.sp,
//             //       fontWeight: FontWeight.bold,
//             //       color: Colors.black,
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/route/Genaral_Controler/locationController.dart';


class AllowLocationDialog extends StatelessWidget {
  AllowLocationDialog({super.key});

  // Controller inject kora holo
  final UserLocationController locationController = Get.put(UserLocationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Dialog size content onujayi hobe
      children: [
        SizedBox(height: 10.h),
        // Icon / Image Section (Jei image ta apnar design a ache)
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.location_on, color: Colors.blue, size: 30),
        ),
        SizedBox(height: 15.h),

        Text(
          "Allow NextClass to access your location",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Text(
          "Allow location for nearby tutors find.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
        SizedBox(height: 20.h),

        // Map Image Placeholder (Apnar image asset use korben)
        Container(
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/backround/🌎 Map Maker_  (Standard).png'), // Use your asset
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20.h),

        // --- BUTTONS ---

        // Button 1: While using the app (ETA TE CLICK KORLE LOCATION ASBE)
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              Get.back(); // Dialog close
              await locationController.getUserLocation(); // Location fetch start
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[50],
              elevation: 0,
            ),
            child: Text("While using the app", style: TextStyle(color: Colors.black)),
          ),
        ),
        SizedBox(height: 8.h),

        // Button 2: Only once
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              Get.back();
              await locationController.getUserLocation();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[50],
              elevation: 0,
            ),
            child: Text("Only once", style: TextStyle(color: Colors.black)),
          ),
        ),
        SizedBox(height: 8.h),

        // Button 3: Don't Allow
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.back(); // Just close dialog
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[50],
              elevation: 0,
            ),
            child: Text("Don't Allow", style: TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}