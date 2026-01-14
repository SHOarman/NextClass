import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../home_ui/homeController.dart';

class Pendingcustomcard extends StatelessWidget {
  const Pendingcustomcard({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Container(
      height: 90.h,
      width: 400.w,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(182, 126, 255, 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Stack(
        children: [
          SizedBox(height: 16.h),

          // --- Label Text ---
          Positioned(
            top: 10,
            left: 10,
            child: const Text(
              'Pending request',
              style: TextStyle(
                color: Color(0xff888888),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),

          // --- Dynamic Count Number ---
          Positioned(
            top: 40,
            left: 20,
            child: Obx(
              () => Text(
                '${controller.pendingRequestCount.value}',
                style: const TextStyle(
                  color: Color(0xff2B2B2B),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // --- Icon ---
          Positioned(
            top: 20,
            right: 20,
            height: 60.h,
            width: 60.w,
            child: CircleAvatar(
              radius: 22.5,
              backgroundColor: const Color(0xffF8FBFF),
              child: Center(child: SvgPicture.asset('assets/icon/pending.svg')),
            ),
          ),
        ],
      ),
    );
  }
}
