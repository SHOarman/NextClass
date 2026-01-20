import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Services/api_Services/api_Services.dart';
import '../../../../core/succesfullcontroler/succesfullcontroler.dart';
import '../../../../core/route/route.dart';

class Bokkingcontroller extends GetxController {
  TextEditingController namcontroler = TextEditingController();
  TextEditingController agecontroler = TextEditingController();

  var isLoading = false.obs;

  Future<void> createBooking(int classId, BuildContext context) async {
    if (namcontroler.text.isEmpty || agecontroler.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        isLoading.value = false;
        Get.snackbar("Login Required", "Please login again.");
        return;
      }

      // ======================== Request Body Fix ========================
      final bodyData = {
        "class_listing": classId,
        "booking_date": DateTime.now().toIso8601String().split('T')[0],
        "student_name": namcontroler.text.trim(),
        // বয়সকে অবশ্যই Integer এ কনভার্ট করতে হবে
        "student_age": int.tryParse(agecontroler.text.trim()) ?? 0,
        "parent_notes": "Booking from mobile app",
        "number_of_students": 1, // অনেক সময় এটি রিকোয়ার্ড থাকে
      };

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

      if (response.statusCode == 201 || response.statusCode == 200) {
        namcontroler.clear();
        agecontroler.clear();
        FocusScope.of(context).unfocus();

        // ফর্ম স্ক্রিন বন্ধ করা
        Get.back();

        // Success Dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Successfullmsg(
              name: 'Successful',
              namedetels: 'Your request has been sent successfully to the tutor.',
              buName1: 'Track booking',
              ontap1: () {
                Get.back(); // Close dialog
                Get.offNamed(AppRoute.homedetels);
              },
              buName2: 'Back to home',
              ontap2: () => Get.back(),
            ),
          ),
        );
      } else {
        // সার্ভার থেকে আসা আসল এরর মেসেজ চেক করা
        final errorData = jsonDecode(response.body);
        debugPrint("Server Error Detail: ${response.body}"); // ডিবাগিং এর জন্য
        Get.snackbar(
          "Booking Failed",
          errorData.toString(), // পুরো এরর দেখালে বুঝতে সুবিধা হবে কি ভুল হচ্ছে
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
}