import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildRoleCard({
  required String title,
  required String description,
  required bool selected,
  required VoidCallback onTap,
}) {
  return Container(

    width: double.infinity,
    padding: EdgeInsets.all(16.w.h),
    decoration: BoxDecoration(

      color: selected ? Color(0xffFFFFFF) : Colors.white54,
      borderRadius: BorderRadius.circular(16.r),
      //   border: Border.all(
      //       color: selected ? Colors.blue : Color(0xffFFFFFF),),
      // ),
    ),
    child: GestureDetector(
      onTap: (){
        onTap();
      },
      child: Row(
        children: [
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: selected ? Colors.blue : Colors.grey,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
