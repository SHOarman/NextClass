import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

//======================== Controllers ========================
import 'package:first_project/Services/Controller_view/classes_controller.dart';

//======================== Screens & Widgets ========================
import 'package:first_project/Parent_parsentScreen/home_Ui/allow_location/allow_location.dart';
import 'package:first_project/Parent_parsentScreen/home_Ui/homewigdet/recommended%20Classes/recommended_classes.dart';
import 'package:first_project/core/route/route.dart';
import 'package:first_project/Parent_parsentScreen/widget/category/category.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
import 'package:first_project/Parent_parsentScreen/widget/home_card/home_card.dart';
import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
import 'package:first_project/Parent_parsentScreen/widget/profile_section/profile_section.dart';

//======================== Home Details Screen ========================
class Homedetels extends StatelessWidget {
  const Homedetels({super.key});

  @override
  Widget build(BuildContext context) {

    //======================== Initialize Controller ========================
    // Parent home controller for fetching classes and location-based data
    final ParentHomeController homeController =
    Get.put(ParentHomeController());

    return Scaffold(
      backgroundColor: Colors.white,

      //======================== Bottom Navigation ========================
      bottomNavigationBar: const NavButton(selectIndex: 0),

      //======================== Pull To Refresh ========================
      body: RefreshIndicator(
        color: const Color(0xff2563EB),
        onRefresh: () async {
          // Refresh approved classes from server
          await homeController.fetchApprovedClasses();
        },

        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: [

              //======================== Top Gradient Background ========================
              Container(
                width: double.infinity,
                height: 220.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffd9cdf2), Color(0xffffffff)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(
                    20.w, 50.h, 20.w, 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //======================== Profile Section ========================
                    const Profilesecation(),
                    SizedBox(height: 25.h),

                    //======================== Search Bar ========================
                    _buildSearchBar(),
                    SizedBox(height: 25.h),

                    //======================== Hero Card ========================
                    const Homecard(
                      title: 'Find the Right Tutor',
                      subtitle: 'Explore 100+ subjects nearby',
                      imagePath: 'assets/backround/girls.png',
                      iconname: 'Explore',
                    ),

                    SizedBox(height: 30.h),

                    //======================== Categories Section ========================
                    Text(
                      'Quick Categories',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff2B2B2B),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    const HomeScreenCategories(),

                    SizedBox(height: 25.h),

                    //======================== Recommended Header ========================
                    _buildSectionHeader(
                      'Recommended',
                          () => Get.toNamed(AppRoute.seDetels),
                    ),
                    SizedBox(height: 15.h),

                    //======================== Recommended Banner ========================
                    _buildRecommendedBanner(),

                    SizedBox(height: 30.h),

                    //======================== Nearby Classes ========================
                    Text(
                      'Nearby Classes (5km)',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff2B2B2B),
                      ),
                    ),
                    SizedBox(height: 15.h),

                    //======================== Nearby Classes List ========================
                    Obx(() {

                      // Loading state
                      if (homeController.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // Location permission not granted
                      if (homeController.locationController.latitude.value == 0.0) {
                        return _buildLocationPlaceholder();
                      }

                      // Empty data state
                      if (homeController.nearbyClasses.isEmpty) {
                        return _buildEmptyState();
                      }

                      // Grid view of nearby classes
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics:
                        const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,
                          childAspectRatio: 0.6,
                        ),
                        itemCount:
                        homeController.nearbyClasses.length,
                        itemBuilder: (context, index) {
                          final data =
                          homeController.nearbyClasses[index];
                          return Recommendedclasses(
                            key: ValueKey("nearby_${data.id}"),
                            classData: data,
                          );
                        },
                      );
                    }),

                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //======================== Helper Widgets ========================

  // Search bar with filter button
  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: SimpleCard(
            controller: TextEditingController(),
            hintText: 'Search for tutors or subjects...',
            prefixicon: true,
          ),
        ),
        SizedBox(width: 12.w),
        InkWell(
          onTap: () => Get.toNamed(AppRoute.filtermodel),
          child: Container(
            height: 52.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                'assets/icon/instant_mix.svg',
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Section header with "See all" action
  Widget _buildSectionHeader(
      String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'See all',
            style: TextStyle(
              color: const Color(0xff2563EB),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // Recommended banner UI
  Widget _buildRecommendedBanner() {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: const DecorationImage(
          image:
          AssetImage('assets/backround/Rectangle 5047.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(15.r),
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          Center(
            child: Text(
              "Special Offers for You",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Empty state when no tutors found
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Icon(
            Icons.search_off,
            size: 50.sp,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: 10.h),
          Text(
            'No tutors found in your area.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  // Location permission placeholder
  Widget _buildLocationPlaceholder() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.location_on,
            color: const Color(0xff2563EB),
            size: 30.sp,
          ),
          SizedBox(height: 10.h),
          Text(
            'Please enable location to find tutors nearby',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            onPressed: () =>
                Get.dialog(AllowLocationDialog()),
            style: ElevatedButton.styleFrom(
              backgroundColor:
              const Color(0xff2563EB),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(8.r),
              ),
            ),
            child: const Text(
              'Allow Location Access',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
