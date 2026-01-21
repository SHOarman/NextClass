import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSuperButton extends StatelessWidget {
  final VoidCallback? clear;
  final String text;
  final VoidCallback onTap;

  final Color? bgColor;
  final LinearGradient? bgGradient;

  final Color? textColor;
  final LinearGradient? textGradient;

  final double? height;
  final double? width;

  final double fontSize;
  final FontWeight fontWeight;
  final Color? borderColor;
  final bool isLoading;

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
    this.fontWeight = FontWeight.bold,
    this.borderColor,
    this.clear,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading
          ? null
          : () {
        onTap();
        clear?.call();
      },
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
        child: isLoading
            ? SizedBox(
          height: 24.h,
          width: 24.h,
          child: CircularProgressIndicator(
            color: textColor ?? Colors.white,
            strokeWidth: 2.5,
          ),
        )
            : textGradient == null
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
