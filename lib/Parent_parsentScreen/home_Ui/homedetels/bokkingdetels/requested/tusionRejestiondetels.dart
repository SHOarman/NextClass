import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../unity/appColors/appGradient.dart';
import '../../../../widget/backSleash/backSleash.dart';
import '../../../../widget/coustom_button/coustom_button.dart';

class Tusionrejestiondetels extends StatefulWidget {
  const Tusionrejestiondetels({super.key});

  @override
  State<Tusionrejestiondetels> createState() => _Tusionrejestiondetels();
}

class _Tusionrejestiondetels extends State<Tusionrejestiondetels> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== Top Row: Back + Favorite
            SizedBox(height: 100.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackSlashButton(
                  onTap: () {
                    Get.back();
                  },
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : const Color(0xff2B2B2B),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// ===== Tutor Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/backround/Frame 91.png',
                  width: 200.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 12.h),

            /// ===== View Tutor Profile Button
            Center(
              child: Container(
                height: 32.h,
                width: 160.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffDBDBDB),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () {
                    // Button action
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Center(
                    child: Text(
                      'View Tutor Profile',
                      style: TextStyle(
                        color: const Color(0xff2563EB),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            /// ===== Tutor Name + Rating Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tutor Name',
                  style: TextStyle(
                    color: const Color(0xff2B2B2B),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: const Color(0xffFFC107),
                      size: 20.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '4.5',
                      style: TextStyle(
                        color: const Color(0xff2B2B2B),
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 16.h),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Urna massa mi tellus in sed ullamcorper tortor. Sit sed lorem in dictum. Maecenas elit est metus amet magna. Pretium sed vitae sit posuere. ',
              style: TextStyle(color: Color(0xff888888), fontSize: 16),
            ),

            SizedBox(height: 16.h),

            Text(
              'Mathematics',
              style: TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Class 1-4',
              style: TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Group class',
              style: TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Start from 02 January, 2026',
              style: TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              '21/2 St road, Los Angles, USA',
              style: TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 24.h),

            Text(
              '\$560.00/monthly',
              style: TextStyle(
                color: Color(0xff2563EB),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 62.h),




            CustomSuperButton(

              bgGradient: Appgradient.primaryGradient,
              text: 'Chat with tutor',
              onTap: () {

                Get.toNamed(AppRoute.chatconation_teacher);
              },
              textColor: Colors.white,
              borderColor: Appgradient.primaryGradient.colors[0],
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
