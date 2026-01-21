import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/route/route.dart';
import '../../../../unity/app_colors/app_gradient.dart';
import '../../../widget/back_slash/back_slash.dart';
import '../../../widget/custom_button/custom_button.dart';
import '../chartdetels/chat_controller_teacher.dart'; // Adjust path to your controller

class RecommendedPageDetesTeacher0 extends StatefulWidget {
  const RecommendedPageDetesTeacher0({super.key});

  @override
  State<RecommendedPageDetesTeacher0> createState() =>
      _RecommendedPageDetesTeacher0State();
}

class _RecommendedPageDetesTeacher0State
    extends State<RecommendedPageDetesTeacher0> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // Ideally, pass these via Get.arguments from the previous list page
    // final dynamic data = Get.arguments;

    // Fallback values for illustration (Replace with actual data mapping)
    int teacherId = 2;
    int classListingId = 1;
    String teacherName = "Tutor Name";
    String teacherImage = 'assets/backround/Rectangle 5047.png';

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackSlashButton(onTap: () => Get.back()),
                IconButton(
                  onPressed: () => setState(() => isFavorite = !isFavorite),
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : const Color(0xff2B2B2B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  teacherImage,
                  width: 200.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Center(child: _buildActionButton('View Tutor Profile', () {})),
            SizedBox(height: 24.h),
            _buildTutorHeader(teacherName),
            SizedBox(height: 16.h),
            const Text(
              'Lorem ipsum dolor sit amet consectetur. Urna massa mi tellus in sed ullamcorper tortor. Sit sed lorem in dictum...',
              style: TextStyle(color: Color(0xff888888), fontSize: 16),
            ),
            SizedBox(height: 16.h),
            _buildTutorInfo('Mathematics'),
            _buildTutorInfo('Class 1-4'),
            _buildTutorInfo('Group class'),
            _buildTutorInfo('Start from 02 January, 2026'),
            _buildTutorInfo('21/2 St road, Los Angles, USA'),
            SizedBox(height: 24.h),
            const Text(
              '\$56/hr',
              style: TextStyle(
                color: Color(0xff2563EB),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 62.h),
            CustomSuperButton(
              text: 'Request for booking',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              onTap: () => Get.toNamed(AppRoute.requestboking),
              bgGradient: const LinearGradient(
                colors: [Color(0xff2563EB), Color(0xff2563EB)],
              ),
            ),
            SizedBox(height: 16.h),

            /// ===== Updated Chat with Tutor Button Logic =====
            CustomSuperButton(
              text: 'chat with tutor',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              onTap: () async {
                final ChatController controller = Get.put(ChatController());

                // 1. Show global loading
                Get.dialog(
                  const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  ),
                  barrierDismissible: false,
                );

                // 2. Start/Get the conversation ID from API
                int? conversationId = await controller.startConversation(
                  teacherId,
                  classListingId: classListingId,
                );

                if (conversationId != null) {
                  // 3. Initialize Socket and Fetch History BEFORE moving to next screen
                  await controller.enterChatRoom(conversationId);

                  Get.back(); // Close loading dialog

                  // 4. Navigate to Chat Screen
                  Get.toNamed(
                    AppRoute.chatConationTeacher,
                    arguments: [
                      conversationId,
                      teacherName,
                      "",
                    ], // Passing empty string for network image fallback
                  );
                } else {
                  Get.back(); // Close loading
                  Get.snackbar(
                    "Error",
                    "Could not initiate chat. Please try again.",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              borderColor: const Color(0xff2563EB),
              textGradient: Appgradient.primaryGradient,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return Container(
      height: 32.h,
      width: 160.w,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffDBDBDB), width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xff2563EB),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTutorHeader(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            color: const Color(0xff2B2B2B),
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Icon(Icons.star, color: const Color(0xffFFC107), size: 20.sp),
            SizedBox(width: 4.w),
            Text(
              '4.5',
              style: TextStyle(color: const Color(0xff2B2B2B), fontSize: 18.sp),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTutorInfo(String info) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Text(
        info,
        style: const TextStyle(
          color: Color(0xff2B2B2B),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
