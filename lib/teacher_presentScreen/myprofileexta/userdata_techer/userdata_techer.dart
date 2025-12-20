import 'package:first_project/core/route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserdataTecher extends StatelessWidget {
  const UserdataTecher({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('nijiopj');
        Get.toNamed(AppRoute.editprofileteacher);
      },
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xffF3F5F9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              width: 56,
              height: 56,
              child: CircleAvatar(
                child: Image.asset('assets/backround/profile.png'),
              ),
            ),
            Positioned(
              left: 100,
              top: 26,
              child: Text(
                'User Name',
                style: TextStyle(color: Color(0xff2563EB), fontSize: 18),
              ),
            ),

            Positioned(
              left: 100,
              top: 26,
              child: Text(
                'User Name',
                style: TextStyle(color: Color(0xff2563EB), fontSize: 18),
              ),
            ),

            Positioned(
              left: 100,
              top: 54,
              child: Text(
                'userexample@gmail.come',
                style: TextStyle(color: Color(0xff888888), fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
