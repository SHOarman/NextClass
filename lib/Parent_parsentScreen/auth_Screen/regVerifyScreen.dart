import 'package:first_project/Parent_parsentScreen/auth_Screen/auth_Controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class Regverifyscreen extends StatefulWidget {
  const Regverifyscreen({super.key});

  @override
  State<Regverifyscreen> createState() => _RegverifyscreenState();
}

class _RegverifyscreenState extends State<Regverifyscreen> {
  final Color primaryBlue = const Color(0xFF2563EB);

  // Find the AuthController
  final Authcontroller authController = Get.put(Authcontroller());

  // Create a list of 6 controllers for the 6 boxes
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
                  'Verify Email',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: primaryBlue),
                ),
                const SizedBox(height: 16),

                // Show the email meant for verification
                Text(
                  'Enter the 6 digit OTP sent to ',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                // const Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text('OTP Code', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                // ),
                // const SizedBox(height: 10),

                // OTP Fields Row (Generated Dynamically)
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return _buildOtpField(context, index: index);
                    }),
                  ),
                ),

                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Call Resend API here if needed
                      authController.resendOTP();
                    },
                    child: Text(
                      'Send again',
                      style: TextStyle(color: primaryBlue, fontWeight: FontWeight.w600, decoration: TextDecoration.underline, decorationColor: primaryBlue),
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
                      // 1. Join the text from all 6 controllers into one string
                      String otpCode = otpControllers.map((e) => e.text).join();

                      // 2. Validation: Ensure exactly 6 digits are entered
                      if (otpCode.length == 6) {
                        // 3. Call the API function
                        authController.verifyOTP(otpCode);
                      } else {
                        Get.snackbar("Required", "Please enter valid 6 digit OTP", backgroundColor: Colors.orange, colorText: Colors.white);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: const Text('Submit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ),

                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primaryBlue),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Back', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: primaryBlue)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Updated _buildOtpField to accept the index
  Widget _buildOtpField(BuildContext context, {required int index}) {
    return Container(
      height: 55,
      width: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))],
      ),
      child: TextField(
        controller: otpControllers[index], // Assign the specific controller
        autofocus: index == 0, // Only autofocus the first box
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