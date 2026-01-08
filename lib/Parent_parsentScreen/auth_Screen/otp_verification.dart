// import 'package:first_project/core/route/route.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// class VerifyOtpScreen extends StatefulWidget {
//   const VerifyOtpScreen({super.key});
//
//   @override
//   State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
// }
//
// class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
//
//   final Color primaryBlue = const Color(0xFF2563EB);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 100),
//
//                 // Title
//                 Text(
//                   'Verify OTP',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: primaryBlue,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//
//                 // Subtitle
//                 const Text(
//                   'Enter the 6 digit OTP sent to your email address.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//
//                 // Label "Email"
//                 const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Email',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//
//                 // OTP Input Fields (Clickable & Functional)
//                 Form(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//
//                       _buildOtpField(context, first: true),
//                       _buildOtpField(context),
//                       _buildOtpField(context),
//                       _buildOtpField(context),
//                       _buildOtpField(context),
//                       _buildOtpField(context, last: true),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 // "Send again" Link
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       print("Resend Clicked");
//                     },
//                     child: Text(
//                       'Send again',
//                       style: TextStyle(
//                         color: primaryBlue,
//                         fontWeight: FontWeight.w600,
//                         decoration: TextDecoration.underline,
//                         decorationColor: primaryBlue,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 40),
//
//                 // Submit Button
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Get.toNamed(AppRoute.createnewpassword);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: primaryBlue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: const Text(
//                       'Submit',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 // Back Button
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: OutlinedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     style: OutlinedButton.styleFrom(
//                       side: BorderSide(color: primaryBlue),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Text(
//                       'Back',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: primaryBlue,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildOtpField(BuildContext context, {bool first = false, bool last = false}) {
//     return Container(
//       height: 55,
//       width: 45,
//       decoration: BoxDecoration(
//         color: const Color(0xFFF3F4F6),
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 2,
//             offset: Offset(0, 1),
//           ),
//         ],
//       ),
//       child: TextField(
//         autofocus: first,
//         onChanged: (value) {
//           if (value.length == 1 && !last) {
//             FocusScope.of(context).nextFocus();
//           }
//           if (value.isEmpty && !first) {
//             FocusScope.of(context).previousFocus();
//           }
//         },
//         showCursor: false,
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         keyboardType: TextInputType.number,
//         maxLength: 1,
//         inputFormatters: [
//           FilteringTextInputFormatter.digitsOnly,
//         ],
//         decoration: InputDecoration(
//           counterText: "",
//
//           border: OutlineInputBorder(borderSide: BorderSide.none),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: primaryBlue, width: 2),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//



import 'package:first_project/Parent_parsentScreen/auth_Screen/auth_Controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../core/route/route.dart';
// Update with your actual path

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final Color primaryBlue = const Color(0xFF2563EB);

  // 1. Find the AuthController
  final Authcontroller authController = Get.find<Authcontroller>();

  // 2. Create a list of 6 controllers for the 6 boxes
  final List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),

                Text(
                  'Verify OTP',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: primaryBlue),
                ),
                const SizedBox(height: 16),

                Text(
                  'Enter the 6 digit OTP sent to',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 40),


                // 3. Generate 6 OTP boxes dynamically
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return _buildOtpField(context, index: index);
                    }),
                  ),
                ),

                const SizedBox(height: 10),

                // Resend Button
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Call the forgetPassword function again to resend email
                      authController.forgetPassword();
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
                      // 4. Join the text from all 6 boxes into one string
                      String otpCode = otpControllers.map((e) => e.text).join();

                      if (otpCode.length == 6) {

                        // 5. Save OTP in controller for the next screen
                        authController.resetOtpController.text = otpCode;

                        // 6. Navigate to Create New Password Screen
                        Get.toNamed(AppRoute.createnewpassword);

                      } else {
                        Get.snackbar(
                            "Required",
                            "Please enter full 6 digit OTP",
                            backgroundColor: Colors.orange,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      'Back',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: primaryBlue),
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

  // Helper method to build each OTP box
  Widget _buildOtpField(BuildContext context, {required int index}) {
    return Container(
      height: 55,
      width: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: TextField(
        controller: otpControllers[index], // Assign specific controller
        autofocus: index == 0, // Autofocus only on the first box
        onChanged: (value) {
          // Logic to move focus automatically
          if (value.length == 1 && index < 5) {
            FocusScope.of(context).nextFocus(); // Move forward
          }
          if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus(); // Move backward
          }
        },
        showCursor: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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