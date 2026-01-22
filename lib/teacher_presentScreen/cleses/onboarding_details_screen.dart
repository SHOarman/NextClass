import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../Parent_parsentScreen/widget/back_slash/back_slash.dart';
import '../../Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
import '../../Services/Controller_view/ongoing_details_controller.dart';
import '../../unity/app_colors/app_gradient.dart';
import '../bokking2/bokkingWidget/tuition_details.dart';
import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/markasinactive/markasinactive.dart';

class Onlodingdetelsscareen extends StatelessWidget {
  const Onlodingdetelsscareen({super.key});

  @override
  Widget build(BuildContext context) {
    // ------------------------------
    // 1. Receive class data from previous page
    // ------------------------------
    final dynamic classItem = Get.arguments;
    final props = classItem.properties;

    // ------------------------------
    // 2. Initialize controller
    // ------------------------------
    final OngoingDetailsController detailsController = Get.put(
      OngoingDetailsController(),
    );

    // Filter students for this class once screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      detailsController.filterStudentsByClass(classItem.id);
    });

    TextEditingController nameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),

              // ------------------------------
              // Top Row: Back + Mark as inactive
              // ------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackSlashButton(onTap: () => Get.back()),
                  Markasinactive(
                    text: 'Mark as inactive',
                    ontap: () => _showInactiveDialog(context),
                  ),
                ],
              ),

              SizedBox(height: 34.h),

              // ------------------------------
              // Search field (dynamic search by student/parent name)
              // ------------------------------
              SimpleCard(
                controller: nameController,
                hintText: 'Search by name',
                prefixicon: true,
                // Uncomment below to enable dynamic search
                // onChanged: (value) => detailsController.searchStudent(value),
              ),

              SizedBox(height: 24.h),

              // ------------------------------
              // Tuition details (dynamic from class data)
              // ------------------------------
              Tuitiondetails(
                title: 'Tuition details',
                title2: props?.subject ?? "N/A",
                title3: "\$${props?.pricePerHour ?? '0.00'}",
                title4: (props?.isGroupClass ?? false)
                    ? "Group class"
                    : "Individual",
                title1: "Class ${props?.level ?? 'N/A'}",
              ),

              SizedBox(height: 32.h),

              // ------------------------------
              // Booking count row
              // ------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Booking by',
                    style: TextStyle(
                      color: Appgradient.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Obx(
                    () => Text(
                      '${detailsController.bookingCount.value}',
                      style: TextStyle(
                        color: Appgradient.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),
              const Text(
                'Go to the Bookings section to accept new student requests.',
                style: TextStyle(color: Color(0xff888888), fontSize: 12),
              ),

              SizedBox(height: 24.h),

              // ------------------------------
              // Dynamic enrolled student list
              // ------------------------------
              Obx(() {
                if (detailsController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (detailsController.enrolledStudents.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("No enrolled students found."),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: detailsController.enrolledStudents.length,
                  itemBuilder: (context, index) {
                    final booking = detailsController.enrolledStudents[index];

                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: CustomCardnew(
                        title: booking.parentDetails?.fullName ?? "Parent name",
                        subtitle: "Class ${props?.level ?? ''}",
                        iconName: booking.studentName ?? "Student name",
                        fullscrenonTap: () {},
                        imagePath:
                            booking.parentDetails?.profilePicture ??
                            'assets/backround/Rectangle 5050 (6).png',
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------------------
  // Show inactive dialog
  // ------------------------------
  void _showInactiveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        // content: Extrabuttonpaddinginpormationmodel(
        //   ontap1: () => Get.toNamed(AppRoute.home2),
        //   ontap2: () => Get.back(),
        //   buttonname1: 'Mark as inactive',
        //   buttonname2: 'Close',
        // ),
      ),
    );
  }
}
