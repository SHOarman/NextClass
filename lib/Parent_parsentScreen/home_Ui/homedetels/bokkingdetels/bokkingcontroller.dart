import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ======================== Imports ========================
import '../../../../Services/api_Services/api_Services.dart';
import '../../../../core/succesfullcontroler/succesfullcontroler.dart';
import '../../../../core/route/route.dart';

class Bokkingcontroller extends GetxController {

  // ======================== Text Controllers ========================
  TextEditingController namcontroler = TextEditingController();
  TextEditingController agecontroler = TextEditingController();

  // ======================== Loading State ========================
  var isLoading = false.obs;

  // ======================== Create Booking API ========================
  Future<void> createBooking(int classId, BuildContext context) async {

    // ======================== Form Validation ========================
    if (namcontroler.text.trim().isEmpty ||
        agecontroler.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final int? age = int.tryParse(agecontroler.text.trim());
    if (age == null || age <= 0) {
      Get.snackbar(
        "Invalid Age",
        "Please enter a valid age",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      // ======================== Token ========================
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        isLoading.value = false;
        Get.snackbar("Login Required", "Please login again.");
        return;
      }

      // ======================== Request Body ========================
      final bodyData = {
        "class_listing": classId,
        "booking_date": DateTime.now().toIso8601String().split('T')[0],
        "student_name": namcontroler.text.trim(),
        "student_age": age,
        "parent_notes": "Booking request from parent app",
        "number_of_students": 1,
      };

      // ======================== API Call ========================
      final response = await http.post(
        Uri.parse(ApiServices.listbokking),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(bodyData),
      );

      isLoading.value = false;

      // ======================== Success ========================
      if (response.statusCode == 200 || response.statusCode == 201) {

        namcontroler.clear();
        agecontroler.clear();
        FocusScope.of(context).unfocus();

        Get.back();

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Successfullmsg(
              name: 'Successful',
              namedetels: 'Your request has been sent successfully to the tutor.',
              buName1: 'Track booking',
              ontap1: () {
                Get.back();
                Get.offNamed(AppRoute.homedetels);
              },
              buName2: 'Back to home',
              ontap2: () => Get.back(),
            ),
          ),
        );
      }
      // ======================== Error ========================
      else {
        final errorData = jsonDecode(response.body);
        final errorMessage =
            errorData['message'] ?? 'Booking failed';

        debugPrint("Server Error: ${response.body}");

        Get.snackbar(
          "Booking Failed",
          errorMessage,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("Exception: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.");
    }
  }

  @override
  void onClose() {
    namcontroler.dispose();
    agecontroler.dispose();
    super.onClose();
  }
}
