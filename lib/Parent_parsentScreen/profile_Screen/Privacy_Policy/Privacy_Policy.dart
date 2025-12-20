import 'package:first_project/Parent_parsentScreen/widget/backSleash/backSleash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BackSlashButton(onTap: (){
                  Get.back();




                }),
              ),
              Row(
                children: [

                  SizedBox(height: 30,),
                  SvgPicture.asset('assets/icon/terms-conditions_10703108 1.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Color(0xff2B2B2B),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text('Updated July 17, 2025'),
              ),
              SizedBox(height: 20.h),
              Text(
                '1 . Introduction',
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),
              SizedBox(height: 8.h),
              Text(
                'Lorem ipsum dolor sit amet consectetur. Volutpat purus nunc tellus lorem adipiscing. Convallis at mi dictumst nulla amet. Ipsum consequat vel donec ut amet ante semper. Amet tempus tellus aliquam volutpat enim dolor tristique.',style: TextStyle(fontSize: 14,color: Color(0xffA4A4A4)),

              ),

              SizedBox(height: 24.h),
              Text(
                '2 . Information We Collect',
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),
              SizedBox(height: 8.h),

              Text(
                'Lorem ipsum dolor sit amet consectetur. Volutpat purus nunc tellus lorem adipiscing. Convallis at mi dictumst nulla amet. Ipsum consequat vel donec ut amet ante semper. Amet tempus tellus aliquam volutpat enim dolor tristique.',style: TextStyle(fontSize: 14,color: Color(0xffA4A4A4)),

              ),

              SizedBox(height: 24.h),
              Text(
                '3 . Data Security',
                style: TextStyle(color: Color(0xff2B2B2B), fontSize: 16),
              ),
              SizedBox(height: 8.h),

              Text(
                'Lorem ipsum dolor sit amet consectetur. Volutpat purus nunc tellus lorem adipiscing. Convallis at mi dictumst nulla amet. Ipsum consequat vel donec ut amet ante semper. Amet tempus tellus aliquam volutpat enim dolor tristique.',style: TextStyle(fontSize: 14,color: Color(0xffA4A4A4)),

              ),


            ],
          ),
        ),
      ),
    );
  }
}
