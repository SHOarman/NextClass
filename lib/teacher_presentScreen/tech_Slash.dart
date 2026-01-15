// ignore_for_file: file_names
// Verified: filename is tech_slash.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// Import your controllers and widgets correctly
import '../Parent_parsentScreen/auth_Screen/auth_controller/parsent_tutor_reg_controller/parsent_tutor_reg_controller.dart';
import '../Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
import '../Parent_parsentScreen/widget/custom_button/custom_button.dart';
import '../core/route/Genaral_Controler/date_controller.dart';
import '../core/route/Genaral_Controler/imagepickurecontroller.dart';
import '../unity/app_colors/app_gradient.dart';
import 'Techechercontrler/techercotroler.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/techerall_widget.dart'; // Ensure this path is correct
import 'package:first_project/core/route/route.dart';

class TechSlash extends StatelessWidget {
  const TechSlash({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ FIX: Use Get.put() to initialize controllers
    final TechSlashController techController = Get.put(TechSlashController());
    final ImagePickureController imagepickureController = Get.put(
      ImagePickureController(),
    );
    final DateController dateController = Get.put(DateController());

    // Main controller might be initialized earlier, so Get.find is okay.
    // If not, change this to Get.put() as well.
    final ParsenttutorRegController parsenttutorRegController = Get.put(
      ParsenttutorRegController(),
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80.h),
            Image.asset('assets/backround/a_20 1.png'),
            SizedBox(height: 14.h),
            Center(child: Image.asset('assets/backround/Frame 4 (1).png')),
            SizedBox(height: 20.h),
            Text(
              'How long have you been teaching?',
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff2B2B2B),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),

            /// ===========================
            ///     CHECKBOX
            /// ===========================
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                    activeColor: Color(0xff2563EB),
                    value: techController.isCurrentlyTeaching.value,
                    onChanged: (value) {
                      techController.isCurrentlyTeaching.value = value!;
                      // ✅ Update the main controller for API
                      parsenttutorRegController.currentlyTeaching = value;
                    },
                  ),
                  Text(
                    "Currently Teaching",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff2563EB),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),

            Row(
              children: const [
                Expanded(
                  child: Text(
                    'From',
                    style: TextStyle(color: Color(0xff2563EB), fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    'To',
                    style: TextStyle(color: Color(0xff2563EB), fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            Row(
              children: [
                /// FROM
                Expanded(
                  child: TecherallWidget(
                    controller: parsenttutorRegController.fromDateController,
                    hintText: 'DD/MM/YYYY',
                    svgPath: "assets/icon/newnew.svg",
                    readOnly: true,
                    onIconTap: () {
                      dateController.selectDate(context, isFromDate: true);
                    },
                  ),
                ),
                SizedBox(width: 12.w),

                /// TO
                Expanded(
                  child: TecherallWidget(
                    controller: parsenttutorRegController.toDateController,
                    hintText: 'DD/MM/YYYY',
                    svgPath: "assets/icon/newnew.svg",
                    readOnly: true,
                    onIconTap: () {
                      dateController.selectDate(context, isFromDate: false);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            Text(
              'Certifications (NIE cert, ABRSM)',
              style: TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),

            /// UPLOAD BOX
            Obx(() {
              return GestureDetector(
                onTap: () {
                  imagepickureController.getImage();
                },
                child: Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF3F5F9),
                    borderRadius: BorderRadius.circular(8),
                    image: imagepickureController.selectedImagePath.value == ''
                        ? null
                        : DecorationImage(
                            image: FileImage(
                              File(
                                imagepickureController.selectedImagePath.value,
                              ),
                            ),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: imagepickureController.selectedImagePath.value == ''
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icon/upload.svg'),
                            SizedBox(height: 10.h),
                            Text(
                              'Upload image or pdf',
                              style: TextStyle(
                                color: Color(0xff888888),
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        )
                      : null,
                ),
              );
            }),

            SizedBox(height: 30.h),

            Text(
              'Personal Education Level',
              style: TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),

            // ✅ FIX: Use the correct controller for Personal Education Level
            SimpleCard(
              controller: parsenttutorRegController.personalEduLevelController,
              hintText: 'Write here.......',
            ),
            SizedBox(height: 34.h),

            // Submit Button
            CustomSuperButton(
              text: 'Submit',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              onTap: () async {
                // ✅ FIX: Use await to wait for the registration process
                await parsenttutorRegController.registerTutor(context);

                // Note: The success dialog is now inside the controller logic
              },
              // clear: dateController.cleartext,
              bgGradient: const LinearGradient(
                colors: [Color(0xff2563EB), Color(0xff2563EB)],
              ),
            ),

            SizedBox(height: 16.h),

            CustomSuperButton(
              text: 'skip',
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              onTap: () {
                Get.toNamed(AppRoute.home2);
              },
              borderColor: Color(0xff2563EB),
              textGradient: Appgradient.primaryGradient,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
