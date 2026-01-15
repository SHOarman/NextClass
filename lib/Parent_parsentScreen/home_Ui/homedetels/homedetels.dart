// import 'dart:ui';
//
// import 'package:first_project/Parent_parsentScreen/home_Ui/homewigdet/recommended%20Classes/recommended_classes.dart';
// import 'package:first_project/Parent_parsentScreen/widget/category/category.dart';
// import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
// import 'package:first_project/Parent_parsentScreen/widget/home_card/home_card.dart';
// import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
// import 'package:first_project/Parent_parsentScreen/widget/profile_section/profile_section.dart';
// import 'package:first_project/core/route/route.dart';
// import 'package:first_project/unity/string_static/strig_static/static_string.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
//
//
// class Homedetels extends StatelessWidget {
//   const Homedetels({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: const NavButton(selectIndex: 0),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             /// ================= BACKGROUND =================
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
//             /// ================= BLUR =================
//             Positioned.fill(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//                 child: Container(color: Colors.transparent),
//               ),
//             ),
//
//             /// ================= PROFILE =================
//             const Positioned(
//               top: 20,
//               left: 20,
//               right: 20,
//               child: Profilesecation(),
//             ),
//
//             /// ================= CONTENT =================
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// Notification Button
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       InkWell(
//                         borderRadius: BorderRadius.circular(25),
//                         onTap: () {
//                           // print('printknow');
//                         },
//                         child: Container(
//                           height: 45,
//                           width: 45,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                             boxShadow: [
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
//                   SizedBox(height: 30.h),
//
//                   /// Search + Filter
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
//                           child: SvgPicture.asset(
//                             'assets/icon/instant_mix.svg',
//                             fit: BoxFit.scaleDown,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: 24.h),
//
//                   /// Home Card
//                   const Homecard(
//                     title: 'Find the Right Tutor',
//                     subtitle:
//                         'Explore subjects, compare tutors,\n and book in minutes.',
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
//
//                   //================== Category ==========================================
//                   const HomeScreenCategories(),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
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
//                             color: Color(0xff2563EB),
//                             fontSize: 16.sp,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   /// ================= Horizontal Card Slider =================
//                   SizedBox(
//                     height: 280.h, // Adjust the height of the scrollable area
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal, // Horizontal scroll
//                       itemCount: 4, // Number of items
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: SizedBox(
//                             height: 400,
//                             width: 200, // Set the width for each card
//                             child: Recommendedclasses(
//                               selectindex: index,
//                               imagepath:
//                                   Staticstring.bookingList[index]['imagepath'],
//                               tutorielname: Staticstring
//                                   .bookingList[index]['tutorielname'],
//                               subjectName: Staticstring
//                                   .bookingList[index]['subjectName'],
//                               classname:
//                                   Staticstring.bookingList[index]['classname'],
//                               amount: Staticstring.bookingList[index]['amount'],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//
//                   SizedBox(height: 20.h),
//
//                   Text(
//                     'Nearby Classes',
//                     style: TextStyle(
//                       color: Color(0xff2B2B2B),
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(height: 16.h),
//
//                   /// ================= Grid of Recommended Classes =================
//                   GridView.builder(
//                     padding: EdgeInsets.only(top: 10),
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 12,
//                           crossAxisSpacing: 12,
//                           childAspectRatio: 0.80, // Fix overflow
//                         ),
//                     itemCount: Staticstring.bookingList.length,
//                     itemBuilder: (context, index) {
//                       return Recommendedclasses(
//                         selectindex: index,
//                         imagepath: Staticstring.bookingList[index]['imagepath'],
//                         tutorielname:
//                             Staticstring.bookingList[index]['tutorielname'],
//                         subjectName:
//                             Staticstring.bookingList[index]['subjectName'],
//                         classname: Staticstring.bookingList[index]['classname'],
//                         amount: Staticstring.bookingList[index]['amount'],
//                       );
//                     },
//                   ),
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

import 'package:first_project/Parent_parsentScreen/home_Ui/homewigdet/recommended%20Classes/recommended_classes.dart';
import 'package:first_project/Parent_parsentScreen/widget/category/category.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
import 'package:first_project/Parent_parsentScreen/widget/home_card/home_card.dart';
import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
import 'package:first_project/Parent_parsentScreen/widget/profile_section/profile_section.dart';
import 'package:first_project/core/route/route.dart';
import 'package:first_project/unity/string_static/strig_static/static_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


class Homedetels extends StatelessWidget {
  const Homedetels({super.key});

  @override
  Widget build(BuildContext context) {
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

            /// ================= BLUR =================
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(color: Colors.transparent),
              ),
            ),

            /// ================= PROFILE =================
            const Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Profilesecation(),
            ),

            /// ================= CONTENT =================
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Notification Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          // print('printknow');
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icon/cutomnotification.svg',
                              height: 24,
                              width: 24,
                              colorFilter: const ColorFilter.mode(
                                Colors.blue,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30.h),

                  /// Search + Filter
                  Row(
                    children: [
                      Expanded(
                        child: SimpleCard(
                          controller: TextEditingController(),
                          hintText: 'Search tutors by subject',
                          prefixicon: true,
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          Get.toNamed(AppRoute.filtermodel);
                        },
                        child: Container(
                          height: 55,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            'assets/icon/instant_mix.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  /// Home Card
                  const Homecard(
                    title: 'Find the Right Tutor',
                    subtitle:
                    'Explore subjects, compare tutors,\n and book in minutes.',
                    imagePath: 'assets/backround/girls.png',
                    iconname: 'Explore',
                  ),

                  SizedBox(height: 32.h),

                  /// Categories
                  const Text(
                    'Quick Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2B2B2B),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  //================== Category ==========================================
                  const HomeScreenCategories(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended Classes',
                        style: TextStyle(
                          color: Color(0xff2B2B2B),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.seDetels);
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Color(0xff2563EB),
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// ================= Horizontal Card Slider =================
                  SizedBox(
                    height: 280.h, // Adjust the height of the scrollable area
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Horizontal scroll
                      itemCount: 4, // Number of items
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 400,
                            width: 200, // Set the width for each card
                            child: Recommendedclasses(
                              selectindex: index,
                              imagepath:
                              Staticstring.bookingList[index]['imagepath'],
                              tutorielname: Staticstring
                                  .bookingList[index]['tutorielname'],
                              subjectName: Staticstring
                                  .bookingList[index]['subjectName'],
                              classname:
                              Staticstring.bookingList[index]['classname'],
                              amount: Staticstring.bookingList[index]['amount'],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 20.h),

                  Text(
                    'Nearby Classes',
                    style: TextStyle(
                      color: Color(0xff2B2B2B),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  /// ================= Grid of Recommended Classes =================
                  GridView.builder(
                    padding: EdgeInsets.only(top: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.80, // Fix overflow
                    ),
                    itemCount: Staticstring.bookingList.length,
                    itemBuilder: (context, index) {
                      return Recommendedclasses(
                        selectindex: index,
                        imagepath: Staticstring.bookingList[index]['imagepath'],
                        tutorielname:
                        Staticstring.bookingList[index]['tutorielname'],
                        subjectName:
                        Staticstring.bookingList[index]['subjectName'],
                        classname: Staticstring.bookingList[index]['classname'],
                        amount: Staticstring.bookingList[index]['amount'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
