import 'dart:async';

import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({super.key});

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () => Get.toNamed(AppRoute.onloding));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2563EB),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/backround/newlogu.png",
              width: 164,
              height: 130,
            ),
          ),
          Positioned(
            //
            top: 120,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Text(
                'NextClass',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
