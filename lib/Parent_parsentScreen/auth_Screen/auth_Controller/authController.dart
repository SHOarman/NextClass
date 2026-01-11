import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/route/route.dart';
import '../../../Services/api_Services/api_Services.dart';

class Authcontroller extends GetxController {

  //================================= Controllers ==================================

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // For Reset Password Flow
  final TextEditingController forgetPasswordController = TextEditingController(); // Holds Email
  final TextEditingController resetOtpController = TextEditingController();       // Holds OTP
  final TextEditingController newPasswordController = TextEditingController();    // ✅ NEW
  final TextEditingController confirmNewPasswordController = TextEditingController(); // ✅ NEW


  // For Registration
  TextEditingController nameController = TextEditingController();
  TextEditingController createemailController = TextEditingController();
  TextEditingController createpasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController contenTypeController = TextEditingController();


  // For Change Password

  //================================= Login Account ==================================
  void loginaccound() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var headers = {'Content-Type': 'application/json'};
      var body = {
        "email": emailController.text,
        "password": passwordController.text
      };

      debugPrint("=== Login Body ===\n${jsonEncode(body)}");

      var response = await http.post(
        Uri.parse(ApiServices.login),
        body: jsonEncode(body),
        headers: headers,
      );

      debugPrint("=== Status Code ===\n${response.statusCode}");

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);

        // 1. Save Token Logic
        if (decodedResponse['tokens'] != null && decodedResponse['tokens']['access'] != null) {
          String accessToken = decodedResponse['tokens']['access'];
          await prefs.remove('token'); // Clear old
          await prefs.setString('token', accessToken); // Save new
          print("=== Login New Token Saved ===\n$accessToken");
        }

        // ============================================================
        // Check User Type and Navigate
        // ============================================================

        String userType = decodedResponse['user']['user_type'];
        await prefs.setString('user_type', userType);

        print("=== User Type Found: $userType ===");

        if (userType.toLowerCase() == 'tutor') {
          Get.toNamed(AppRoute.teachscre);
        } else {
          Get.offAllNamed(AppRoute.home);
        }

        Get.snackbar(
            "Success",
            "Login Successful",
            backgroundColor: Colors.greenAccent
        );
      } else {
        debugPrint("=== Login Failed Body ===\n${response.body}");
        Get.snackbar("Error", "Login Failed", backgroundColor: Colors.redAccent);
      }
    } catch (error) {
      debugPrint("=== Exception ===\n$error");
      Get.snackbar("Error", "Check Internet Connection", backgroundColor: Colors.redAccent);
    }
  }

  //================================= Register Account ==================================
  void register() async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var body = {
        "full_name": nameController.text,
        "email": createemailController.text,
        "user_type": contenTypeController.text.toLowerCase(),
        "password": createpasswordController.text,
        "confirm_password": confirmPasswordController.text,
      };

      debugPrint("=== Register Body ===\n${jsonEncode(body)}");

      var response = await http.post(
        Uri.parse(ApiServices.register),
        body: jsonEncode(body),
        headers: headers,
      );

      debugPrint("=== Status Code ===\n${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var decodedResponse = jsonDecode(response.body);

        if (decodedResponse['tokens'] != null && decodedResponse['tokens']['access'] != null) {
          String accessToken = decodedResponse['tokens']['access'];
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', accessToken);
          debugPrint("=== Register Token Saved ===\n$accessToken");
        }

        Get.toNamed(AppRoute.regVerifyScreen);

        Get.snackbar(
            "Success",
            "Registration Successful! Please verify your email.",
            backgroundColor: Colors.greenAccent
        );
      } else {
        var decodedResponse = jsonDecode(response.body);
        String errorMessage = "";

        if (decodedResponse is Map) {
          if(decodedResponse['message'] != null) {
            errorMessage = decodedResponse['message'];
          } else {
            decodedResponse.forEach((key, value) {
              errorMessage += "$key: $value\n";
            });
          }
        } else {
          errorMessage = "Registration Failed";
        }

        Get.snackbar("Error", errorMessage, backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } catch (error) {
      debugPrint("=== Exception ===\n$error");
      Get.snackbar("Error", "Something went wrong", backgroundColor: Colors.redAccent);
    }
  }

  //================= Verify OTP (For Registration) =================================
  void verifyOTP(String otpCode) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var body = {
        "email": createemailController.text,
        "otp_code": otpCode,
      };

      debugPrint("=== OTP Verify Body ===\n${jsonEncode(body)}");

      var response = await http.post(
        Uri.parse(ApiServices.verifyOtp),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.offAllNamed(AppRoute.login);
        Get.snackbar("Success", "Email Verification Successful! Please Login.", backgroundColor: Colors.greenAccent);
      } else {
        var decodedResponse = jsonDecode(response.body);
        String errorMessage = decodedResponse['message'] ?? "Verification Failed";
        Get.snackbar("Error", errorMessage, backgroundColor: Colors.redAccent, colorText: Colors.white);
      }

    } catch (e) {
      debugPrint("Error: $e");
      Get.snackbar("Error", "Something went wrong", backgroundColor: Colors.redAccent);
    }
  }

  //=================== Resend OTP ===============================================
  void resendOTP() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var body = {
        "email": createemailController.text,
      };

      var response = await http.post(
        Uri.parse(ApiServices.sendOtp),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Sent!", "A new OTP has been sent.", backgroundColor: Colors.greenAccent);
      } else {
        Get.snackbar("Error", "Failed to resend OTP", backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      Get.snackbar("Error", "Check your internet connection", backgroundColor: Colors.redAccent);
    }
  }

  //================= Forget Password (Send OTP) =====================
  void forgetPassword() async {
    if (forgetPasswordController.text.trim().isEmpty) {
      Get.snackbar("Required", "Please enter your email address!", backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    try {
      var headers = {'Content-Type': 'application/json'};
      var body = {
        "email": forgetPasswordController.text.trim(),
      };

      debugPrint("=== Sending OTP to Email ===\n${jsonEncode(body)}");

      var response = await http.post(
        Uri.parse(ApiServices.passwordResetRequest),
        body: jsonEncode(body),
        headers: headers,
      );

      debugPrint("=== Status Code ===\n${response.statusCode}");

      if (response.statusCode == 200) {
        Get.toNamed(AppRoute.otp);
        Get.snackbar("Success", "OTP has been sent to your email.", backgroundColor: Colors.greenAccent);
      } else {
        var decodedResponse = jsonDecode(response.body);
        String errorMessage = "";

        if(decodedResponse is Map && decodedResponse['email'] != null){
          errorMessage = decodedResponse['email'][0];
        } else {
          errorMessage = decodedResponse['message'] ?? "Failed to send OTP";
        }

        Get.snackbar("Error", errorMessage, backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } catch (e) {
      debugPrint("Error: $e");
      Get.snackbar("Error", "Check Internet Connection", backgroundColor: Colors.redAccent);
    }
  }

  //================= ✅ UPDATE PASSWORD (Set New Password) =====================

  //================= ✅ UPDATE PASSWORD (Set New Password) =====================

//================= ✅ UPDATE PASSWORD (Fixed) =====================

  void setNewPassword() async {

    // 1. Validation
    if (newPasswordController.text.isEmpty || confirmNewPasswordController.text.isEmpty) {
      Get.snackbar("Error", "All fields are required", backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    if (newPasswordController.text != confirmNewPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match", backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    try {
      var headers = {'Content-Type': 'application/json'};

      var body = {
        "email": forgetPasswordController.text.trim(),
        "otp_code": resetOtpController.text.trim(),
        "new_password": newPasswordController.text,


        "new_password_confirm": confirmNewPasswordController.text,
      };

      debugPrint("=== Reset Password Body ===\n${jsonEncode(body)}");

      var response = await http.post(
        Uri.parse(ApiServices.passwordResetConfirm),
        body: jsonEncode(body),
        headers: headers,
      );

      debugPrint("=== Status Code ===\n${response.statusCode}");

      if (response.statusCode == 200) {

        forgetPasswordController.clear();
        resetOtpController.clear();
        newPasswordController.clear();
        confirmNewPasswordController.clear();

        Get.offAllNamed(AppRoute.login);

        Get.snackbar(
            "Success",
            "Password Reset Successfully! Please Login.",
            backgroundColor: Colors.greenAccent
        );

      } else {
        var decodedResponse = jsonDecode(response.body);
        String errorMessage = "";

        if (decodedResponse is Map) {
          decodedResponse.forEach((key, value) {
            errorMessage += "$key: $value\n";
          });
        } else {
          errorMessage = "Reset Failed";
        }

        print("Server Error: $decodedResponse");
        Get.snackbar("Error", errorMessage, backgroundColor: Colors.redAccent, colorText: Colors.white);
      }

    } catch (e) {
      debugPrint("Error: $e");
      Get.snackbar("Error", "Check Internet Connection", backgroundColor: Colors.redAccent);
    }
  }


  //====================Change password=====================================================================





}