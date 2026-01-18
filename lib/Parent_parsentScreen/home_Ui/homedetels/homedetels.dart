import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ======================= Imports =======================
import 'package:first_project/Services/Controller_view/classes_controller.dart';
import 'package:first_project/Parent_parsentScreen/home_Ui/allow_location/allow_location.dart';
import 'package:first_project/Parent_parsentScreen/home_Ui/homewigdet/recommended Classes/recommended_classes.dart';
import 'package:first_project/core/route/route.dart';
import 'package:first_project/Parent_parsentScreen/widget/category/category.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
import 'package:first_project/Parent_parsentScreen/widget/home_card/home_card.dart';
import 'package:first_project/Parent_parsentScreen/widget/nav_button/nav_button.dart';
import 'package:first_project/Parent_parsentScreen/widget/profile_section/profile_section.dart';

class Homedetels extends StatelessWidget {
  const Homedetels({super.key});

  @override
  Widget build(BuildContext context) {
    // ======================= Controller =======================
    // Inject ParentHomeController using GetX
    final ParentHomeController controller = Get.put(ParentHomeController());

    return Scaffold(
      // Bottom navigation bar
      bottomNavigationBar: const NavButton(selectIndex: 0),

      body: RefreshIndicator(
        // ======================= Pull to Refresh =======================
        // Refresh approved classes from API
        onRefresh: () async => controller.fetchApprovedClasses(),

        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: [
              // ======================= Background Gradient =======================
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
                padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ======================= Profile Section =======================
                    const Profilesecation(),
                    SizedBox(height: 25.h),

                    // ======================= Search Bar =======================
                    _buildSearchBar(),
                    SizedBox(height: 25.h),

                    // ======================= Home Banner Card =======================
                    const Homecard(
                      title: 'Find the Right Tutor',
                      subtitle: 'Explore 100+ subjects nearby',
                      imagePath: 'assets/backround/girls.png',
                      iconname: 'Explore',
                    ),

                    SizedBox(height: 30.h),

                    // ======================= Quick Categories =======================
                    const Text(
                      'Quick Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    const HomeScreenCategories(),

                    SizedBox(height: 25.h),

                    // ======================= Recommended Header =======================
                    _buildSectionHeader(
                      'Recommended',
                      () => Get.toNamed(AppRoute.seDetels),
                    ),

                    SizedBox(height: 15.h),

                    // ======================= Recommended Placeholder =======================
                    // API data is not shown here yet
                    SizedBox(
                      height: 150.h,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(
                          child: Text(
                            "Special Offers or Recommended Items Here",
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // ======================= Nearby Classes Title =======================
                    const Text(
                      'Nearby Classes (5km)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.h),

                    // ======================= Nearby Classes Grid =======================
                    // Location based API data is shown here
                    Obx(() {
                      // Show loader while fetching data
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // Location not enabled
                      if (controller.locationController.latitude.value == 0.0) {
                        return _buildLocationPlaceholder();
                      }

                      // No nearby classes found
                      if (controller.nearbyClasses.isEmpty) {
                        return _buildEmptyState();
                      }

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,
                          childAspectRatio: 0.58,
                        ),
                        itemCount: controller.nearbyClasses.length,
                        itemBuilder: (context, index) {
                          final data = controller.nearbyClasses[index];
                          return Recommendedclasses(
                            key: ValueKey("grid_${data.id}"),
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

  // ======================= Helper Widgets =======================

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
                BoxShadow(color: Colors.black12, blurRadius: 4),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset('assets/icon/instant_mix.svg'),
            ),
          ),
        ),
      ],
    );
  }

  // Section title with "See all" button
  Widget _buildSectionHeader(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

  // Empty state when no classes found
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off, size: 40.sp, color: Colors.grey),
          SizedBox(height: 10.h),
          const Text(
            'No active classes found nearby',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Location permission placeholder
  Widget _buildLocationPlaceholder() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Enable location to see tutors near you'),
          TextButton(
            onPressed: () => Get.dialog(const AllowLocationDialog()),
            child: const Text('Allow Access'),
          ),
        ],
      ),
    );
  }
}
