import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Services/Controller_view/CreateaClass.dart'; // Ensure this path is correct
import '../techerall_widget/customcard/customcard.dart'; // Import your CustomCardnew

class InactivePage extends StatelessWidget {
  const InactivePage({super.key});

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

        // 3. Show message if the inactive list is empty
        if (controller.inactiveList.isEmpty) {
          return Center(
            child: Text(
              "No inactive classes found",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          );
        }

        // 4. Build the list using CustomCardnew
        return ListView.builder(
          padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
          itemCount: controller.inactiveList.length,
          itemBuilder: (context, index) {

            // Get data for the specific item
            var item = controller.inactiveList[index];
            var props = item.properties;

            // ================= Extract Data =================

            // Get Subject Name (e.g., Mathematics)
            String subject = props?.subject ?? "Untitled Subject";

            // Get Class Level (e.g., Class 6-10)
            String level = props?.level != null ? "Class ${props!.level}" : "N/A";

            // Determine Group vs Individual status
            bool isGroup = props?.isGroupClass ?? false;
            String groupStatus = isGroup ? "Group Class" : "Individual Class";

            // ================= Card UI Design =================
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: CustomCardnew(
                title: subject,
                subtitle: level,
                iconName: groupStatus,
                onTap: () {
                  // ✅ Handle Tap Event
                  print("Clicked on inactive class: $subject");
                },
              ),
            );
          },
        );
      }),
    );
  }
}