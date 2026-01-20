import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ======================= Imports =======================
import '../../../Services/Controller_view/teacher_details_controller.dart';
import '../../../core/route/route.dart';

import '../../widget/back_slash/back_slash.dart';
import '../../widget/custom_button/custom_button.dart';

class Homeclassdetels extends StatefulWidget {
  const Homeclassdetels({super.key});

  @override
  State<Homeclassdetels> createState() => _HomeclassdetelsState();
}

class _HomeclassdetelsState extends State<Homeclassdetels> {
  // ======================= Controller =======================
  // Inject TeacherDetailsController using GetX
  final TeacherDetailsController controller = Get.put(
    TeacherDetailsController(),
  );

  // Favorite icon state
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ======================= Reactive UI =======================
      // Obx rebuilds UI when observable data changes
      body: Obx(() {
        // Show loader while data is loading
        if (controller.classData == null) {
          return const Center(child: CircularProgressIndicator());
        }

        // Get class and tutor data
        final properties = controller.classData!.properties;
        final tutor = properties.tutorDetails;

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),

              // ======================= Top Bar =======================
              // Back button and favorite icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackSlashButton(onTap: () => Get.back()),
                  IconButton(
                    onPressed: () => setState(() => isFavorite = !isFavorite),
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : const Color(0xff2B2B2B),
                      size: 28.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // ======================= Tutor Image =======================
              // Show tutor profile image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(
                    tutor.profilePicture ?? "",
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/backround/placeholder.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              // ======================= View Profile Button =======================
              // Navigate to tutor profile screen
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    Get.toNamed(
                      AppRoute.viewtotureprofile,
                      arguments: tutor, // Pass tutor data
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    "View Tutor Profile",
                    style: TextStyle(
                      color: const Color(0xff2563EB),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // ======================= Tutor Name =======================
              Text(
                tutor.fullName,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 10.h),

              // ======================= Class Description =======================
              Text(
                properties.description,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[500],
                  height: 1.4,
                ),
              ),

              SizedBox(height: 15.h),

              // ======================= Class Information =======================
              _buildSimpleInfoText(properties.subject),
              _buildSimpleInfoText("Class ${properties.level}"),
              _buildSimpleInfoText(properties.title),
              _buildSimpleInfoText(properties.address),

              SizedBox(height: 20.h),

              // ======================= Price =======================
              Text(
                "\$${properties.pricePerHour}/hr",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff2563EB),
                ),
              ),

              SizedBox(height: 40.h),

              // ======================= Request Booking Button =======================
              CustomSuperButton(
                text: 'Request Booking',
                onTap: () {

                  Get.toNamed(
                    AppRoute.requestboking,
                    arguments: controller.classData,
                  );
                },
                bgGradient: const LinearGradient(
                  colors: [Color(0xff2563EB), Color(0xff2563EB)],
                ),
              ),

              SizedBox(height: 15.h),

              // ======================= Chat Button =======================
              CustomSuperButton(
                text: 'Chat with tutor',
                onTap: () =>
                    Get.toNamed(AppRoute.chatConationTeacher, arguments: tutor),
                borderColor: const Color(0xff2563EB),
                textColor: const Color(0xff2563EB),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        );
      }),
    );
  }

  // ======================= Helper Widget =======================
  // Simple text row for class info
  Widget _buildSimpleInfoText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
