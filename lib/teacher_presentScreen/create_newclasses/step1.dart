import 'package:first_project/teacher_presentScreen/create_newclasses/classCreateController/classCreateController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Step1 extends StatelessWidget {
  const Step1({super.key});

  @override
  Widget build(BuildContext context) {
    // Find the controller instance
    final CreateClassController controller = Get.find<CreateClassController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ================== 1. Class Education Level ==================
        Text(
          "Class Education Level",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff2B2B2B),
          ),
        ),
        SizedBox(height: 12.h),

        // Layout for Education Level selection
        Obx(() => Wrap(
          spacing: 12.w, // Horizontal gap
          runSpacing: 12.h, // Vertical gap
          children: [
            _buildCustomRadioButton(
              title: "Preschool",
              value: "Preschool",
              groupValue: controller.selectedEducationLevel.value,
              onTap: (val) => controller.selectedEducationLevel.value = val,
            ),
            _buildCustomRadioButton(
              title: "Primary",
              value: "Primary",
              groupValue: controller.selectedEducationLevel.value,
              onTap: (val) => controller.selectedEducationLevel.value = val,
            ),
            _buildCustomRadioButton(
              title: "Secondary",
              value: "Secondary",
              groupValue: controller.selectedEducationLevel.value,
              onTap: (val) => controller.selectedEducationLevel.value = val,
            ),
            _buildCustomRadioButton(
              title: "Tertiary Education",
              value: "Tertiary Education",
              groupValue: controller.selectedEducationLevel.value,
              onTap: (val) => controller.selectedEducationLevel.value = val,
            ),
          ],
        )),

        SizedBox(height: 25.h),

        // ================== 2. Class Size ==================
        Text(
          "Class Size",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff2B2B2B),
          ),
        ),
        SizedBox (height: 12.h),

        // Layout for Class Size selection
        Obx(() => Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: [
            _buildCustomRadioButton(
              title: "Group",
              value: "Group",
              groupValue: controller.selectedClassSize.value,
              onTap: (val) => controller.selectedClassSize.value = val,
            ),
            _buildCustomRadioButton(
              title: "Individual",
              value: "Individual",
              groupValue: controller.selectedClassSize.value,
              onTap: (val) => controller.selectedClassSize.value = val,
            ),
            _buildCustomRadioButton(
              title: "Both",
              value: "Both",
              groupValue: controller.selectedClassSize.value,
              onTap: (val) => controller.selectedClassSize.value = val,
            ),
          ],
        )),
      ],
    );
  }

  // ================== Custom Radio Button Widget ==================
  // This builds a clickable box for options
  Widget _buildCustomRadioButton({
    required String title,
    required String value,
    required String groupValue,
    required Function(String) onTap,
  }) {
    bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onTap(value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6F8), // Light grey background
          borderRadius: BorderRadius.circular(8.r),
          // Show blue border only if selected
          border: isSelected ? Border.all(color: Colors.blue, width: 1) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Takes only as much space as needed
          children: [
            // Radio Circle Icon
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Colors.blue : Colors.grey, // Changes color based on selection
              size: 20.sp,
            ),
            SizedBox(width: 8.w),

            // Option Title Text
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: isSelected ? Colors.black : const Color(0xff7C7C7C),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}