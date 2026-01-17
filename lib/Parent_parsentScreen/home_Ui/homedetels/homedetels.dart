// // // import 'dart:ui';
// // //
// // // import 'package:first_project/Parent_parsentScreen/home_Ui/homewigdet/recommended%20Classes/recommended_classes.dart';
// // // import 'package:first_project/Parent_parsentScreen/widget/category/category.dart';
// // // import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
// // // import 'package:first_project/Parent_parsentScreen/widget/home_card/home_card.dart';
// // // import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
// // // import 'package:first_project/Parent_parsentScreen/widget/profile_section/profile_section.dart';
// // // import 'package:first_project/core/route/route.dart';
// // // import 'package:first_project/unity/string_static/strig_static/static_string.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // import 'package:flutter_svg/svg.dart';
// // // import 'package:get/get_core/src/get_main.dart';
// // // import 'package:get/get_navigation/src/extension_navigation.dart';
// // //
// // //
// // // class Homedetels extends StatelessWidget {
// // //   const Homedetels({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       bottomNavigationBar: const NavButton(selectIndex: 0),
// // //       body: SingleChildScrollView(
// // //         child: Stack(
// // //           children: [
// // //             /// ================= BACKGROUND =================
// // //             Container(
// // //               width: double.infinity,
// // //               height: 200,
// // //               decoration: const BoxDecoration(
// // //                 gradient: LinearGradient(
// // //                   colors: [Color(0xffd9cdf2), Color(0xffd9cdf2)],
// // //                   begin: Alignment.bottomCenter,
// // //                   end: Alignment.topCenter,
// // //                 ),
// // //               ),
// // //             ),
// // //
// // //             /// ================= BLUR =================
// // //             Positioned.fill(
// // //               child: BackdropFilter(
// // //                 filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
// // //                 child: Container(color: Colors.transparent),
// // //               ),
// // //             ),
// // //
// // //             /// ================= PROFILE =================
// // //             const Positioned(
// // //               top: 20,
// // //               left: 20,
// // //               right: 20,
// // //               child: Profilesecation(),
// // //             ),
// // //
// // //             /// ================= CONTENT =================
// // //             Padding(
// // //               padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   /// Notification Button
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.end,
// // //                     children: [
// // //                       InkWell(
// // //                         borderRadius: BorderRadius.circular(25),
// // //                         onTap: () {
// // //                           // print('printknow');
// // //                         },
// // //                         child: Container(
// // //                           height: 45,
// // //                           width: 45,
// // //                           decoration: BoxDecoration(
// // //                             color: Colors.white,
// // //                             shape: BoxShape.circle,
// // //                             boxShadow: [
// // //                               BoxShadow(
// // //                                 color: Colors.black12,
// // //                                 blurRadius: 6,
// // //                                 offset: Offset(0, 3),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                           child: Center(
// // //                             child: SvgPicture.asset(
// // //                               'assets/icon/cutomnotification.svg',
// // //                               height: 24,
// // //                               width: 24,
// // //                               colorFilter: const ColorFilter.mode(
// // //                                 Colors.blue,
// // //                                 BlendMode.srcIn,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //
// // //                   SizedBox(height: 30.h),
// // //
// // //                   /// Search + Filter
// // //                   Row(
// // //                     children: [
// // //                       Expanded(
// // //                         child: SimpleCard(
// // //                           controller: TextEditingController(),
// // //                           hintText: 'Search tutors by subject',
// // //                           prefixicon: true,
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 10),
// // //                       InkWell(
// // //                         borderRadius: BorderRadius.circular(8),
// // //                         onTap: () {
// // //                           Get.toNamed(AppRoute.filtermodel);
// // //                         },
// // //                         child: Container(
// // //                           height: 55,
// // //                           width: 45,
// // //                           decoration: BoxDecoration(
// // //                             color: Colors.white,
// // //                             borderRadius: BorderRadius.circular(8),
// // //                           ),
// // //                           child: SvgPicture.asset(
// // //                             'assets/icon/instant_mix.svg',
// // //                             fit: BoxFit.scaleDown,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //
// // //                   SizedBox(height: 24.h),
// // //
// // //                   /// Home Card
// // //                   const Homecard(
// // //                     title: 'Find the Right Tutor',
// // //                     subtitle:
// // //                         'Explore subjects, compare tutors,\n and book in minutes.',
// // //                     imagePath: 'assets/backround/girls.png',
// // //                     iconname: 'Explore',
// // //                   ),
// // //
// // //                   SizedBox(height: 32.h),
// // //
// // //                   /// Categories
// // //                   const Text(
// // //                     'Quick Categories',
// // //                     style: TextStyle(
// // //                       fontSize: 20,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Color(0xff2B2B2B),
// // //                     ),
// // //                   ),
// // //
// // //                   SizedBox(height: 16.h),
// // //
// // //                   //================== Category ==========================================
// // //                   const HomeScreenCategories(),
// // //
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     children: [
// // //                       Text(
// // //                         'Recommended Classes',
// // //                         style: TextStyle(
// // //                           color: Color(0xff2B2B2B),
// // //                           fontSize: 20,
// // //                           fontWeight: FontWeight.bold,
// // //                         ),
// // //                       ),
// // //                       TextButton(
// // //                         onPressed: () {
// // //                           Get.toNamed(AppRoute.seDetels);
// // //                         },
// // //                         child: Text(
// // //                           'See all',
// // //                           style: TextStyle(
// // //                             color: Color(0xff2563EB),
// // //                             fontSize: 16.sp,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //
// // //                   /// ================= Horizontal Card Slider =================
// // //                   SizedBox(
// // //                     height: 280.h, // Adjust the height of the scrollable area
// // //                     child: ListView.builder(
// // //                       scrollDirection: Axis.horizontal, // Horizontal scroll
// // //                       itemCount: 4, // Number of items
// // //                       itemBuilder: (context, index) {
// // //                         return Padding(
// // //                           padding: const EdgeInsets.all(8.0),
// // //                           child: SizedBox(
// // //                             height: 400,
// // //                             width: 200, // Set the width for each card
// // //                             child: Recommendedclasses(
// // //                               selectindex: index,
// // //                               imagepath:
// // //                                   Staticstring.bookingList[index]['imagepath'],
// // //                               tutorielname: Staticstring
// // //                                   .bookingList[index]['tutorielname'],
// // //                               subjectName: Staticstring
// // //                                   .bookingList[index]['subjectName'],
// // //                               classname:
// // //                                   Staticstring.bookingList[index]['classname'],
// // //                               amount: Staticstring.bookingList[index]['amount'],
// // //                             ),
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //                   ),
// // //
// // //                   SizedBox(height: 20.h),
// // //
// // //                   Text(
// // //                     'Nearby Classes',
// // //                     style: TextStyle(
// // //                       color: Color(0xff2B2B2B),
// // //                       fontSize: 20,
// // //                       fontWeight: FontWeight.w600,
// // //                     ),
// // //                   ),
// // //                   SizedBox(height: 16.h),
// // //
// // //                   /// ================= Grid of Recommended Classes =================
// // //                   GridView.builder(
// // //                     padding: EdgeInsets.only(top: 10),
// // //                     shrinkWrap: true,
// // //                     physics: const NeverScrollableScrollPhysics(),
// // //                     gridDelegate:
// // //                         const SliverGridDelegateWithFixedCrossAxisCount(
// // //                           crossAxisCount: 2,
// // //                           mainAxisSpacing: 12,
// // //                           crossAxisSpacing: 12,
// // //                           childAspectRatio: 0.80, // Fix overflow
// // //                         ),
// // //                     itemCount: Staticstring.bookingList.length,
// // //                     itemBuilder: (context, index) {
// // //                       return Recommendedclasses(
// // //                         selectindex: index,
// // //                         imagepath: Staticstring.bookingList[index]['imagepath'],
// // //                         tutorielname:
// // //                             Staticstring.bookingList[index]['tutorielname'],
// // //                         subjectName:
// // //                             Staticstring.bookingList[index]['subjectName'],
// // //                         classname: Staticstring.bookingList[index]['classname'],
// // //                         amount: Staticstring.bookingList[index]['amount'],
// // //                       );
// // //                     },
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// //
// // import 'dart:ui';
// //
// // import 'package:first_project/Parent_parsentScreen/home_Ui/homewigdet/recommended%20Classes/recommended_classes.dart';
// // import 'package:first_project/Parent_parsentScreen/widget/category/category.dart';
// // import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
// // import 'package:first_project/Parent_parsentScreen/widget/home_card/home_card.dart';
// // import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
// // import 'package:first_project/Parent_parsentScreen/widget/profile_section/profile_section.dart';
// // import 'package:first_project/core/route/route.dart';
// // import 'package:first_project/unity/string_static/strig_static/static_string.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:get/get_navigation/src/extension_navigation.dart';
// //
// //
// // class Homedetels extends StatelessWidget {
// //   const Homedetels({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       bottomNavigationBar: const NavButton(selectIndex: 0),
// //       body: SingleChildScrollView(
// //         child: Stack(
// //           children: [
// //             /// ================= BACKGROUND =================
// //             Container(
// //               width: double.infinity,
// //               height: 200,
// //               decoration: const BoxDecoration(
// //                 gradient: LinearGradient(
// //                   colors: [Color(0xffd9cdf2), Color(0xffd9cdf2)],
// //                   begin: Alignment.bottomCenter,
// //                   end: Alignment.topCenter,
// //                 ),
// //               ),
// //             ),
// //
// //             /// ================= BLUR =================
// //             Positioned.fill(
// //               child: BackdropFilter(
// //                 filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
// //                 child: Container(color: Colors.transparent),
// //               ),
// //             ),
// //
// //             /// ================= PROFILE =================
// //             const Positioned(
// //               top: 20,
// //               left: 20,
// //               right: 20,
// //               child: Profilesecation(),
// //             ),
// //
// //             /// ================= CONTENT =================
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   /// Notification Button
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.end,
// //                     children: [
// //                       InkWell(
// //                         borderRadius: BorderRadius.circular(25),
// //                         onTap: () {
// //                           // print('printknow');
// //                         },
// //                         child: Container(
// //                           height: 45,
// //                           width: 45,
// //                           decoration: BoxDecoration(
// //                             color: Colors.white,
// //                             shape: BoxShape.circle,
// //                             boxShadow: [
// //                               BoxShadow(
// //                                 color: Colors.black12,
// //                                 blurRadius: 6,
// //                                 offset: Offset(0, 3),
// //                               ),
// //                             ],
// //                           ),
// //                           child: Center(
// //                             child: SvgPicture.asset(
// //                               'assets/icon/cutomnotification.svg',
// //                               height: 24,
// //                               width: 24,
// //                               colorFilter: const ColorFilter.mode(
// //                                 Colors.blue,
// //                                 BlendMode.srcIn,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //
// //                   SizedBox(height: 30.h),
// //
// //                   /// Search + Filter
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: SimpleCard(
// //                           controller: TextEditingController(),
// //                           hintText: 'Search tutors by subject',
// //                           prefixicon: true,
// //                         ),
// //                       ),
// //                       const SizedBox(width: 10),
// //                       InkWell(
// //                         borderRadius: BorderRadius.circular(8),
// //                         onTap: () {
// //                           Get.toNamed(AppRoute.filtermodel);
// //                         },
// //                         child: Container(
// //                           height: 55,
// //                           width: 45,
// //                           decoration: BoxDecoration(
// //                             color: Colors.white,
// //                             borderRadius: BorderRadius.circular(8),
// //                           ),
// //                           child: SvgPicture.asset(
// //                             'assets/icon/instant_mix.svg',
// //                             fit: BoxFit.scaleDown,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //
// //                   SizedBox(height: 24.h),
// //
// //                   /// Home Card
// //                   const Homecard(
// //                     title: 'Find the Right Tutor',
// //                     subtitle:
// //                     'Explore subjects, compare tutors,\n and book in minutes.',
// //                     imagePath: 'assets/backround/girls.png',
// //                     iconname: 'Explore',
// //                   ),
// //
// //                   SizedBox(height: 32.h),
// //
// //                   /// Categories
// //                   const Text(
// //                     'Quick Categories',
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Color(0xff2B2B2B),
// //                     ),
// //                   ),
// //
// //                   SizedBox(height: 16.h),
// //
// //                   //================== Category ==========================================
// //                   const HomeScreenCategories(),
// //
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text(
// //                         'Recommended Classes',
// //                         style: TextStyle(
// //                           color: Color(0xff2B2B2B),
// //                           fontSize: 20,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       TextButton(
// //                         onPressed: () {
// //                           Get.toNamed(AppRoute.seDetels);
// //                         },
// //                         child: Text(
// //                           'See all',
// //                           style: TextStyle(
// //                             color: Color(0xff2563EB),
// //                             fontSize: 16.sp,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //
// //                   /// ================= Horizontal Card Slider =================
// //                   SizedBox(
// //                     height: 280.h, // Adjust the height of the scrollable area
// //                     child: ListView.builder(
// //                       scrollDirection: Axis.horizontal, // Horizontal scroll
// //                       itemCount: 4, // Number of items
// //                       itemBuilder: (context, index) {
// //                         return Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: SizedBox(
// //                             height: 400,
// //                             width: 200, // Set the width for each card
// //                             child: Recommendedclasses(
// //                               selectindex: index,
// //                               imagepath:
// //                               Staticstring.bookingList[index]['imagepath'],
// //                               tutorielname: Staticstring
// //                                   .bookingList[index]['tutorielname'],
// //                               subjectName: Staticstring
// //                                   .bookingList[index]['subjectName'],
// //                               classname:
// //                               Staticstring.bookingList[index]['classname'],
// //                               amount: Staticstring.bookingList[index]['amount'],
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //
// //                   SizedBox(height: 20.h),
// //
// //                   Text(
// //                     'Nearby Classes',
// //                     style: TextStyle(
// //                       color: Color(0xff2B2B2B),
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   ),
// //                   SizedBox(height: 16.h),
// //
// //                   /// ================= Grid of Recommended Classes =================
// //                   GridView.builder(
// //                     padding: EdgeInsets.only(top: 10),
// //                     shrinkWrap: true,
// //                     physics: const NeverScrollableScrollPhysics(),
// //                     gridDelegate:
// //                     const SliverGridDelegateWithFixedCrossAxisCount(
// //                       crossAxisCount: 2,
// //                       mainAxisSpacing: 12,
// //                       crossAxisSpacing: 12,
// //                       childAspectRatio: 0.80, // Fix overflow
// //                     ),
// //                     itemCount: Staticstring.bookingList.length,
// //                     itemBuilder: (context, index) {
// //                       return Recommendedclasses(
// //                         selectindex: index,
// //                         imagepath: Staticstring.bookingList[index]['imagepath'],
// //                         tutorielname:
// //                         Staticstring.bookingList[index]['tutorielname'],
// //                         subjectName:
// //                         Staticstring.bookingList[index]['subjectName'],
// //                         classname: Staticstring.bookingList[index]['classname'],
// //                         amount: Staticstring.bookingList[index]['amount'],
// //                       );
// //                     },
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// // import 'dart:ui';
// // import 'package:first_project/Services/Controller_view/home_par_controller.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:get/get.dart';
// //
// // // ✅ আপনার প্রোজেক্টের পাথ অনুযায়ী এই ইমপোর্টগুলো চেক করুন
// // import 'package:first_project/Parent_parsentScreen/home_Ui/homewigdet/recommended%20Classes/recommended_classes.dart';
// // import 'package:first_project/Parent_parsentScreen/home_Ui/allow_location/allow_location.dart'; // লোকেশন ডায়ালগ
// // import 'package:first_project/core/route/route.dart';
// //
// // // অন্যান্য উইজেট ইমপোর্ট
// // import 'package:first_project/Parent_parsentScreen/widget/category/category.dart';
// // import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
// // import 'package:first_project/Parent_parsentScreen/widget/home_card/home_card.dart';
// // import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
// // import 'package:first_project/Parent_parsentScreen/widget/profile_section/profile_section.dart';
// //
// //
// // class Homedetels extends StatelessWidget {
// //   const Homedetels({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // ✅ ১. কন্ট্রোলার ইনিশিলাইজ করা
// //     final ParentHomeController controller = Get.put(ParentHomeController());
// //
// //     return Scaffold(
// //       bottomNavigationBar: const NavButton(selectIndex: 0),
// //       body: SingleChildScrollView(
// //         child: Stack(
// //           children: [
// //             /// ================= BACKGROUND =================
// //             Container(
// //               width: double.infinity,
// //               height: 200,
// //               decoration: const BoxDecoration(
// //                 gradient: LinearGradient(
// //                   colors: [Color(0xffd9cdf2), Color(0xffd9cdf2)],
// //                   begin: Alignment.bottomCenter,
// //                   end: Alignment.topCenter,
// //                 ),
// //               ),
// //             ),
// //
// //             /// ================= BLUR =================
// //             Positioned.fill(
// //               child: BackdropFilter(
// //                 filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
// //                 child: Container(color: Colors.transparent),
// //               ),
// //             ),
// //
// //             /// ================= PROFILE =================
// //             const Positioned(
// //               top: 20,
// //               left: 20,
// //               right: 20,
// //               child: Profilesecation(),
// //             ),
// //
// //             /// ================= CONTENT =================
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   /// Notification Button
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.end,
// //                     children: [
// //                       InkWell(
// //                         borderRadius: BorderRadius.circular(25),
// //                         onTap: () {
// //                           // Notification logic
// //                         },
// //                         child: Container(
// //                           height: 45,
// //                           width: 45,
// //                           decoration: BoxDecoration(
// //                             color: Colors.white,
// //                             shape: BoxShape.circle,
// //                             boxShadow: const [
// //                               BoxShadow(
// //                                 color: Colors.black12,
// //                                 blurRadius: 6,
// //                                 offset: Offset(0, 3),
// //                               ),
// //                             ],
// //                           ),
// //                           child: Center(
// //                             child: SvgPicture.asset(
// //                               'assets/icon/cutomnotification.svg',
// //                               height: 24,
// //                               width: 24,
// //                               colorFilter: const ColorFilter.mode(
// //                                 Colors.blue,
// //                                 BlendMode.srcIn,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //
// //                   SizedBox(height: 30.h),
// //
// //                   /// Search + Filter
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: SimpleCard(
// //                           controller: TextEditingController(),
// //                           hintText: 'Search tutors by subject',
// //                           prefixicon: true,
// //                         ),
// //                       ),
// //                       const SizedBox(width: 10),
// //                       InkWell(
// //                         borderRadius: BorderRadius.circular(8),
// //                         onTap: () {
// //                           Get.toNamed(AppRoute.filtermodel);
// //                         },
// //                         child: Container(
// //                           height: 55,
// //                           width: 45,
// //                           decoration: BoxDecoration(
// //                             color: Colors.white,
// //                             borderRadius: BorderRadius.circular(8),
// //                           ),
// //                           child: SvgPicture.asset(
// //                             'assets/icon/instant_mix.svg',
// //                             fit: BoxFit.scaleDown,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //
// //                   SizedBox(height: 24.h),
// //
// //                   /// Home Card
// //                   const Homecard(
// //                     title: 'Find the Right Tutor',
// //                     subtitle:
// //                     'Explore subjects, compare tutors,\n and book in minutes.',
// //                     imagePath: 'assets/backround/girls.png',
// //                     iconname: 'Explore',
// //                   ),
// //
// //                   SizedBox(height: 32.h),
// //
// //                   /// Categories
// //                   const Text(
// //                     'Quick Categories',
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Color(0xff2B2B2B),
// //                     ),
// //                   ),
// //
// //                   SizedBox(height: 16.h),
// //                   const HomeScreenCategories(),
// //
// //                   /// ================= Recommended Classes (Horizontal) =================
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       const Text(
// //                         'Recommended Classes',
// //                         style: TextStyle(
// //                           color: Color(0xff2B2B2B),
// //                           fontSize: 20,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       TextButton(
// //                         onPressed: () {
// //                           Get.toNamed(AppRoute.seDetels);
// //                         },
// //                         child: Text(
// //                           'See all',
// //                           style: TextStyle(
// //                             color: const Color(0xff2563EB),
// //                             fontSize: 16.sp,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //
// //                   // Horizontal List (Fixed Error here)
// //                   SizedBox(
// //                     height: 280.h,
// //                     child: Obx(() {
// //                       if (controller.nearbyClasses.isEmpty) {
// //                         return const Center(child: Text("No recommended classes yet"));
// //                       }
// //                       return ListView.builder(
// //                         scrollDirection: Axis.horizontal,
// //                         itemCount: controller.nearbyClasses.length,
// //                         itemBuilder: (context, index) {
// //                           return Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: SizedBox(
// //                               height: 400,
// //                               width: 200,
// //                               child: Recommendedclasses(
// //                                 classData: controller.nearbyClasses[index],
// //                               ),
// //                             ),
// //                           );
// //                         },
// //                       );
// //                     }),
// //                   ),
// //
// //                   SizedBox(height: 20.h),
// //
// //                   /// ================= Nearby Classes Header =================
// //                   Text(
// //                     'Nearby Classes',
// //                     style: TextStyle(
// //                       color: const Color(0xff2B2B2B),
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   ),
// //                   SizedBox(height: 16.h),
// //
// //                   /// ================= Nearby Classes Logic (UPDATED) =================
// //                   Obx(() {
// //
// //                     if (controller.isLoading.value) {
// //                       return const Center(child: CircularProgressIndicator());
// //                     }
// //
// //                     if (controller.locationController.latitude.value == 0.0) {
// //                       return Container(
// //                         height: 150,
// //                         width: double.infinity,
// //                         alignment: Alignment.center,
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             const Icon(Icons.location_off, color: Colors.grey, size: 40),
// //                             const SizedBox(height: 8),
// //                             const Text("Location needed to find nearby tutors"),
// //                             TextButton(
// //                               onPressed: () => Get.dialog(AllowLocationDialog()),
// //                               child: const Text("Allow Location"),
// //                             )
// //                           ],
// //                         ),
// //                       );
// //                     }
// //
// //                     if (controller.nearbyClasses.isEmpty) {
// //                       return Container(
// //                         height: 100,
// //                         alignment: Alignment.center,
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             const Text("No tutors found nearby"),
// //                             TextButton(
// //                                 onPressed: ()=> controller.fetchNearbyClasses(),
// //                                 child: const Text("Refresh")
// //                             )
// //                           ],
// //                         ),
// //                       );
// //                     }
// //
// //                     return GridView.builder(
// //                       padding: const EdgeInsets.only(top: 10),
// //                       shrinkWrap: true,
// //                       physics: const NeverScrollableScrollPhysics(),
// //                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                         crossAxisCount: 2,
// //                         mainAxisSpacing: 12,
// //                         crossAxisSpacing: 12,
// //                         childAspectRatio: 0.75,
// //                       ),
// //                       itemCount: controller.nearbyClasses.length,
// //                       itemBuilder: (context, index) {
// //
// //                         return Recommendedclasses(
// //                           classData: controller.nearbyClasses[index],
// //                         );
// //
// //                       },
// //                     );
// //                   }),
// //
// //                   // Bottom padding for safe area scrolling
// //                   SizedBox(height: 20.h),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'dart:ui';
// import 'package:first_project/Services/Controller_view/home_par_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
//
// // ✅ আপনার ফোল্ডার স্ট্রাকচার অনুযায়ী ইমপোর্ট পাথ চেক করে নিন
// import 'package:first_project/Services/model_class/model_class.dart';
// import 'package:first_project/Parent_parsentScreen/home_Ui/homewigdet/recommended%20Classes/recommended_classes.dart';
// import 'package:first_project/Parent_parsentScreen/home_Ui/allow_location/allow_location.dart';
// import 'package:first_project/core/route/route.dart';
// import 'package:first_project/Parent_parsentScreen/widget/category/category.dart';
// import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
// import 'package:first_project/Parent_parsentScreen/widget/home_card/home_card.dart';
// import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
// import 'package:first_project/Parent_parsentScreen/widget/profile_section/profile_section.dart';
//
// class Homedetels extends StatelessWidget {
//   const Homedetels({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // ✅ কন্ট্রোলার ইনজেকশন
//     //final ParentHomeController controller = Get.put(ParentHomeController());
//
//     return Scaffold(
//       bottomNavigationBar: const NavButton(selectIndex: 0),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             /// ================= BACKGROUND GRADIENT =================
//             Container(
//               width: double.infinity,
//               height: 200,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xffd9cdf2), Color(0xffd9cdf2)],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                 ),
//               ),
//             ),
//
//             /// ================= BLUR EFFECT =================
//             Positioned.fill(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//                 child: Container(color: Colors.transparent),
//               ),
//             ),
//
//             /// ================= PROFILE HEADER =================
//             const Positioned(
//               top: 20,
//               left: 20,
//               right: 20,
//               child: Profilesecation(),
//             ),
//
//             /// ================= MAIN CONTENT =================
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 90, 20, 20), // Top Padding adjusted for Profile Section
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   // Notification Button
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       InkWell(
//                         borderRadius: BorderRadius.circular(25),
//                         onTap: () {
//                           // Notification action
//                         },
//                         child: Container(
//                           height: 45,
//                           width: 45,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Colors.black12,
//                                 blurRadius: 6,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: SvgPicture.asset(
//                               'assets/icon/cutomnotification.svg',
//                               height: 24,
//                               width: 24,
//                               colorFilter: const ColorFilter.mode(
//                                 Colors.blue,
//                                 BlendMode.srcIn,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: 20.h),
//
//                   /// Search Bar & Filter
//                   Row(
//                     children: [
//                       Expanded(
//                         child: SimpleCard(
//                           controller: TextEditingController(),
//                           hintText: 'Search tutors by subject',
//                           prefixicon: true,
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       InkWell(
//                         borderRadius: BorderRadius.circular(8),
//                         onTap: () {
//                           Get.toNamed(AppRoute.filtermodel);
//                         },
//                         child: Container(
//                           height: 55,
//                           width: 45,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: SvgPicture.asset(
//                               'assets/icon/instant_mix.svg',
//                               fit: BoxFit.scaleDown,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: 24.h),
//
//                   /// Promo Card
//                   const Homecard(
//                     title: 'Find the Right Tutor',
//                     subtitle: 'Explore subjects, compare tutors,\n and book in minutes.',
//                     imagePath: 'assets/backround/girls.png',
//                     iconname: 'Explore',
//                   ),
//
//                   SizedBox(height: 32.h),
//
//                   /// Categories
//                   const Text(
//                     'Quick Categories',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xff2B2B2B),
//                     ),
//                   ),
//
//                   SizedBox(height: 16.h),
//                   const HomeScreenCategories(),
//
//                   /// ================= SECTION: RECOMMENDED CLASSES (Horizontal) =================
//                   SizedBox(height: 20.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Recommended Classes',
//                         style: TextStyle(
//                           color: Color(0xff2B2B2B),
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Get.toNamed(AppRoute.seDetels);
//                         },
//                         child: Text(
//                           'See all',
//                           style: TextStyle(
//                             color: const Color(0xff2563EB),
//                             fontSize: 16.sp,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   // Horizontal List View (Showing Top 5 Nearby)
//                   SizedBox(
//                     height: 280.h, // কার্ডের হাইট অনুযায়ী এডজাস্ট করুন
//                     child: Obx(() {
//                       if (controller.isLoading.value) {
//                         return const Center(child: CircularProgressIndicator());
//                       }
//                       if (controller.nearbyClasses.isEmpty) {
//                         return const Center(child: Text("No recommendations available right now."));
//                       }
//                       return ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         // সর্বোচ্চ ৫টা আইটেম দেখাবে
//                         itemCount: controller.nearbyClasses.length > 5 ? 5 : controller.nearbyClasses.length,
//                         itemBuilder: (context, index) {
//                           ListingFeature data = controller.nearbyClasses[index];
//                           return Padding(
//                             padding: const EdgeInsets.only(right: 12.0),
//                             child: SizedBox(
//                               width: 220.w, // কার্ডের উইডথ
//                               child: Recommendedclasses(
//                                 classData: data, // ডাটা পাস করা হলো
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     }),
//                   ),
//
//                   SizedBox(height: 20.h),
//
//                   /// ================= SECTION: NEARBY CLASSES (Vertical Grid) =================
//                   Text(
//                     'Nearby Classes (10km)',
//                     style: TextStyle(
//                       color: const Color(0xff2B2B2B),
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(height: 16.h),
//
//                   Obx(() {
//                     // 1. Loading Check
//                     if (controller.isLoading.value) {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//
//                     // 2. Location Permission Check (যদি ০.০ থাকে)
//                     if (controller.locationController.latitude.value == 0.0) {
//                       return Container(
//                         height: 150,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade100,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Icon(Icons.location_off, color: Colors.redAccent, size: 30),
//                             const SizedBox(height: 8),
//                             const Text("Location permission required"),
//                             TextButton(
//                               onPressed: () => Get.dialog(AllowLocationDialog()),
//                               child: const Text("Enable Location"),
//                             )
//                           ],
//                         ),
//                       );
//                     }
//
//                     // 3. Empty Data Check
//                     if (controller.nearbyClasses.isEmpty) {
//                       return Container(
//                         height: 120,
//                         width: double.infinity,
//                         alignment: Alignment.center,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text("No tutors found in your area (10km)"),
//                             const SizedBox(height: 8),
//                             ElevatedButton.icon(
//                                 onPressed: () => controller.fetchNearbyClasses(),
//                                 icon: const Icon(Icons.refresh, size: 16),
//                                 label: const Text("Refresh")
//                             )
//                           ],
//                         ),
//                       );
//                     }
//
//                     // 4. Data List (Grid View) - সব ক্লাস দেখাবে
//                     return GridView.builder(
//                       padding: const EdgeInsets.only(bottom: 20),
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(), // প্যারেন্ট স্ক্রল করবে
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 12,
//                         crossAxisSpacing: 12,
//                         childAspectRatio: 0.65, // কার্ডের হাইট/উইডথ রেশিও। দরকার হলে কমান/বাড়ান (0.6 - 0.8)
//                       ),
//                       itemCount: controller.nearbyClasses.length,
//                       itemBuilder: (context, index) {
//                         return Recommendedclasses(
//                           classData: controller.nearbyClasses[index],
//                         );
//                       },
//                     );
//                   }),
//
//                   // Bottom Space for Nav Bar
//                   SizedBox(height: 60.h),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ✅ ১. কন্ট্রোলার ইমপোর্ট
import 'package:first_project/Services/Controller_view/classes_controller.dart'; // বা parent_home_controller.dart (নাম চেক করুন)

// ✅ ২. নতুন মডেল ইমপোর্ট (যেটি আমরা আগের স্টেপে বানিয়েছি)

// ✅ ৩. অন্যান্য উইজেট ইমপোর্ট
import 'package:first_project/Parent_parsentScreen/home_Ui/allow_location/allow_location.dart';
import 'package:first_project/Parent_parsentScreen/home_Ui/homewigdet/recommended Classes/recommended_classes.dart';
import 'package:first_project/core/route/route.dart';
import 'package:first_project/Parent_parsentScreen/widget/category/category.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
import 'package:first_project/Parent_parsentScreen/widget/home_card/home_card.dart';
import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
import 'package:first_project/Parent_parsentScreen/widget/profile_section/profile_section.dart';

import '../../../Services/model_class/usershow_model.dart';


class Homedetels extends StatelessWidget {
  const Homedetels({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ কন্ট্রোলার ইনজেকশন
    final ParentHomeController controller = Get.put(ParentHomeController());

    return Scaffold(
      bottomNavigationBar: const NavButton(selectIndex: 0),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            /// ================= BACKGROUND =================
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffd9cdf2), Color(0xffd9cdf2)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(color: Colors.transparent),
              ),
            ),

            /// ================= PROFILE HEADER =================
            const Positioned(
              top: 20, left: 20, right: 20,
              child: Profilesecation(),
            ),

            /// ================= MAIN CONTENT =================
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 90, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Notification Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 45, width: 45,
                          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: SvgPicture.asset('assets/icon/cutomnotification.svg', height: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  // Search Bar
                  Row(
                    children: [
                      Expanded(
                        child: SimpleCard(
                          controller: TextEditingController(),
                          hintText: 'Search tutors...',
                          prefixicon: true,
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => Get.toNamed(AppRoute.filtermodel),
                        child: Container(
                          height: 55, width: 45,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset('assets/icon/instant_mix.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // Promo Card
                  const Homecard(
                    title: 'Find the Right Tutor',
                    subtitle: 'Explore subjects...',
                    imagePath: 'assets/backround/girls.png',
                    iconname: 'Explore',
                  ),
                  SizedBox(height: 32.h),

                  // Categories
                  const Text('Quick Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16.h),
                  const HomeScreenCategories(),

                  /// ================= RECOMMENDED CLASSES (Horizontal) =================
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Recommended Classes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () => Get.toNamed(AppRoute.seDetels),
                        child: Text('See all', style: TextStyle(color: const Color(0xff2563EB), fontSize: 16.sp)),
                      ),
                    ],
                  ),

                  // ✅ Horizontal List View (Updated with TutorModel)
                  SizedBox(
                    height: 230.h,
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (controller.nearbyClasses.isEmpty) {
                        return const Center(child: Text("No classes available right now."));
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // সর্বোচ্চ ৫টি দেখাবে
                        itemCount: controller.nearbyClasses.length > 5 ? 5 : controller.nearbyClasses.length,
                        itemBuilder: (context, index) {
                          // 🔥 টাইপ পরিবর্তন: NearbyClassModel -> TutorModel
                          TutorModel data = controller.nearbyClasses[index];

                          return Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: SizedBox(
                              width: 180.w,
                              child: Recommendedclasses(classData: data),
                            ),
                          );
                        },
                      );
                    }),
                  ),

                  SizedBox(height: 20.h),

                  /// ================= NEARBY CLASSES (Vertical Grid) =================
                  const Text('Nearby Classes (10km)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  SizedBox(height: 16.h),

                  // ✅ Vertical Grid View (Updated with TutorModel)
                  Obx(() {
                    // 1. Loading
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // 2. Permission Check
                    if (controller.locationController.latitude.value == 0.0) {
                      return Center(
                        child: TextButton(
                          onPressed: () => Get.dialog(const AllowLocationDialog()),
                          child: const Text("Enable Location to see classes"),
                        ),
                      );
                    }

                    // 3. Empty Data
                    if (controller.nearbyClasses.isEmpty) {
                      return Center(
                        child: Column(
                          children: [
                            const Text("No tutors found nearby (10km)"),
                            TextButton(
                              onPressed: () => controller.fetchApprovedClasses(),
                              child: const Text("Refresh"),
                            )
                          ],
                        ),
                      );
                    }

                    // 4. Grid View
                    return GridView.builder(
                      padding: const EdgeInsets.only(bottom: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.72, // কার্ডের সাইজ অনুযায়ী এডজাস্ট করা হয়েছে
                      ),
                      itemCount: controller.nearbyClasses.length,
                      itemBuilder: (context, index) {
                        return Recommendedclasses(
                          // 🔥 টাইপ অটোমেটিক TutorModel হিসেবে পাস হবে
                          classData: controller.nearbyClasses[index],
                        );
                      },
                    );
                  }),

                  SizedBox(height: 60.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}