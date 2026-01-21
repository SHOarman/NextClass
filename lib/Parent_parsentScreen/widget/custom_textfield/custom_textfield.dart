import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../../unity/app_colors/app_gradient.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? iconPath;
  final bool enableValidation;
  final RegExp? regex;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.iconPath,
    this.enableValidation = false,
    this.regex,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool isTyping = false;
  String? errorMsg;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    widget.controller.addListener(_onControllerChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    widget.controller.removeListener(_onControllerChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (mounted) {
      setState(() {});
    }
  }

  void _onControllerChange() {
    if (mounted) {
      isTyping = widget.controller.text.isNotEmpty;
      _validateField(widget.controller.text);
      setState(() {});
    }
  }

  void _validateField(String value) {
    if (!widget.enableValidation) {
      errorMsg = null; // no validation
      return;
    }

    if (value.isEmpty) {
      errorMsg = "Field is required";
      return;
    }

    if (widget.regex != null && !widget.regex!.hasMatch(value)) {
      errorMsg = widget.errorMessage ?? "Invalid input";
    } else {
      errorMsg = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color fillColor = Color(0xFFF3F5F9);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _focusNode.hasFocus
                ? [
                    BoxShadow(
                      color: Appgradient.pramary1.withValues(alpha: 0.7),
                      blurRadius: 8,
                      offset: const Offset(-4, 0),
                      spreadRadius: 0.3,
                    ),
                  ]
                : [],
          ),
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: fillColor,
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Color(0xff8B95A8)),
              prefixIcon: widget.iconPath != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SvgPicture.asset(
                        widget.iconPath!,
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                          isTyping || _focusNode.hasFocus
                              ? Appgradient.pramary1
                              : const Color(0xff8B95A8),
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                  : null,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              suffixIcon: widget.suffixIcon,
            ),
            validator: (value) {
              _validateField(value ?? "");
              return null;
            },
          ),
        ),
        const SizedBox(height: 6),
        if (errorMsg != null)
          Text(
            errorMsg!,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
      ],
    );
  }
}

//=============================password==========================

// Add your other imports (AppColors, AppGradient, etc.) here

class CustomPasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String iconPath;
  final bool enableValidation;
  final RegExp? regex;
  final String? errorMessage;

  const CustomPasswordFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.iconPath,
    this.enableValidation = false,
    this.regex,
    this.errorMessage,
  });

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  // State variables
  bool _obscureText = true;
  bool isTyping = false;
  String? errorMsg;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // 1. Add listeners securely
    _focusNode.addListener(_onFocusChange);
    widget.controller.addListener(_onControllerChange);
  }

  void _onFocusChange() {
    if (mounted) {
      setState(() {});
    }
  }

  void _onControllerChange() {
    if (mounted) {
      setState(() {
        isTyping = widget.controller.text.isNotEmpty;
        _validateField(widget.controller.text);
      });
    }
  }

  @override
  void dispose() {
    // Remove listeners to stop memory leaks and "setState after dispose" errors
    _focusNode.removeListener(_onFocusChange);
    widget.controller.removeListener(_onControllerChange);

    // Dispose local focus node
    _focusNode.dispose();
    super.dispose();
  }

  void _validateField(String value) {
    if (!widget.enableValidation) {
      errorMsg = null;
      return;
    }

    if (value.isEmpty) {
      errorMsg = "Password cannot be empty";
      return;
    }

    if (widget.regex != null && !widget.regex!.hasMatch(value)) {
      errorMsg = widget.errorMessage ?? "Invalid password";
    } else {
      errorMsg = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color fillColor = Color(0xFFF3F5F9);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _focusNode.hasFocus
                ? [
                    BoxShadow(
                      color: Appgradient.pramary1.withValues(alpha: 0.7),
                      blurRadius: 8,
                      offset: const Offset(-4, 0),
                      spreadRadius: 0.3,
                    ),
                  ]
                : [],
          ),
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            keyboardType: TextInputType.text,
            obscureText: _obscureText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              // We are using custom error text below, so we return null here
              // to prevent the default error line from showing up
              _validateField(value ?? "");
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: fillColor,
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Color(0xff8B95A8)),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SvgPicture.asset(
                  widget.iconPath,
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    isTyping || _focusNode.hasFocus
                        ? Appgradient.pramary1
                        : const Color(0xff8B95A8),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Appgradient.pramary1,
                ),
                onPressed: () {
                  if (mounted) {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        // Error Message Display
        if (errorMsg != null)
          Text(
            errorMsg!,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
      ],
    );
  }
}

//=====================simple customn card===================================================

class SimpleCard extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool prefixicon;

  const SimpleCard({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixicon = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixicon
            ? const Icon(Icons.search, color: Colors.grey)
            : null,

        filled: true,

        fillColor: Color.fromRGBO(243, 245, 249, 1),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

//=============coustom descripon=========================

class Customdetesl extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const Customdetesl({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 5,

      decoration: InputDecoration(
        filled: true,

        fillColor: Color(0xffF3F5F9),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class Simpletextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const Simpletextfield({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        filled: true,

        fillColor: Color(0xffF3F5F9),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
