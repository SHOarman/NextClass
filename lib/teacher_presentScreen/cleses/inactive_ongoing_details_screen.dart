import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../Parent_parsentScreen/widget/back_slash/back_slash.dart';
import '../../Parent_parsentScreen/widget/custom_button/custom_button.dart';
import '../../Services/Controller_view/DeleteClassController.dart';
import '../../core/route/route.dart';
import '../../core/succesfullcontroler/succesfullcontroler.dart';
import '../../unity/app_colors/app_gradient.dart';
import '../bokking2/bokkingWidget/tuition_details.dart';

class Inacriveongoingdetelsscreen extends StatelessWidget {
  const Inacriveongoingdetelsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    //================= Find or create controller ========================
    final DeleteClassController deleteClassController =
    Get.put(DeleteClassController());

    //================= Receive full class item from arguments ========================
    final dynamic classItem = Get.arguments;
    final props = classItem?.properties;

    //================= Extract class ID safely ========================
    final int? classId = classItem?.id;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              BackSlashButton(onTap: () => Get.back()),
              SizedBox(height: 40.h),

              //================= Tuition details section ========================
              Tuitiondetails(
                title: 'Tuition details',
                title2: props?.subject ?? 'N/A',
                title3: '\$${props?.pricePerHour ?? '0.00'}',
                title4: (props?.isGroupClass ?? false)
                    ? 'Group class'
                    : 'Individual',
                title1: 'Class ${props?.level ?? 'N/A'}',
              ),

              SizedBox(height: 350.h),

              //================= Mark class as active button ========================
              CustomSuperButton(
                text: 'Mark as active',
                onTap: () => _showSuccessDialog(context),
                bgGradient: Appgradient.primaryGradient,
              ),

              SizedBox(height: 20.h),

              //================= Delete class button with loading state ========================
              Obx(
                    () => CustomSuperButton(
                  text: 'Delete class',
                  isLoading: deleteClassController.isLoading.value,
                  onTap: () {
                    if (classId != null) {
                      //================= Call delete API with valid ID ========================
                      deleteClassController.deleteClass(classId);
                    } else {
                      Get.snackbar("Error", "Class ID not found");
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

  //================= Success dialog after activation ========================
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        content: Successfullmsg(
          name: 'Successful',
          namedetels: 'Your class listing is now live',
          buName1: 'Edit class',
          ontap1: () => Get.toNamed(AppRoute.classes),
          buName2: 'Close',
          ontap2: () => Get.back(),
        ),
      ),
    );
  }
}
