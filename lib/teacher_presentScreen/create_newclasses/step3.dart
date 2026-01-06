import 'package:first_project/unity/appColors/appGradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import 'classCreateController/classCreateController.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
   var classcreatecontroller = Get.put(Classcreatecontroller());



    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Write the class name that you want to tuition',
              style: TextStyle(
                color: Appgradient.TextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            Simpletextfield(
              controller:classcreatecontroller. tuitionontroller,
              hintText: 'Write subjects name...',
            ),
            SizedBox(height: 15.h),
            Text(
              'Price/class',
              style: TextStyle(
                color: Appgradient.TextColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10.h),
        
            Simpletextfield(
              controller: classcreatecontroller.enrichmentclasscontroller,
              hintText: 'Write monthly price for your tuition..',
            ),
            SizedBox(height: 16.h),
            Text(
              'Which day of the week is the class on?',
              style: TextStyle(
                color: Appgradient.TextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            Simpletextfield(
              controller: classcreatecontroller.dayofweekcontroller,
              hintText: 'Write day of the week...',
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
