import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_project/core/route/route.dart';
// ✅ Import Controller and Services
import '../../../Parent_parsentScreen/profile_Screen/profileController/profileController.dart';
import '../../../Services/api_Services/api_Services.dart';

class UserdataTecher extends StatelessWidget {
  const UserdataTecher({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ 1. Controller Initialize
    final Profilecontroller controller = Get.put(Profilecontroller());

    return GestureDetector(
      onTap: () {
        print('Edit Profile Tapped');
        controller.loadCurrentData();
        Get.toNamed(AppRoute.editprofileteacher);
      },
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xffF3F5F9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [

            /// ===== ✅ 2. Dynamic Profile Image =====
            Positioned(
              top: 20,
              left: 20,
              width: 56,
              height: 56,
              child: Obx(() {
                ImageProvider imageProvider;

                if (controller.hasImage) {
                  imageProvider = FileImage(File(controller.pickedImage.value!.path));
                } else if (controller.profileImgUrl.value.isNotEmpty) {
                  String imgUrl = controller.profileImgUrl.value;
                  if (!imgUrl.startsWith('http')) {
                    imgUrl = "${ApiServices.baseUrl}$imgUrl";
                  }
                  imageProvider = NetworkImage(imgUrl);
                } else {
                  imageProvider = const AssetImage('assets/backround/profile.png');
                }

                return CircleAvatar(
                  radius: 28, // width 56 / 2
                  backgroundImage: imageProvider,
                  backgroundColor: Colors.grey[200],
                );
              }),
            ),

            /// ===== ✅ 3. Dynamic Name =====
            Positioned(
              left: 100,
              top: 26,
              child: Obx(() => Text(
                controller.fullName.value, // Controller থেকে নাম
                style: const TextStyle(color: Color(0xff2563EB), fontSize: 18),
              )),
            ),


            /// ===== ✅ 4. Dynamic Email =====
            Positioned(
              left: 100,
              top: 54,
              child: Obx(() => Text(
                controller.email.value, // Controller থেকে ইমেইল
                style: const TextStyle(color: Color(0xff888888), fontSize: 14),
              )),
            ),
          ],
        ),
      ),
    );
  }
}