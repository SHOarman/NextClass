// ======================= IMPORTS =======================
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Controller & Routes
import '../../../Services/Controller_view/teacher_details_controller.dart';
import '../../../core/route/route.dart';

// Custom Widgets
import '../../widget/back_slash/back_slash.dart';
import '../../widget/custom_button/custom_button.dart';

// ======================= HOME CLASS DETAILS SCREEN =======================
class Homeclassdetels extends StatefulWidget {
  const Homeclassdetels({super.key});

  @override
  State<Homeclassdetels> createState() => _HomeclassdetelsState();
}

class _HomeclassdetelsState extends State<Homeclassdetels> {
  // ======================= CONTROLLER =======================
  // Inject TeacherDetailsController using GetX
  final TeacherDetailsController controller = Get.put(
    TeacherDetailsController(),
  );

  // ======================= STATE VARIABLES =======================
  // Favorite icon state
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ======================= REACTIVE UI =======================
      // Obx rebuilds UI when observable data changes
      body: Obx(() {
        // Show loader while data is loading
        if (controller.classData == null) {
          return const Center(child: CircularProgressIndicator());
        }

        // ======================= DATA EXTRACTION =======================
        final properties = controller.classData!.properties;
        final tutor = properties.tutorDetails;
        final schedules = properties.schedules;

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),

              // ======================= TOP BAR =======================
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

              // ======================= TUTOR IMAGE =======================
              // Display tutor profile picture
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

              // ======================= VIEW PROFILE BUTTON =======================
              // Navigate to tutor profile screen
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.viewtotureprofile, arguments: tutor);
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

              // ======================= TUTOR NAME =======================
              Text(
                tutor.fullName,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 10.h),

              // ======================= CLASS DESCRIPTION =======================
              Text(
                ("CLASS DESCRIPTION: ${properties.description}"),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  height: 1.4,
                ),
              ),

              SizedBox(height: 15.h),

              // ======================= CLASS INFORMATION =======================
              _buildSimpleInfoText("Subject: ${properties.subject}"),
              _buildSimpleInfoText("Level: Class ${properties.level}"),
              // _buildSimpleInfoText("Title: ${properties.title}"),
              _buildSimpleInfoText("Address: ${properties.address}"),

              SizedBox(height: 20.h),

              // ======================= CLASS SCHEDULE =======================
              // Show class days list
              if (schedules.isNotEmpty) ...[
                Text(
                  "Class Days:",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: schedules.map((schedule) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff2563EB).withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: const Color(0xff2563EB).withValues(alpha: 0.5),
                        ),
                      ),
                      child: Text(
                        schedule.dayOfWeek.toString().capitalizeFirst ?? "N/A",
                        style: TextStyle(
                          color: const Color(0xff2563EB),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.h),
              ],

              // ======================= PRICE =======================
              Text(
                "\$${properties.pricePerHour}/monthly",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff2563EB),
                ),
              ),

              SizedBox(height: 40.h),

              // ======================= REQUEST BOOKING BUTTON =======================
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

              // ======================= CHAT BUTTON =======================
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

  // ======================= HELPER WIDGET =======================
  // Simple reusable text widget for class info
  Widget _buildSimpleInfoText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}
