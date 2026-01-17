import 'package:first_project/Parent_parsentScreen/widget/back_slash/back_slash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Import your Controller and CustomCard
import 'package:first_project/Services/Controller_view/create_a_class.dart';
import '../techerall_widget/customcard/customcard.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    final ClassesController controller = Get.find<ClassesController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // 1. This removes the default back arrow
        automaticallyImplyLeading: false,

        title: const Text(
          "All Active Classes",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true, // Optional: Centers the title since there is no back button
        backgroundColor: Colors.white,
        elevation: 0,
      ),




      body: Column(

        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BackSlashButton(onTap: (){
              Get.back();


            }),
          ),
          SizedBox(height: 30,),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.activeList.isEmpty) {
              return const Center(child: Text("No active classes available"));
            }

            return SingleChildScrollView(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.activeList.length,
                itemBuilder: (context, index) {
                  var item = controller.activeList[index];
                  var props = item.properties;

                  String subject = props?.subject ?? "N/A";
                  String level = props?.level != null ? "Class ${props!.level}" : "N/A";
                  bool isGroup = props?.isGroupClass ?? false;
                  String groupStatus = isGroup ? "Group Class" : "Individual Class";

                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: CustomCardnew(
                      title: subject,
                      subtitle: level,
                      iconName: groupStatus,
                      onTap: () {
                        // Navigate logic
                      },
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}