import 'dart:io';

import 'package:first_project/core/route/route.dart';
import 'package:first_project/core/succesfullcontroler/succesfullcontroler.dart';
import 'package:first_project/teacher_presentScreen/teacherfirstSecationController/teacherfirstSecationController.dart';
import 'package:first_project/teacher_presentScreen/techerall_widget/techerall_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import '../Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import '../core/route/Genaral_Controler/dateController.dart';
import '../core/route/Genaral_Controler/imagepickurecontroller.dart';
import '../unity/appColors/appGradient.dart';
import 'Techechercontrler/techercotroler.dart';

class TechSlash extends StatelessWidget {
  TechSlash({super.key});

  final TechSlashController techController = Get.put(TechSlashController());

  @override
  Widget build(BuildContext context) {



    ImagePickureController imagepickurecontroller = Get.put(
      ImagePickureController(),
    );

    final DateController controller = Get.put(DateController());
    var teacherfirstsecationcontroller=Get.put(Teacherfirstsecationcontroller());

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
                    controller: teacherfirstsecationcontroller.fromDateController,
                    hintText: 'DD-MM-YYYY',
                    svgPath: "assets/icon/newnew.svg",
                    readOnly: true,
                    onIconTap: () {
                      // Call controller logic
                      controller.selectDate(context, isFromDate: true);
                    },
                  ),
                ),
                SizedBox(width: 12.w),

                /// TO
                Expanded(
                  child: TecherallWidget(
                    controller:teacherfirstsecationcontroller.toDateController,
                    hintText: 'DD-MM-YYYY',
                    svgPath: "assets/icon/newnew.svg",


                    readOnly: true,
                    onIconTap: () {
                      // Call controller logic
                      controller.selectDate(context, isFromDate: false);
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
            ///
            ///
            ///

            // Inside your build method
            Obx(() {
              return GestureDetector(
                onTap: () {
                  imagepickurecontroller.getImage();
                },
                child: Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF3F5F9),
                    borderRadius: BorderRadius.circular(8),
                    // CONDITION: If path is empty -> No image. If path exists -> Show Image
                    image: imagepickurecontroller.selectedImagePath.value == ''
                        ? null
                        : DecorationImage(
                            image: FileImage(
                              File(
                                imagepickurecontroller.selectedImagePath.value,
                              ),
                            ),
                            fit: BoxFit.cover,
                          ),
                  ),
                  // CONDITION: If path is empty -> Show Icon/Text. If path exists -> Show nothing (null)
                  child: imagepickurecontroller.selectedImagePath.value == ''
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
                      : null, // Child is null because the image is in the decoration
                ),
              );
            }),

            // Obx(
            //    () {
            //     return GestureDetector(
            //
            //       onTap: () {
            //         imagepickurecontroller.getImage();
            //       },
            //       child: Container(
            //
            //         height: 150.h,
            //         width: double.infinity,
            //         decoration: BoxDecoration(
            //           color: Color(0xffF3F5F9),
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             SvgPicture.asset('assets/icon/upload.svg'),
            //             SizedBox(height: 10.h),
            //             Text(
            //               'Upload image or pdf',
            //               style: TextStyle(color: Color(0xff888888), fontSize: 16.sp),
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   }
            // ),
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

            SimpleCard(

              controller: teacherfirstsecationcontroller.educationLevelController,
              hintText: 'Write here.......',
            ),
            SizedBox(height: 34.h),
            CustomSuperButton(
              text: 'Submit',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              onTap: () {
                teacherfirstsecationcontroller.techerdetels();


                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.white,
                    content: Reviewpopupmsg(
                      name: 'Successful',
                      namedetels:
                          'Your account is under review. You\'ll be notified when your account is approved.',
                      bu_name1: 'Close',
                      ontap1: () {
                        Get.toNamed(AppRoute.home2);

                      },
                    ),
                  ),
                );
              },
              clear:controller.cleartext,

              bgGradient: const LinearGradient(
                colors: [Color(0xff2563EB), Color(0xff2563EB)],
              ),
            ),
            SizedBox(height: 16.h),

            CustomSuperButton(

              text: 'Skip',
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
