import 'dart:io';

import 'package:first_project/Parent_parsentScreen/profile_Screen/profileController/profileController.dart';
import 'package:first_project/core/route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Userdata extends StatelessWidget {
  const Userdata({super.key});

  @override
  Widget build(BuildContext context) {
    // FIX 1: Use Get.put to load the controller immediately
    final profilecontroller = Get.put(Profilecontroller());

    return GestureDetector(
      onTap: () {
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
            Positioned(
              top: 20,
              left: 20,
              width: 56,
              height: 56,
              child: Obx(() {
                return CircleAvatar(
                  radius: 50,
                  backgroundImage: profilecontroller.hasImage
                      ? FileImage(
                          File(profilecontroller.pickedImage.value!.path),
                        )
                      : const AssetImage('assets/backround/profile.png')
                            as ImageProvider,
                );
              }),
            ),
            Positioned(
              left: 100,
              top: 26,
              child: Text(
                'User Name',
                style: TextStyle(color: Color(0xff2563EB), fontSize: 18),
              ),
            ),

            // FIX 4: Removed duplicate 'User Name' widget here
            Positioned(
              left: 100,
              top: 54,
              child: Text(
                'userexample@gmail.com', // Fixed typo .come -> .com
                style: TextStyle(color: Color(0xff888888), fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
