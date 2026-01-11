import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Parent_parsentScreen/profile_Screen/profileController/profileController.dart';
import '../../../../Services/api_Services/api_Services.dart';

class customProfilesecationteacher extends StatelessWidget {
  const customProfilesecationteacher({super.key});

  @override
  Widget build(BuildContext context) {
    final Profilecontroller controller = Get.put(Profilecontroller());

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.myprofile2);
              },

              /// ===== ✅ 2. SERVER IMAGE LOGIC =====
              child: Obx(() {
                String imgUrl = controller.profileImgUrl.value;

                // 🔍 DEBUG PRINT: কনসোলে চেক করুন URL ঠিক আছে কিনা
                print("SERVER RAW URL: $imgUrl");

                if (imgUrl.isNotEmpty && !imgUrl.startsWith('http')) {
                  // স্ল্যাশ চেক করা হচ্ছে
                  if (!imgUrl.startsWith('/')) {
                    imgUrl = "/$imgUrl";
                  }
                  imgUrl = "${ApiServices.baseUrl}$imgUrl";
                }

                // 🔍 DEBUG PRINT: ফাইনাল URL চেক করুন
                print("FINAL IMAGE URL: $imgUrl");

                return Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (imgUrl.isNotEmpty)
                          ? NetworkImage(imgUrl)
                          : const AssetImage('assets/backround/Rectangle 5040.png')
                      as ImageProvider,
                      // যদি নেটওয়ার্ক ইমেজ লোড হতে সমস্যা হয়, কনসোলে এরর দেখাবে
                      onError: (exception, stackTrace) {
                        print("❌ Image Load Error: $exception");
                      },
                    ),
                  ),
                );
              }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ===== ✅ 3. NAME =====
                  Obx(() => Text(
                    'Hi, ${controller.fullName.value}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff121212),
                    ),
                    overflow: TextOverflow.ellipsis,
                  )),

                  const SizedBox(height: 8),

                  const Text(
                    'Los Angles, Street 2/A, USA',
                    style: TextStyle(color: Color(0xff2B2B2B), fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}