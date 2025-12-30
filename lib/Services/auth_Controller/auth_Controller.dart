import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api_Services/api_Services.dart';

class Authcontroller extends GetxController {

  final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

  // TextEditingController firstNameController = TextEditingController();
  // TextEditingController lastNameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController addressController = TextEditingController();
  // TextEditingController passController = TextEditingController();

  //======================Login ===========================================

  Future<void> login() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var headers = {'Content-Type': 'application/json'};

      var body = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      print("Login Body: $body");


      var response = await http.post(
        Uri.parse(ApiServices.Authurl),
        body: jsonEncode(body),
        headers: headers,
      );

      print("Login Response: ${response.body}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        await prefs.setString('token', data['token']);

        print("Login Success: $data");
        Get.snackbar("Success", "Login Successful", backgroundColor: Colors.greenAccent);

        // Navigate to Home Screen here if needed
        // Get.offAll(() => Home());

      }
      // --- FIX FOR YOUR 403 ERROR ---
      else if (response.statusCode == 403) {
        var errorData = jsonDecode(response.body);
        Get.snackbar(
            "Verification Required",
            errorData['message'] ?? "Please verify your email address first.",
            backgroundColor: Colors.orangeAccent,
            duration: const Duration(seconds: 4)
        );
      }
      else {
        // Handle other errors (Wrong password, User not found)
        print("Error: ${response.statusCode}");
        var errorData = jsonDecode(response.body);
        Get.snackbar("Login Failed", errorData['message'] ?? "Login Failed", backgroundColor: Colors.redAccent);
      }
    } catch (error) {
      print(error);
      Get.snackbar("Error", "Something went wrong");
    }
  }


  //======================Registraion===========================================

  void registration() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      var body = {
        // "firstName": firstNameController.text.trim(),
        // "email": emailController.text.trim(),
        // "password": passController.text,
        // "address": addressController.text.trim(),
      };

      var headers = {'Content-Type': 'application/json'};

      var result = await http.post(
        Uri.parse(ApiServices.Registerurl),
        body: jsonEncode(body),
        headers: headers,
      );

      print("Status Code: ${result.statusCode}");

      if (result.statusCode == 201 || result.statusCode == 200) {
        var response = jsonDecode(result.body);
        print("Full API Response: $response");

        String? token = response['token'];

        // If root token is null, look inside 'data'
        if (token == null && response['data'] is Map) {
          token = response['data']['token'];
        }

        if (token != null) {
          await prefs.setString('token', token);
          print("Token saved: $token");
        }

        Get.snackbar("Success", "Registration Successful. Please Verify Email.", backgroundColor: Colors.greenAccent);

        // --- NAVIGATION FIX ---
        // Only navigate if registration was successful
        Get.to(() => const ());

      } else {
        // Catch registration errors (e.g. Email already exists)
        var errorData = jsonDecode(result.body);
        Get.snackbar("Error", errorData['message'] ?? "Registration Failed", backgroundColor: Colors.redAccent);
      }
    } catch (error) {
      print("Error: $error");
      Get.snackbar("Error", "Something went wrong");
    }
  }


  //======================Activeacound===========================================

  // 1. Accept the OTP code as a parameter
  Future<void> activeAccount(String otpCode) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var body = {
        'email': emailController.text.trim(),
        'code': otpCode, // CHANGED from 'otp' to 'code' based on your Postman screenshot
      };

      print("Sending request to: ${ApiServices.Activeacound}");
      print("Body: $body");

      var response = await http.post(
        Uri.parse(ApiServices.Activeacound),
        body: jsonEncode(body),
        headers: headers,
      );

      print("Activation Response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        Get.snackbar("Success", "Account Verified!", backgroundColor: Colors.greenAccent);

        // Navigate to Login or Home
        // Get.offAll(() => Home());

      } else {
        var errorData = jsonDecode(response.body);
        Get.snackbar("Error", errorData['message'] ?? "Invalid Code", backgroundColor: Colors.redAccent);
        //===============ApiCheker(response.statusCode);
      //  ApiCheker(response.statusCode, "Error", errorData['message'] ?? "Invalid Code");

      }
    } catch (e) {
      print("Exception: $e");
      Get.snackbar("Error", "Connection failed");
    }
  }






// Future<void> logout() async {
//
//   try {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//   } catch(error){
//     print(error);
//
//
//
//
//   }
// }





}