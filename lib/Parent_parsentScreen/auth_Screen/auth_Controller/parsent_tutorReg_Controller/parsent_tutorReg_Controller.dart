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
  //============================= Parent Registration Controllers ================================
  final TextEditingController WhatsubjectController = TextEditingController();
  final TextEditingController childEducationLevelController =
      TextEditingController();
  final TextEditingController classTypeController = TextEditingController();

  //============================= Tutor Registration Controllers ================================
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController educationLevelController =
      TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController yearsExpController = TextEditingController();
  final TextEditingController teachingPhilosophyController =
      TextEditingController();
  final TextEditingController personalEduLevelController =
      TextEditingController();

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
      Get.snackbar(
        "Error",
        "User not logged in!",
        backgroundColor: Colors.redAccent,
      );
      return;
    }

    try {
      //=======================headerSecation=====================================
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      //========================body=============================================
      Map<String, dynamic> bodyData = {
        "child_education_level": childEducationLevelController.text,
        "class_type": classTypeController.text,

        "preferred_subjects": WhatsubjectController.text,
      };

      print("=== Sending Parent Reg Body ===\n$bodyData");

      //===================post Request==================================
      var response = await http.post(
        Uri.parse(ApiServices.Parentreg),
        headers: headers,
        body: jsonEncode(bodyData),
      );

      print("==================================================");
      print("📡 Status Code: ${response.statusCode}");
      print("📜 Response Body: ${response.body}");
      print("==================================================");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // =================================== Clear Controllers immediately
        childEducationLevelController.clear();
        classTypeController.clear();
        WhatsubjectController.clear();

        // 2. Show Success Message
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
        // ... your existing error handling ...

        // Error Handling
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

        Get.snackbar(
          "Error",
          errorMessage,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      print("=============================>>>>>>>>>>>>>>>$error");
      Get.snackbar(
        "Error",
        "Check Internet Connection",
        backgroundColor: Colors.redAccent,
      );
    }
  }

  //============================= Tutor Registration Function ================================

  Future<void> registerTutor(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      Get.snackbar(
        "Error",
        "User not logged in!",
        backgroundColor: Colors.redAccent,
      );
      return;
    }

    final ImagePickureController imageController =
        Get.find<ImagePickureController>();

    if (imageController.selectedImagePath.value.isEmpty) {
      Get.snackbar(
        "Required",
        "Please upload your certification image",
        backgroundColor: Colors.redAccent,
      );
      return;
    }

    if (fromDateController.text.isEmpty || toDateController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "Please select Start and End Date",
        backgroundColor: Colors.redAccent,
      );
      return;
    }

    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(ApiServices.Tutorreg),
      );
      request.headers.addAll(headers);

      // --- Text Fields ---
      request.fields['from_date'] = fromDateController.text;
      request.fields['to_date'] = toDateController.text;
      request.fields['currently_teaching'] = currentlyTeaching.toString();
      request.fields['personal_education_level'] =
          personalEduLevelController.text;

      // Note: We are NOT attaching the file here anymore because the server ignores it.
      // We will upload it in the next step.

      debugPrint(
        "=== Sending Registration Data ===\nFields: ${request.fields}",
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      // ================= SUCCESS BLOCK =================
      if (response.statusCode == 200 || response.statusCode == 201) {
        // ✅✅✅ THIS IS WHAT YOU NEED TO ADD ✅✅✅
        print("Registration Successful. Starting Document Upload...");
        await uploadDocument(token);
        // ✅✅✅ END OF ADDITION ✅✅✅

        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: Colors.white,
            content: Reviewpopupmsg(
              name: 'Successful',
              namedetels:
                  'Your account is under review. You\'ll be notified when your account is approved.',
              bu_name1: 'Close',
              ontap1: () {
                Get.toNamed(AppRoute.home2);
              },
            ),
          ),
        );

        // Clear Data
        fromDateController.clear();
        toDateController.clear();
        personalEduLevelController.clear();
        imageController.clearImage();
      } else {
        Get.snackbar(
          "Error",
          "Registration Failed: ${response.body}",
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar(
        "Error",
        "Something went wrong",
        backgroundColor: Colors.redAccent,
      );
    }
  }

  //================uploadDocumentprofile=========================================

  Future<void> uploadDocument(String token) async {
    final ImagePickureController docController =
        Get.find<ImagePickureController>();

    if (docController.selectedFile.value == null) {
      Get.snackbar("Error", "Please select a document");
      return;
    }

    File file = docController.selectedFile.value!;

    try {
      print("⏳ Uploading: ${file.path.split('/').last}...");

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${ApiServices.baseUrl}/api/tutors/profiles/upload_document/',
        ),
      );

      request.headers.addAll({'Authorization': 'Bearer $token'});

      request.fields['document_type'] = 'nid';

      var multipartFile = await http.MultipartFile.fromPath('file', file.path);
      request.files.add(multipartFile);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print("Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Document Uploaded Successfully!",
          backgroundColor: Colors.green,
        );
      } else {
        print("❌ Upload Failed: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error: $e");
    }
  }
}
