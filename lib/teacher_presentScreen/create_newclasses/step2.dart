import 'package:first_project/teacher_presentScreen/create_newclasses/classCreateController/classCreateController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';

class Step2 extends StatelessWidget {
  const Step2({super.key});

  @override
  Widget build(BuildContext context) {
    // Find the class creation controller
    final CreateClassController controller = Get.find<CreateClassController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),

        // --- Class Level Input Section ---
        Text("Class Level", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        Simpletextfield(
          controller: controller.classLevelInputController,
          hintText: "ex: class 1-4",
        ),

        SizedBox(height: 20.h),

        // --- Class Subject Input Section ---
        Text("Class Subject", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        Simpletextfield(
          controller: controller.titleController,
          hintText: "Enter subject name",
        ),

        SizedBox(height: 20.h),

        // --- Class Details (Description) Section ---
        Text("Class Details", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        Customdetesl(
          controller: controller.detailsController,
          hintText: 'Write down about your class...',
        ),
      ],
    );
  }
}