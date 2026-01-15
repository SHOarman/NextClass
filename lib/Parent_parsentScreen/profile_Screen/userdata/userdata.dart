import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_project/core/route/route.dart'; // Check your path
import 'package:first_project/Parent_parsentScreen/profile_Screen/profileController/profile_controller.dart'; // Check path
import '../../../Services/api_Services/api_services.dart'; // Import ApiServices needed for baseUrl

class Userdata extends StatelessWidget {
  const Userdata({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject controller
    final profileController = Get.put(ProfileController());

    return GestureDetector(
      onTap: () {
        // Load data before going to edit page
        profileController.loadCurrentData();
        Get.toNamed(AppRoute.editProfile);
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
                if (profileController.hasImage) {
                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(
                      File(profileController.pickedImage.value!.path),
                    ),
                  );
                }
                // CASE 2: Image exists on Server (Network Image)
                else if (profileController.profileImgUrl.value.isNotEmpty) {
                  // Construct full URL if needed
                  String imgUrl = profileController.profileImgUrl.value;
                  if (!imgUrl.startsWith('http')) {
                    imgUrl = "${ApiServices.baseUrl}$imgUrl";
                  }

                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(imgUrl),
                    // Optional: Handle loading/error
                    onBackgroundImageError: (exception, stackTrace) {
                      // print("Error loading image: $imgUrl");
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
              child: Obx(
                () => Text(
                  profileController.fullName.value,
                  style: TextStyle(
                    color: Color(0xff2563EB),
                    fontSize: 18,
                    shadows: [
                      Shadow(
                        color: Color(0xff000000).withValues(alpha: 0.12),
                        blurRadius: 19,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ===== 3. email Section =====
            Positioned(
              left: 100,
              top: 54,
              child: Obx(
                () => Text(
                  profileController.email.value,
                  style: const TextStyle(
                    color: Color(0xff888888),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
