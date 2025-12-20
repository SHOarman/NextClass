import 'package:first_project/Parent_parsentScreen/widget/backSleash/backSleash.dart';
import 'package:first_project/Parent_parsentScreen/widget/coustom_Textfield/coustom_Textfield.dart'
    show SimpleCard;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart'
    show GetNavigation;

import 'bokkingWidget/Tuitiondetails.dart';
import 'bokkingWidget/bokingtabbar.dart' show Bokingtabbar;

class BokingDetelsscreen extends StatefulWidget {
  const BokingDetelsscreen({super.key});

  @override
  State<BokingDetelsscreen> createState() => _BokingDetelsscreenState();
}

class _BokingDetelsscreenState extends State<BokingDetelsscreen> {
  late final TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose(); // ✅ IMPORTANT
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 100),

              BackSlashButton(
                onTap: () {
                  Get.back();
                },
              ),

              SizedBox(height: 40.h),

              SimpleCard(
                controller: nameController,
                hintText: 'Search by name',
                prefixicon: true,
              ),

              SizedBox(height: 20.h),

              /// Tuition details
              const Tuitiondetails(
                title: 'Tuition details',
                title2: 'Mathematics',
                title3: '\$560.00',
                title4: 'Group class',
                title1: 'Class 1-4',
              ),

              SizedBox(height: 32.h),

              /// Booking tab bar
              const Bokingtabbar(),
            ],
          ),
        ),
      ),
    );
  }
}
