import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Pendingcustomcard extends StatelessWidget {
  const Pendingcustomcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 400.w,
      decoration: BoxDecoration(
        color: Color.fromRGBO(182, 126, 255, 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Stack(
        children: [
          SizedBox(height: 16.h),
          Positioned(
            top: 10,
            left: 10,

            child: Text(
              'Pending request',
              style: TextStyle(
                color: Color(0xff888888),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 20,
            child: Text(
              '16',
              style: TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Positioned(
            top: 20,
            right: 20,
            height: 60.h,
            width: 60.w,
            child: CircleAvatar(
              radius: 22.5,
              backgroundColor: Color(0xffF8FBFF),
              child: Center(child: SvgPicture.asset('assets/icon/pending.svg')),
            ),
          ),
        ],
      ),
    );
  }
}
