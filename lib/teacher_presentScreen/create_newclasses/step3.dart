import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import '../MapPickerScreen/mapPickerScreen.dart';
import 'classCreateController/classCreateController.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    // Find the class creation controller
    final CreateClassController controller = Get.find<CreateClassController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Class Location Section ---
        Text("Class Location", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),

        // Update the UI automatically when the address changes
        Obx(() {
          return InkWell(
            onTap: () {
              // Navigate to Map screen and pass the controller
              Get.to(() => MapPickerScreen(controller: controller));
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      controller.addressObs.value.isEmpty
                          ? "Tap to select location..."
                          : controller.addressObs.value,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: controller.addressObs.value.isEmpty
                            ? Colors.grey[600]
                            : Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.location_on, color: Colors.blue),
                ],
              ),
            ),
          );
        }),

        SizedBox(height: 20.h),

        // --- Price Input Section ---
        Text("Price (Monthly/Hourly)", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        Simpletextfield(
          controller: controller.priceController,
          hintText: "Enter price (e.g. 5000)",
        ),

        SizedBox(height: 20.h),

        // --- Schedule Input Section ---
        Text("Day of Week", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        Simpletextfield(
          controller: controller.dayController,
          hintText: "e.g. Monday, Wednesday",
        ),
      ],
    );
  }
}