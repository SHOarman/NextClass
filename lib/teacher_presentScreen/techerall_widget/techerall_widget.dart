import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TecherallWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String svgPath;
  final Function(String)? onChanged; // 🔹 Added onChanged

  const TecherallWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.svgPath,
    this.onChanged, // 🔹 Constructor support
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      // 🔹 Now onChanged works
      onChanged: onChanged,

      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF3F5F9),

        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffA4A7AE), fontSize: 14),

        suffixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(svgPath, height: 20, width: 20),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
