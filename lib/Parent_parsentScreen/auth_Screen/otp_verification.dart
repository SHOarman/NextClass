


import 'package:first_project/core/route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  // রং ডিফাইন করা হলো
  final Color primaryBlue = const Color(0xFF2563EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( // কি-বোর্ড ওপেন হলে যাতে এরর না দেয়
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),

                // Title
                Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                  ),
                ),
                const SizedBox(height: 16),

                // Subtitle
                const Text(
                  'Enter the 6 digit OTP sent to your email address.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),

                // Label "Email"
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // OTP Input Fields (Clickable & Functional)
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ৬টি ইনপুট ফিল্ড তৈরি করা হলো
                      _buildOtpField(context, first: true),
                      _buildOtpField(context),
                      _buildOtpField(context),
                      _buildOtpField(context),
                      _buildOtpField(context),
                      _buildOtpField(context, last: true),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // "Send again" Link
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      print("Resend Clicked");
                    },
                    child: Text(
                      'Send again',
                      style: TextStyle(
                        color: primaryBlue,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: primaryBlue,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.createnewpassword);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Back Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primaryBlue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: primaryBlue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildOtpField(BuildContext context, {bool first = false, bool last = false}) {
    return Container(
      height: 55,
      width: 45, // বক্সের সাইজ
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6), // ডিফল্ট ব্যাকগ্রাউন্ড কালার
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        autofocus: first, // প্রথম বক্সে অটোমেটিক ফোকাস থাকবে
        onChanged: (value) {
          if (value.length == 1 && !last) {
            FocusScope.of(context).nextFocus(); // লিখলে পরের ঘরে যাবে
          }
          if (value.isEmpty && !first) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1, // একটার বেশি সংখ্যা লেখা যাবে না
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          counterText: "",

          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryBlue, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}





// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:get/get.dart';
//
// import '../../core/route/route.dart';
// import '../../unity/appColors/appGradient.dart';
// import '../../unity/string_static/strig_static/staticString.dart';
// import '../widget/coustom_button/coustom_button.dart';
//
// class OtpVerification extends StatefulWidget {
//   const OtpVerification({super.key});
//
//   @override
//   _OtpVerificationState createState() => _OtpVerificationState();
// }
//
// class _OtpVerificationState extends State<OtpVerification> {
//
//   String currentText = "";
//   bool isFocused = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 200),
//
//                 // Title and Subtitle
//                 Center(
//                   child: Text(
//                     Staticstring.verifyOTPe,
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       foreground: Paint()
//                         ..shader = Appgradient.primaryGradient.createShader(
//                           const Rect.fromLTWH(0, 0, 200, 0),
//                         ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//                 Center(
//                   child: Text(
//                     Staticstring.verifyjopdetels,
//                     style: const TextStyle(color: Color(0xff888888), fontSize: 12),
//                   ),
//                 ),
//
//                 const SizedBox(height: 80),
//                 const Text(
//                   Staticstring.Email,
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 // OTP Input Field with shadow effect only (no border)
//                 Center(
//                   child: Container(
//                     // Shadow effect wrapper
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.08),
//                           blurRadius: 8,
//                           offset: const Offset(0, 2),
//                           spreadRadius: 0,
//                         ),
//                       ],
//                     ),
//                     child: PinCodeTextField(
//                       length: 6,
//                       obscureText: false,
//                       animationType: AnimationType.fade,
//                       pinTheme: PinTheme(
//                         shape: PinCodeFieldShape.box,
//                         borderRadius: BorderRadius.circular(8),
//                         fieldHeight: 50,
//                         fieldWidth: 45,
//
//                         // Background colors
//                         activeFillColor: const Color(0xFFF5F5F5),
//                         inactiveFillColor: const Color(0xFFF5F5F5),
//                         selectedFillColor: const Color(0xFFF5F5F5),
//
//                         // Border colors - সব transparent করে দিলাম
//                         activeColor: Colors.transparent,
//                         inactiveColor: Colors.transparent,
//                         selectedColor: Colors.transparent,
//                         disabledColor: Colors.transparent,
//                         errorBorderColor: Colors.transparent,
//
//                         // Border width
//                         borderWidth: 0,
//                       ),
//                       animationDuration: const Duration(milliseconds: 300),
//                       backgroundColor: Colors.transparent,
//                       enableActiveFill: true,
//                       textStyle: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF1A1A1A),
//                       ),
//                       cursorColor: const Color(0xFF2E5BFF),
//                       onCompleted: (v) {
//                         print("Completed OTP: $v");
//                       },
//                       onChanged: (value) {
//                         setState(() {
//                           currentText = value;
//                           isFocused = value.isNotEmpty;
//                         });
//                       },
//                       beforeTextPaste: (text) {
//                         print("Allowing to paste $text");
//                         return true;
//                       },
//                       appContext: context,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//
//                 // Resend OTP Button
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         // Implement resend OTP logic here
//                       },
//                       child: const Text(
//                         'Send again',
//                         style: TextStyle(color: Color(0xff2563EB)),
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 64),
//
//                 // Submit Button (navigate to create new password page)
//                 CustomSuperButton(
//                   text: Staticstring.sendCode,
//                   fontSize: 20,
//                   textColor: Colors.white,
//                   onTap: () {
//                     Get.toNamed(AppRoute.createnewpassword);
//                   },
//                   bgGradient: Appgradient.primaryGradient,
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 // Back Button (navigate back)
//                 CustomSuperButton(
//                   text: Staticstring.back,
//                   fontSize: 20,
//                   textColor: Appgradient.primaryGradient.colors[0],
//                   onTap: () {
//                     Get.back();
//                   },
//                   bgColor: const Color(0xffFFFFFF),
//                   borderColor: const Color(0xff2563EB),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }