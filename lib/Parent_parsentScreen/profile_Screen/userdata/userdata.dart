import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_project/core/route/route.dart'; // Check your path
import 'package:first_project/Parent_parsentScreen/profile_Screen/profileController/profileController.dart'; // Check path
import '../../../Services/api_Services/api_Services.dart'; // Import ApiServices needed for baseUrl

class Userdata extends StatelessWidget {
  const Userdata({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject Controller
    final profilecontroller = Get.put(Profilecontroller());

    return GestureDetector(
      onTap: () {
        // Load data before going to edit page
        profilecontroller.loadCurrentData();
        Get.toNamed(AppRoute.editprofile);
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
            /// ===== 1. Profile Image Section =====
            Positioned(
              top: 20,
              left: 20,
              width: 56,
              height: 56,
              child: Obx(() {
                // CASE 1: User picked a new image from gallery (Local File)
                if (profilecontroller.hasImage) {
                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(
                      File(profilecontroller.pickedImage.value!.path),
                    ),
                  );
                }
                // CASE 2: Image exists on Server (Network Image)
                else if (profilecontroller.profileImgUrl.value.isNotEmpty) {

                  // Construct full URL if needed
                  String imgUrl = profilecontroller.profileImgUrl.value;
                  if (!imgUrl.startsWith('http')) {
                    imgUrl = "${ApiServices.baseUrl}$imgUrl";
                  }

                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(imgUrl),
                    // Optional: Handle loading/error
                    onBackgroundImageError: (_, __) {
                      print("Error loading image: $imgUrl");
                    },
                  );
                }
                // CASE 3: No Image (Default Asset)
                else {
                  return const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/backround/profile.png'),
                  );
                }
              }),
            ),

            /// ===== 2. User Name Section =====
            Positioned(
              left: 100,
              top: 26,
              child: Obx(() => Text(
                profilecontroller.fullName.value,
                style: const TextStyle(color: Color(0xff2563EB), fontSize: 18),
              )),
            ),

            /// ===== 3. Email Section =====
            Positioned(
              left: 100,
              top: 54,
              child: Obx(() => Text(
                profilecontroller.email.value,
                style: const TextStyle(color: Color(0xff888888), fontSize: 14),
              )),
            ),
          ],
        ),
      ),
    );
  }
}