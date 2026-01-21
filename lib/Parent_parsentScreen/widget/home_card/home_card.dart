import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../unity/app_colors/app_gradient.dart';

class Homecard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String iconname;

  const Homecard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.iconname,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background Card
        Container(
          height: 180.h,
          width: 400.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Color(0xFF9116C2), Color(0xFF450B5C)],
            ),
          ),
        ),

        /// Text: Title
        Positioned(
          top: 20,
          left: 20,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),

        /// Text: Subtitle
        Positioned(
          top: 50,
          left: 20,
          child: Text(
            subtitle,
            style: TextStyle(color: Color(0x99FFFFFF), fontSize: 12),
          ),
        ),

        /// Explore Button
        Positioned(
          bottom: 18,
          left: 15,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.expadedpage);
            },
            child: Container(
              height: 35,
              width: 144,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  8,
                ), // optional rounded corners
              ),
              child: Center(
                child: Text(
                  iconname,
                  style: TextStyle(
                    fontSize: 16,
                    foreground: Paint()
                      ..shader = Appgradient.primaryGradient.createShader(
                        Rect.fromLTWH(0.0, 0.0, 144.0, 35.0),
                      ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: -5,
          top: 0,
          bottom: -15,

          child: Image.asset(imagePath),
        ),
      ],
    );
  }
}
