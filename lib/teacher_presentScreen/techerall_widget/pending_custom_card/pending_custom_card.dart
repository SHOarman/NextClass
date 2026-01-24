import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../home_ui/home_controller.dart';

class Pendingcustomcard extends StatelessWidget {
  const Pendingcustomcard({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeController টি খুঁজে নেওয়া (Get.find ব্যবহার করা হয়েছে যাতে ডুপ্লিকেট না হয়)
    final HomeController controller = Get.put(HomeController());

    return Container(
      height: 95.h,
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xffB67EFF).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: const Color(0xffB67EFF).withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // শিরোনাম
          Positioned(
            top: 18.h,
            left: 20.w,
            child: Text(
              'Pending request',
              style: TextStyle(
                color: const Color(0xff888888),
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
            ),
          ),

          // ডাইনামিক কাউন্ট
          Positioned(
            bottom: 15.h,
            left: 20.w,
            child: Obx(
              () => Text(
                '${controller.pendingRequestCount.value}',
                style: TextStyle(
                  color: const Color(0xff2B2B2B),
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // সার্কেল আইকন
          Positioned(
            right: 20.w,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                height: 55.h,
                width: 55.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(14.r),
                  child: SvgPicture.asset(
                    'assets/icon/pending.svg',
                    placeholderBuilder: (context) =>
                        const CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
