import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:first_project/core/route/route.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/nav_button/nav_button.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/teacher_home_card/teacher_home_card.dart';
import 'package:first_project/unity/app_colors/app_gradient.dart';
import 'package:first_project/Services/Controller_view/create_a_class.dart';
import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/pending_custom_card/pending_custom_card.dart';
import '../techerall_widget/teacher_home_card/custom_profile_section_teacher/custom_profile_section_teacher.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ClassesController to fetch tutor listings
    final ClassesController controller = Get.put(ClassesController());

    return Scaffold(
      bottomNavigationBar: NavButton2(selectIndex: 0),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            // Background Header Decoration
            Container(
              width: double.infinity,
              height: 200.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffd9cdf2), Color(0xffd9cdf2)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),

            // Blur Effect for the background header
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(color: Colors.transparent),
              ),
            ),

            // Profile Section (Static positioned at the top)
            Positioned(
              top: 20.h,
              left: 20.w,
              right: 20.w,
              child: CustomProfileSectionTeacher(),
            ),

            Padding(
              padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Notification Icon Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildNotificationIcon(),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Main Tutor Marketing Card
                  TeacherHomecard(
                    title: 'Grow as a Tutor',
                    subtitle: 'Create classes, manage your schedule,\n and connect with parents.',
                    imagePath: 'assets/backround/teacher.png',
                    iconname: 'Create new class',
                  ),

                  SizedBox(height: 32.h),

                  const Text(
                    'Quick Categories',
                    style: TextStyle(
                      color: Color(0xff2B2B2B),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Shared card for Pending Enrollment Requests
                  Pendingcustomcard(),

                  SizedBox(height: 20.h),

                  // Active Classes Section Header
                  _buildSectionHeader('Active Classes', onSeeAll: () {
                    Get.toNamed(AppRoute.sealactive);
                  }),

                  SizedBox(height: 8.h),

                  // List of Approved Classes belonging to this Tutor
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.activeList.isEmpty) {
                      return _buildEmptyState("No active classes available");
                    }

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // Show maximum 3 items on the home dashboard
                      itemCount: controller.activeList.length > 3
                          ? 3
                          : controller.activeList.length,
                      itemBuilder: (context, index) {
                        var item = controller.activeList[index];
                        var props = item.properties;

                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: CustomCardnew(
                            title: props?.subject ?? "N/A",
                            subtitle: props?.level != null ? "Class ${props!.level}" : "N/A",
                            iconName: (props?.isGroupClass ?? false) ? "Group Class" : "Individual Class",
                            onTap: () {
                              // Navigation to Ongoing Details Screen
                              // Passing the specific class 'item' to filter bookings in the next screen
                              Get.toNamed(
                                AppRoute.onlodingdetelsscreen, // Ensure this route is defined
                                arguments: item,
                              );
                            },
                          ),
                        );
                      },
                    );
                  }),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper: Section Header with "See All" button
  Widget _buildSectionHeader(String title, {required VoidCallback onSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Appgradient.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: onSeeAll,
          child: Text(
            'See all',
            style: TextStyle(
              color: Appgradient.pramary1,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  // Helper: Notification Icon Widget
  Widget _buildNotificationIcon() {
    return Container(
      height: 45.h,
      width: 45.w,
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
        onTap: () {},
        child: Center(
          child: SvgPicture.asset(
            'assets/icon/cutomnotification.svg',
            height: 24.h,
            width: 24.w,
            colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  // Helper: Empty State View
  Widget _buildEmptyState(String message) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}