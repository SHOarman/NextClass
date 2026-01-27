import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Parent_parsentScreen/widget/back_slash/back_slash.dart';
import '../../Parent_parsentScreen/widget/custom_button/custom_button.dart';
import '../../Services/Controller_view/delete_class_controller.dart';

import '../../unity/app_colors/app_gradient.dart';
import '../bokking2/bokkingWidget/tuition_details.dart';

class Inacriveongoingdetelsscreen extends StatelessWidget {
  const Inacriveongoingdetelsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize delete class controller
    final DeleteClassController deleteClassController = Get.put(
      DeleteClassController(),
    );

    // Receive full class item from arguments
    final dynamic classItem = Get.arguments;
    final props = classItem?.properties;
    final int? classId = classItem?.id;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),

              // Back button
              BackSlashButton(onTap: () => Get.back()),

              SizedBox(height: 40.h),

              // Tuition details section
              Tuitiondetails(
                title: 'Tuition details',
                title1: props?.level != null
                    ? 'Class ${props!.level}'
                    : 'Class N/A',
                title2: props?.subject ?? 'Untitled Subject',
                title3: '\$${props?.pricePerHour ?? '0.00'}',
                title4: (props?.isGroupClass ?? false)
                    ? 'Group class'
                    : 'Individual class',
              ),

              SizedBox(height: 400.h),

              // Delete class button with loading state
              Obx(
                () => CustomSuperButton(
                  text: 'Delete class',
                  isLoading: deleteClassController.isLoading.value,
                  onTap: () {
                    if (classId != null) {
                      // Call delete API
                      deleteClassController.deleteClass(classId);
                    } else {
                      Get.snackbar(
                        "Error",
                        "Class ID not found",
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                    }
                  },
                  borderColor: Appgradient.primaryGradient.colors[0],
                  textGradient: Appgradient.primaryGradient,
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
