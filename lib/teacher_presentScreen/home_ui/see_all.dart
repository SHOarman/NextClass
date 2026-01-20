import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Parent_parsentScreen/widget/back_slash/back_slash.dart';
import '../../Services/Controller_view/create_a_class.dart';
import '../techerall_widget/customcard/customcard.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the controller (ClassController) to get active classes
    final ClassesController controller = Get.put(ClassesController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove default back button
        title: const Text(
          "All Active Classes",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        // Show loader while fetching data
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Show message if no active classes are available
        if (controller.activeList.isEmpty) {
          return const Center(child: Text("No active classes available"));
        }

        // Display all active classes in a scrollable list
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          physics: const BouncingScrollPhysics(), // Smooth scrolling
          itemCount: controller.activeList.length + 1, // +1 for top Back button
          itemBuilder: (context, index) {
            // First index reserved for Back button
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackSlashButton(onTap: () => Get.back()), // Custom back button
                  SizedBox(height: 20.h),
                ],
              );
            }

            // Remaining indices show the class cards
            var item = controller.activeList[index - 1];
            var props = item.properties;

            // Extract class details safely
            String subject = props?.subject ?? "N/A";
            String level =
            props?.level != null ? "Class ${props!.level}" : "N/A";
            bool isGroup = props?.isGroupClass ?? false;
            String groupStatus = isGroup ? "Group Class" : "Individual Class";

            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: CustomCardnew(
                title: subject,
                subtitle: level,
                iconName: groupStatus,
                onTap: () {


                },
              ),
            );
          },
        );
      }),
    );
  }
}
