import 'dart:convert';
import 'dart:io';

import 'package:first_project/Services/api_Services/api_Services.dart';
import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/route/Genaral_Controler/imagepickurecontroller.dart';
import '../../../../core/succesfullcontroler/succesfullcontroler.dart';
import '../../../home_Ui/allow_location/allow_location.dart';

class ParsentTutorregController extends GetxController {

  //============== ✅ Added for Profile Update ============================
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController BioeController = TextEditingController();

  //============================= Parent Registration Controllers ================================
  final TextEditingController WhatsubjectController = TextEditingController();
  final TextEditingController childEducationLevelController = TextEditingController();
  final TextEditingController classTypeController = TextEditingController();

  //============================= Tutor Registration Controllers ================================
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController educationLevelController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  // final TextEditingController bioController = TextEditingController(); // BioeController ব্যবহার হচ্ছে, তাই এটা কমেন্ট করে রাখলাম বা চাইলে রিমুভ করতে পারেন
  final TextEditingController yearsExpController = TextEditingController();
  final TextEditingController teachingPhilosophyController = TextEditingController();
  final TextEditingController personalEduLevelController = TextEditingController();

  // Checkbox variable
  bool currentlyTeaching = false;

  //============================= Parent Registration Function ================================

  Future<void> Parentregistration() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    print("==================================================");
    print("🔑 My Token: $token");
    print("==================================================");

    if (token == null) {
      Get.snackbar("Error", "User not logged in!", backgroundColor: Colors.redAccent);
      return;
    }

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      Map<String, dynamic> bodyData = {
        "child_education_level": childEducationLevelController.text,
        "class_type": classTypeController.text,
        "preferred_subjects": WhatsubjectController.text,
      };

      print("=== Sending Parent Reg Body ===\n$bodyData");

      var response = await http.post(
        Uri.parse(ApiServices.Parentreg),
        headers: headers,
        body: jsonEncode(bodyData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        childEducationLevelController.clear();
        classTypeController.clear();
        WhatsubjectController.clear();

        Get.snackbar(
          "Success",
          "Parent Profile Created Successfully!",
          backgroundColor: Colors.greenAccent,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
        Get.toNamed(AppRoute.homedetels);

        Future.delayed(const Duration(milliseconds: 500), () {
          if (Get.context != null) {
            Get.dialog(AllowLocationDialog(), barrierDismissible: false);
          }
        });
      } else {
        var decodedResponse = jsonDecode(response.body);
        String errorMessage = "";

        if (decodedResponse is Map) {
          if (decodedResponse['detail'] != null) {
            errorMessage = decodedResponse['detail'];
          } else if (decodedResponse['message'] != null) {
            errorMessage = decodedResponse['message'];
          } else {
            decodedResponse.forEach((key, value) {
              errorMessage += "$key: $value\n";
            });
          }
        } else {
          errorMessage = "Registration Failed. Please try again.";
        }

        Get.snackbar("Error", errorMessage, backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } catch (error) {
      print("Error: $error");
      Get.snackbar("Error", "Check Internet Connection", backgroundColor: Colors.redAccent);
    }
  }

  //============================= Tutor Registration Function ================================

  Future<void> registerTutor(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      Get.snackbar("Error", "User not logged in!", backgroundColor: Colors.redAccent);
      return;
    }

    final ImagePickureController imageController = Get.find<ImagePickureController>();

    if (imageController.selectedImagePath.value.isEmpty) {
      Get.snackbar("Required", "Please upload your certification image", backgroundColor: Colors.redAccent);
      return;
    }

    if (fromDateController.text.isEmpty || toDateController.text.isEmpty) {
      Get.snackbar("Required", "Please select Start and End Date", backgroundColor: Colors.redAccent);
      return;
    }

    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', Uri.parse(ApiServices.Tutorreg));
      request.headers.addAll(headers);

      request.fields['from_date'] = fromDateController.text;
      request.fields['to_date'] = toDateController.text;
      request.fields['currently_teaching'] = currentlyTeaching.toString();
      request.fields['personal_education_level'] = personalEduLevelController.text;

      debugPrint("=== Sending Registration Data ===\nFields: ${request.fields}");

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Registration Successful. Starting Document Upload...");
        await uploadDocument(token);

        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: Colors.white,
            content: Reviewpopupmsg(
              name: 'Successful',
              namedetels: 'Your account is under review. You\'ll be notified when your account is approved.',
              bu_name1: 'Close',
              ontap1: () {
                Get.toNamed(AppRoute.home2);
              },
            ),
          ),
        );

        fromDateController.clear();
        toDateController.clear();
        personalEduLevelController.clear();
        imageController.clearImage();
      } else {
        Get.snackbar("Error", "Registration Failed: ${response.body}", backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "Something went wrong", backgroundColor: Colors.redAccent);
    }
  }

  //================uploadDocumentprofile=========================================

  Future<void> uploadDocument(String token) async {
    final ImagePickureController docController = Get.find<ImagePickureController>();

    if (docController.selectedFile.value == null) {
      Get.snackbar("Error", "Please select a document");
      return;
    }

    File file = docController.selectedFile.value!;

    try {
      print("⏳ Uploading: ${file.path.split('/').last}...");

      var request = http.MultipartRequest('POST', Uri.parse(ApiServices.uploadocument));
      request.headers.addAll({'Authorization': 'Bearer $token'});
      request.fields['document_type'] = 'nid';

      var multipartFile = await http.MultipartFile.fromPath('file', file.path);
      request.files.add(multipartFile);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "Document Uploaded Successfully!", backgroundColor: Colors.green);
      } else {
        print("❌ Upload Failed: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error: $e");
    }
  }

  //================ ✅✅✅ NEW: Update Profile Function ✅✅✅ =================

  Future<void> updateProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      Get.snackbar("Error", "User not logged in!", backgroundColor: Colors.redAccent);
      return;
    }

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // Create Body
      Map<String, dynamic> body = {};

      if(fullNameController.text.isNotEmpty){
        body["full_name"] = fullNameController.text;
      }
      if(BioeController.text.isNotEmpty){
        body["bio"] = BioeController.text;
      }

      print("=== Updating Profile Body ===\n$body");

      var response = await http.patch(
        Uri.parse(ApiServices.updateAcound),
        headers: headers,
        body: jsonEncode(body),
      );

      print("Status: ${response.statusCode}");
      print("Response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back(); // Close Edit Page
        Get.snackbar(
            "Success",
            "Profile Updated Successfully!",
            backgroundColor: Colors.greenAccent,
            colorText: Colors.black
        );
      } else {
        Get.snackbar("Error", "Update Failed: ${response.body}", backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "Check Internet Connection", backgroundColor: Colors.redAccent);
    }
  }
}