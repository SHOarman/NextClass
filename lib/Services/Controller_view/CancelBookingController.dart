import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Services/api_Services/api_Services.dart';
import '../../../../core/route/route.dart';
import '../../../../core/succesfullcontroler/succesfullcontroler.dart';

class CancelBookingController extends GetxController {
  /// Controller for the cancellation reason input
  TextEditingController reasonController = TextEditingController();

  /// Observable loading state for showing loader in UI
  var isLoading = false.obs;

  // ==================== CANCEL BOOKING FUNCTION ====================
  Future<void> cancelBooking(int bookingId, BuildContext context) async {
    // 1️⃣ Validation: Make sure user has entered a reason
    if (reasonController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please provide a reason for cancellation",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true; // Show loader

    try {
      // 2️⃣ Get auth token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      // 3️⃣ Construct API URL and POST request
      final String url = "${ApiServices.baseUrl}/api/bookings/$bookingId/cancel/";

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "cancellation_reason": reasonController.text.trim(),
        }),
      );

      // 4️⃣ Handle API response
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;

        // 5️⃣ Show success dialog with navigation option
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Reviewpopupmsg(
              name: 'Successful',
              namedetels: 'You have successfully cancelled the booking.',
              buName1: 'Back to home',
              ontap1: () {
                // Clear controller and navigate to home
                reasonController.clear();
                Get.offAllNamed(AppRoute.homedetels);
              },
            ),
          ),
        );
      } else {
        // 6️⃣ API error handling
        final errorData = jsonDecode(response.body);
        Get.snackbar(
          "Failed",
          errorData['detail'] ?? "Could not cancel booking",
          backgroundColor: Colors.orange,
        );
      }
    } catch (e) {
      // 7️⃣ Catch network or other errors
      debugPrint("Cancel Error: $e");
      Get.snackbar(
        "Error",
        "Check your internet connection.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false; // Hide loader
    }
  }

  @override
  void onClose() {
    // Dispose the controller to free memory
    reasonController.dispose();
    super.onClose();
  }
}
