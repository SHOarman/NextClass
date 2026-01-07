import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Services/api_Services/api_Services.dart';
import '../../../core/route/route.dart';

class Authcontroller extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController emaiilController = TextEditingController();
  TextEditingController paeswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController contenTypeController = TextEditingController();

  // TextEditingController firstNameController = TextEditingController();
  // TextEditingController lastNameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController addressController = TextEditingController();
  // TextEditingController passController = TextEditingController();

  //======================Login ===========================================


void login() async {

  try {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {'Content-Type': 'application/json'};
    var body = {
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
    };
    print("Login Body: $body");
    var response = await http.post(
      Uri.parse(ApiServices.login),
      body: jsonEncode(body),
      headers: headers,
    );
    print("Login Response: ${response.body}");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String serverMessage = data['message'];
      String accessToken = data['tokens']['access'];
      await prefs.setString('token', accessToken);
      print("✅ Token Saved: $accessToken");
      Get.toNamed(AppRoute.home);
      Get.snackbar(
        "Success",
        serverMessage,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );


    }




  }
  catch(errro){

    print('==================================>>>>>>>>>>>>>>>>>>>>>>$errro');
  }
}






void Register() async {

  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var body = {
      "full_name":nameController.text ,
      "email": emaiilController.text,
      "password": paeswordController.text,
      "confirm_password": confirmPasswordController.text,
      "user_type": contenTypeController.text,
    };
    print("Registration Body: $body");
    var headers = {'Content-Type': 'application/json'};




  }catch(errror){



  }

}


  // Future<void> login() async {
  //   try {
  //     // 1. Initialize SharedPreferences
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //     var headers = {'Content-Type': 'application/json'};
  //
  //     var body = {
  //       'email': emailController.text.trim(),
  //       'password': passwordController.text.trim(),
  //     };
  //     print("Login Body: $body");
  //
  //     var response = await http.post(
  //       Uri.parse(ApiServices.login),
  //       body: jsonEncode(body),
  //       headers: headers,
  //     );
  //
  //     print("Login Response: ${response.body}");
  //
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //
  //       // --- [STEP 1] Extract Message and Token from Server ---
  //       String serverMessage = data['message'];        // "Login successful"
  //       String accessToken = data['tokens']['access']; // The actual token
  //
  //       // --- [STEP 2] Save Token to Local Storage ---
  //       await prefs.setString('token', accessToken);
  //       print("✅ Token Saved: $accessToken");
  //
  //       // --- [STEP 3] Show Server Message in Snackbar ---
  //       Get.snackbar(
  //         "Success",
  //         serverMessage, // Shows "Login successful" from server
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white,
  //         snackPosition: SnackPosition.BOTTOM,
  //         margin: const EdgeInsets.all(10),
  //       );
  //
  //       // --- [STEP 4] Navigate to Home ---
  //       Get.offAllNamed(AppRoute.home);
  //
  //     }
  //     // --- Handle Email Verification Error ---
  //     else if (response.statusCode == 403) {
  //       var errorData = jsonDecode(response.body);
  //       Get.snackbar(
  //           "Verification Required",
  //           errorData['message'] ?? "Please verify your email address first.",
  //           backgroundColor: Colors.orangeAccent,
  //           colorText: Colors.white,
  //           duration: const Duration(seconds: 4)
  //       );
  //     }
  //     // --- Handle Other Errors ---
  //     else {
  //       print("Error: ${response.statusCode}");
  //       var errorData = jsonDecode(response.body);
  //       Get.snackbar(
  //           "Login Failed",
  //           errorData['message'] ?? "Login Failed",
  //           backgroundColor: Colors.redAccent,
  //           colorText: Colors.white,
  //           snackPosition: SnackPosition.BOTTOM
  //       );
  //     }
  //   } catch (error) {
  //     print("Exception: $error");
  //     Get.snackbar("Error", "Something went wrong! Check internet connection.");
  //   }
  // }


  //======================Registraion===========================================

  // void registration() async {
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //     var body = {
  //
  //       "full_name":nameController.text ,
  //       "email": emaiilController.text,
  //       "password": paeswordController.text,
  //       "confirm_password": confirmPasswordController.text,
  //        "user_type": contenTypeController.text,
  //
  //
  //
  //
  //     };
  //
  //     print("Registration Body: $body");
  //
  //     var headers = {'Content-Type': 'application/json'};
  //
  //     var result = await http.post(
  //       Uri.parse(ApiServices.Registerurl),
  //       body: jsonEncode(body),
  //       headers: headers,
  //     );
  //
  //     print("Status Code: ${result.statusCode}");
  //
  //     if (result.statusCode == 200 ) {
  //       var response = jsonDecode(result.body);
  //       print("Full API Response: $response");
  //       Get.toNamed(AppRoute.regVerifyScreen);
  //
  //       String? token = response['token'];
  //
  //       // // If root token is null, look inside 'data'
  //       // if (token == null && response['data'] is Map) {
  //       //   token = response['data']['token'];
  //       // }
  //       //
  //       // if (token != null) {
  //       //   await prefs.setString('token', token);
  //       //   print("Token saved: $token");
  //       // }
  //
  //       Get.snackbar("Success", "Registration Successful. Please Verify Email.", backgroundColor: Colors.greenAccent);
  //
  //       // --- NAVIGATION FIX ---
  //       // Only navigate if registration was successful
  //       Get.to(() => const ());
  //
  //     } else {
  //       // Catch registration errors (e.g. Email already exists)
  //       var errorData = jsonDecode(result.body);
  //       Get.snackbar("Error", errorData['message'] ?? "Registration Failed", backgroundColor: Colors.redAccent);
  //     }
  //   } catch (error) {
  //     print("Error: $error");
  //     Get.snackbar("Error", "Something went wrong");
  //   }
  // }

  //======================Activeacound===========================================

  // 1. Accept the OTP code as a parameter
  // Future<void> activeAccount(String otpCode) async {
  //   try {
  //     var headers = {'Content-Type': 'application/json'};
  //
  //     var body = {
  //       'email': emailController.text.trim(),
  //       'code': otpCode, // CHANGED from 'otp' to 'code' based on your Postman screenshot
  //     };
  //
  //     print("Sending request to: ${ApiServices.Activeacound}");
  //     print("Body: $body");
  //
  //     var response = await http.post(
  //       Uri.parse(ApiServices.Activeacound),
  //       body: jsonEncode(body),
  //       headers: headers,
  //     );
  //
  //     print("Activation Response: ${response.body}");
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       var data = jsonDecode(response.body);
  //       Get.snackbar("Success", "Account Verified!", backgroundColor: Colors.greenAccent);
  //
  //       // Navigate to Login or Home
  //       // Get.offAll(() => Home());
  //
  //     } else {
  //       var errorData = jsonDecode(response.body);
  //       Get.snackbar("Error", errorData['message'] ?? "Invalid Code", backgroundColor: Colors.redAccent);
  //       //===============ApiCheker(response.statusCode);
  //     //  ApiCheker(response.statusCode, "Error", errorData['message'] ?? "Invalid Code");
  //
  //     }
  //   } catch (e) {
  //     print("Exception: $e");
  //     Get.snackbar("Error", "Connection failed");
  //   }
  // }

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

  // login()async{
  //   try{
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //     var body={
  //       "email": emailController.text,
  //       "password":passwordController.text
  //
  //     };
  //     print("Login Body: $body");
  //
  //     var headers={'Content-Type':'application/json'};
  //
  //
  //           var response = await http.post(
  //              Uri.parse(ApiServices.login),
  //             body: jsonEncode(body),
  //             headers: headers,
  //           );
  //           if(response.statusCode==201){
  //             var data=jsonDecode(response.body);
  //             await prefs.setString('access', data['tokens']['access']);
  //             print("Login Success: $data");
  //             Get.snackbar("message", "Login successful", backgroundColor: Colors.greenAccent);
  //
  //           }
  //
  //
  //
  //
  //
  //
  //
  //   }catch(error){
  //     print(error);
  //
  //
  //
  //   }
  //
  // }
}




