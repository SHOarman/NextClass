// import 'dart:ui';
// import 'package:first_project/teacher_presentScreen/home_ui/home_controller.dart';
// import 'package:first_project/teacher_presentScreen/techerall_widget/nav_button/nav_button.dart';
// import 'package:first_project/teacher_presentScreen/techerall_widget/teacher_home_card/teacher_home_card.dart';
// import 'package:first_project/unity/app_colors/app_gradient.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
//
// import '../../Services/controller_view/create_a_class.dart';
// import '../techerall_widget/customcard/customcard.dart';
// import '../techerall_widget/pending_custom_card/pending_custom_card.dart';
// import '../techerall_widget/teacher_homecard/custom_profile_section_teacher/custom_profile_section_teacher.dart';
//
// class HomeUi extends StatelessWidget {
//   const HomeUi({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final HomeController homeController = Get.put(HomeController());
//     final ClassesController controller = Get.put(ClassesController());
//
//     return Scaffold(
//       bottomNavigationBar: NavButton2(selectIndex: 0),
//
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               width: double.infinity,
//               height: 200,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xffd9cdf2), Color(0xffd9cdf2)],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                 ),
//               ),
//             ),
//
//             /// Blur Effect
//             Positioned.fill(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//                 child: Container(color: Colors.transparent),
//               ),
//             ),
//
//             Positioned(
//               top: 20,
//               left: 20,
//               right: 20,
//               child: CustomProfileSectionTeacher(),
//             ),
//
//             Padding(
//               padding: EdgeInsets.only(top: 50, left: 20, right: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         height: 45,
//                         width: 45,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 6,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
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
//                           child: InkWell(
//                             borderRadius: BorderRadius.circular(
//                               22.5,
//                             ), // matches circle
//                             onTap: () {
//                               print('profile');
//                             },
//                             child: Center(
//                               child: SvgPicture.asset(
//                                 'assets/icon/cutomnotification.svg',
//                                 height: 24,
//                                 width: 24,
//                                 colorFilter: ColorFilter.mode(
//                                   Colors.blue,
//                                   BlendMode.srcIn,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: 24.h),
//
//                   ///===================home card =========================
//                   TeacherHomecard(
//                     title: 'Grow as a Tutor',
//                     subtitle:
//                         'Create classes, manage your schedule,\n and connect with parents.',
//                     imagePath: 'assets/backround/teacher.png',
//                     iconname: 'Create new class',
//                   ),
//
//                   //==============catadory=======================================
//                   SizedBox(height: 32.h),
//
//                   Text(
//                     'Quick Categories',
//                     style: TextStyle(
//                       color: Color(0xff2B2B2B),
//                       fontSize: 20,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//
//                   SizedBox(height: 16.h),
//
//                   //============panding card=============================
//                   Pendingcustomcard(),
//                   SizedBox(height: 32.h),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Active Classes',
//                         style: TextStyle(
//                           color: Appgradient.textColor,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'See all',
//                           style: TextStyle(
//                             color: Appgradient.pramary1,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   //======================home catagery================================
//
//                   //   HomeScreenCategories(),
//                   SizedBox(height: 10.h),
//
//                   Obx(() {
//                     // ১. লোডিং স্টেট চেক
//                     if (controller.isLoading.value) {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//
//                     // ২. লিস্ট খালি থাকলে মেসেজ দেখানো
//                     if (controller.activeList.isEmpty) {
//                       return Padding(
//                         padding: EdgeInsets.symmetric(vertical: 20.h),
//                         child: const Text("No active classes available"),
//                       );
//                     }
//
//                     // ৩. ডাটা লিস্ট দেখানো (CustomCardnew দিয়ে র‍্যাপ করা)
//                     return ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(), // স্ক্রল বন্ধ রাখা হয়েছে যেহেতু মেইন বডি স্ক্রলেবল
//                       // হোম পেজে সর্বোচ্চ ৩টি কার্ড দেখানো হবে
//                       itemCount: controller.activeList.length > 3 ? 3 : controller.activeList.length,
//                       itemBuilder: (context, index) {
//                         // নির্দিষ্ট ডাটা আইটেম নেওয়া
//                         var item = controller.activeList[index];
//                         var props = item.properties;
//
//                         // ডাটা এক্সট্রাকশন
//                         String subject = props?.subject ?? "N/A";
//                         String level = props?.level != null ? "Class ${props!.level}" : "N/A";
//                         bool isGroup = props?.isGroupClass ?? false;
//                         String groupStatus = isGroup ? "Group Class" : "Individual Class";
//
//                         // আপনার বিদ্যমান CustomCardnew উইজেট দিয়ে র‍্যাপ করা
//                         return Padding(
//                           padding: EdgeInsets.only(bottom: 16.h),
//                           child: CustomCardnew(
//                             title: subject,       // যেমন: Mathematics
//                             subtitle: level,      // যেমন: Class 6-10
//                             iconName: groupStatus, // যেমন: Group Class
//                             onTap: () {
//                               // কার্ডে ক্লিক করলে যা হবে
//                               print("Clicked on $subject");
//                               // Get.to(() => DetailsPage(item: item));
//                             },
//                           ),
//                         );
//                       },
//                     );
//                   })                  // CustomCardnew(
//
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

import 'package:first_project/teacher_presentScreen/techerall_widget/nav_button/nav_button.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/teacher_home_card/teacher_home_card.dart';
import 'package:first_project/unity/app_colors/app_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:first_project/Services/Controller_view/create_a_class.dart';
import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/pending_custom_card/pending_custom_card.dart';
import '../techerall_widget/teacher_home_card/custom_profile_section_teacher/custom_profile_section_teacher.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controllers
    // final HomeController homeController = Get.put(HomeController());
    final ClassesController controller = Get.put(ClassesController());

    return Scaffold(
      bottomNavigationBar: NavButton2(selectIndex: 0),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Header Decoration
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

            // Blur Effect for the background
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(color: Colors.transparent),
              ),
            ),

            // Profile Section
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: CustomProfileSectionTeacher(),
            ),

            Padding(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Notification Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
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
                        child: InkWell(
                          borderRadius: BorderRadius.circular(22.5),
                          onTap: () {}, // => print('Notification Clicked'),
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

                  SizedBox(height: 24.h),

                  // Main Feature Card (e.g., Grow as a Tutor)
                  TeacherHomecard(
                    title: 'Grow as a Tutor',
                    subtitle:
                        'Create classes, manage your schedule,\n and connect with parents.',
                    imagePath: 'assets/backround/teacher.png',
                    iconname: 'Create new class',
                  ),

                  SizedBox(height: 32.h),

                  // Quick Categories Header
                  const Text(
                    'Quick Categories',
                    style: TextStyle(
                      color: Color(0xff2B2B2B),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Pending Requests Card
                  Pendingcustomcard(),

                  SizedBox(height: 20.h),

                  // Active Classes Header Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Active Classes',
                        style: TextStyle(
                          color: Appgradient.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to Classes Tab or full list
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Appgradient.pramary1,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Gap reduced here to bring cards closer to the title
                  SizedBox(height: 8.h),

                  // Dynamic List for Active Classes
                  Obx(() {
                    // 1. Show Loading while data is being fetched
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // 2. Show Message if no approved classes found
                    if (controller.activeList.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: const Text("No active classes available"),
                      );
                    }

                    // 3. Render List of Approved Classes
                    return ListView.builder(
                      padding: EdgeInsets
                          .zero, // Removes default top padding to reduce gap
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(), // Inside SingleChildScrollView
                      // Show only top 3 on home page
                      itemCount: controller.activeList.length > 3
                          ? 3
                          : controller.activeList.length,
                      itemBuilder: (context, index) {
                        var item = controller.activeList[index];
                        var props = item.properties;

                        // Extract data for display
                        String subject = props?.subject ?? "N/A";
                        String level = props?.level != null
                            ? "Class ${props!.level}"
                            : "N/A";
                        bool isGroup = props?.isGroupClass ?? false;
                        String groupStatus = isGroup
                            ? "Group Class"
                            : "Individual Class";

                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: CustomCardnew(
                            title: subject,
                            subtitle: level,
                            iconName: groupStatus,
                            onTap: () {
                              // print("selected: $subject");
                              // Navigate to details if needed
                            },
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
