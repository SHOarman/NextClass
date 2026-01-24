import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:first_project/Services/Controller_view/create_a_class.dart';
import '../../core/route/route.dart';

// Custom card widget
import '../techerall_widget/customcard/customcard.dart';

class InactivePage extends StatelessWidget {
  const InactivePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final ClassesController controller = Get.put(ClassesController());

    return Scaffold(
      body: Obx(() {
        //===================== Loading State =====================
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff2563EB)),
          );
        }

        //===================== Empty State =======================
        if (controller.inactiveList.isEmpty) {
          return Center(
            child: Text(
              "No inactive classes found",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          );
        }

        //===================== Inactive Classes List =============
        return ListView.builder(
          padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
          itemCount: controller.inactiveList.length,
          itemBuilder: (context, index) {
            final item = controller.inactiveList[index];
            final props = item.properties;

            // Extract class data
            final String subject = props?.subject ?? "Untitled Subject";
            final String level = props?.level != null ? "Class ${props!.level}" : "N/A";
            final bool isGroup = props?.isGroupClass ?? false;
            final String groupStatus = isGroup ? "Group Class" : "Individual Class";

            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: CustomCardnew(
                title: subject,
                subtitle: level,
                iconName: groupStatus,
                imagePath: 'assets/backround/boking1.png',

                // Navigate to details screen on tap
                fullscrenonTap: () {
                  debugPrint("Navigating to Inactive Details with ID: ${item.id}");
                  Get.toNamed(
                    AppRoute.inacriveongoingdetelsscreen,
                    arguments: item, // Pass the full object
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
