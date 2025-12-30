import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TecherallWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String svgPath;
  final Function(String)? onChanged;

  // 🔹 Added these two new fields
  final VoidCallback? onIconTap;
  final bool readOnly;

  const TecherallWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.svgPath,
    this.onChanged,

    // 🔹 Initialize them here
    this.onIconTap,
    this.readOnly = false, // Default is false so you can type normally if needed
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,

      // 🔹 Use readOnly here (Prevents keyboard from opening if true)
      readOnly: readOnly,

      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF3F5F9),

        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffA4A7AE), fontSize: 14),

        suffixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: InkWell(
            // 🔹 Logic: If onIconTap is passed, use it. Otherwise, default to clearing text.
              onTap: onIconTap ?? () {
                controller.clear();
                if (onChanged != null) onChanged!(""); // Notify parent if cleared
              },
              child: SvgPicture.asset(svgPath, height: 20, width: 20)),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}