import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Services/Controller_view/CreateaClass.dart'; // Ensure this path is correct
import '../techerall_widget/customcard/customcard.dart'; // Import your CustomCardnew

class Activepage extends StatelessWidget {
  const Activepage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Initialize or find the Controller
    final ClassesController controller = Get.put(ClassesController());

    return Scaffold(

      body: Obx(() {
        // 2. Show Loading Indicator while fetching data
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // 3. Show message if the active list is empty
        if (controller.activeList.isEmpty) {
          return Center(
            child: Text(
              "No active classes found",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          );
        }

        // 4. Build the list using CustomCardnew
        return ListView.builder(
          padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
          itemCount: controller.activeList.length,
          itemBuilder: (context, index) {

            // Get data for the current item
            var item = controller.activeList[index];
            var props = item.properties;

            // Extract values safely
            String subject = props?.subject ?? "Untitled Subject";
            String level = props?.level != null ? "Class ${props!.level}" : "N/A";

            // Determine if it's Group or Individual
            bool isGroup = props?.isGroupClass ?? false;
            String groupStatus = isGroup ? "Group Class" : "Individual Class";

            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: CustomCardnew(
                title: subject,       // e.g., Mathematics
                subtitle: level,      // e.g., Class 6-10
                iconName: groupStatus, // e.g., Group Class
                onTap: () {
                  // ✅ Handle Tap Event
                  print("Clicked on: $subject");
                  // Get.to(() => ClassDetailsPage(item: item));
                },
              ),
            );
          },
        );
      }),
    );
  }
}