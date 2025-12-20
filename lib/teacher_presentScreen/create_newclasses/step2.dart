import 'package:first_project/Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart';
import 'package:first_project/core/route/Genaral_Controler/Genaral_Controler.dart';
import 'package:first_project/unity/appColors/appGradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Parent_parsentScreen/widget/coustomcard/coustomcard.dart';

class Step2 extends StatelessWidget {
  const Step2({super.key});

  @override
  Widget build(BuildContext context) {
    final GenaralControler selectype = Get.put(GenaralControler());
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),

          Text(
            'Select class type',
            style: TextStyle(
              color: Appgradient.TextColor,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 16.h),

          Row(
            children: [
              Expanded(
                child: Obx(
                  () => Padding(
                    padding:  EdgeInsets.only(left: 10.sp),
                    child: CustomCard(
                      title: "Tuition",
                      selected: selectype.selectedCard.value == "Tuition",
                      onTap: () {
                        selectype.selectedCard("Tuition");
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: 4.w),

              Expanded(
                child: Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(left: 00),
                    child: CustomCard(
                      title: "Enrichment class",
                      selected:
                          selectype.selectedCard.value == "Enrichment class",
                      onTap: () {
                        selectype.selectedCard("Enrichment class");
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          Text(
            'Your class level.',
            style: TextStyle(
              color: Appgradient.TextColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 40.h),
          Simpletextfield(controller: controller, hintText: 'ex: class 1-4'),
        ],
      ),
    );
  }
}
