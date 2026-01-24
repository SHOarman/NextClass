import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Parent_parsentScreen/profile_Screen/profileController/profile_controller.dart';
import '../../../../Services/api_Services/api_Services.dart';
import '../../../../core/route/route.dart';

class CustomProfileSectionTeacher extends StatelessWidget {
  const CustomProfileSectionTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    // ================= CONTROLLER =================
    // Get the existing ProfileController instance for reactive data
    final ProfileController controller = Get.put(ProfileController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ================= PROFILE IMAGE =================
          GestureDetector(
            onTap: () => Get.toNamed(AppRoute.myprofile2), // Navigate to profile screen
            child: Obx(() {
              String imgUrl = controller.profileImgUrl.value;

              // ================= SERVER IMAGE LOGIC =================
              // If URL is relative, prepend base API URL
              if (imgUrl.isNotEmpty && !imgUrl.startsWith('http')) {
                imgUrl =
                "${ApiServices.baseUrl}${imgUrl.startsWith('/') ? '' : '/'}$imgUrl";
              }

              return Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    // Show network image if available, else fallback to asset
                    image: imgUrl.isNotEmpty
                        ? NetworkImage(imgUrl)
                        : const AssetImage('assets/backround/Rectangle 5040.png')
                    as ImageProvider,
                  ),
                ),
              );
            }),
          ),

          // ================= PROFILE TEXT =================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Teacher's name (reactive)
                  Obx(() => Text(
                    'Hi, ${controller.fullName.value}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  )),
                  const SizedBox(height: 4),
                  // Teacher's address or location (reactive)
                  Obx(() => Text(
                    controller.address.value.isEmpty
                        ? 'Location not set'
                        : controller.address.value,
                    style: const TextStyle(
                        color: Color(0xff2B2B2B), fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
