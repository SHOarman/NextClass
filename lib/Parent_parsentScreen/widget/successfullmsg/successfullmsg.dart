import 'package:first_project/Parent_parsentScreen/widget/coustom_button/coustom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Successfullmsg extends StatelessWidget {
  final String name;
  final String namedetels;

  final String bu_name1;
  final Function ontap1;

  final String bu_name2;
  final Function ontap2;

  const Successfullmsg({
    super.key,
    required this.name,
    required this.namedetels,
    required this.bu_name1,
    required this.ontap1,
    required this.bu_name2,
    required this.ontap2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 448,
        width: 392,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            SizedBox(height: 150.h),

            Center(child: Text(name)),
            SizedBox(height: 8.h),
            Text(namedetels),

            SizedBox(height: 40.h),

            CustomSuperButton(
              text: bu_name1,
              onTap: () {
                ontap1();
              },
            ),
            SizedBox(height: 16.h),

            CustomSuperButton(
              text: bu_name2,
              onTap: () {
                ontap2();
              },
            ),
          ],
        ),
      ),
    );
  }
}


