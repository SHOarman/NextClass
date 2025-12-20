import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSuperButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  // Background Color OR Gradient
  final Color? bgColor;
  final LinearGradient? bgGradient;

  // Text Color OR Text Gradient
  final Color? textColor;
  final LinearGradient? textGradient;

  // Size control
  final double? height;
  final double? width;

  final double fontSize;
  final FontWeight fontWeight;
  final Color? borderColor;


  const CustomSuperButton({
    super.key,
    required this.text,
    required this.onTap,

    this.bgColor,
    this.bgGradient,

    this.textColor,
    this.textGradient,

    this.height,
    this.width,

    this.fontSize = 18,
    this.fontWeight = FontWeight.bold, this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        height: height ?? 54.h,
        width: width ?? double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          color: bgGradient == null ? bgColor ?? Colors.white : null,
          gradient: bgGradient,
          borderRadius: BorderRadius.circular(8.r),
        ),


        alignment: Alignment.center,
        child: textGradient == null
            ? Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: textColor ?? Colors.white,
                ),
              )
            : ShaderMask(
                shaderCallback: (bounds) => textGradient!.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
