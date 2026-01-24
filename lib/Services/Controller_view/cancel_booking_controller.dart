import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Services/api_Services/api_Services.dart';
import '../../../../core/route/route.dart';
import '../../../../core/succesfullcontroler/succesfullcontroler.dart';

class CancelBookingController extends GetxController {
  final TextEditingController reasonController = TextEditingController();
  var isLoading = false.obs;

  Future<void> cancelBooking(int bookingId, BuildContext context) async {
    // Input Validation
    if (reasonController.text.trim().isEmpty) {
      Get.snackbar(
        "Required",
        "Please provide a reason for cancellation",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      // Token Validation
      if (token == null) {
        Get.snackbar(
          "Authentication Error",
          "Session expired. Please login again.",
        );
        Get.offAllNamed(
          AppRoute.login,
        ); // Redirect to login if token is missing
        return;
      }

      final String url =
          "${ApiServices.baseUrl}/api/bookings/$bookingId/cancel/";

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"cancellation_reason": reasonController.text.trim()}),
      );

      // Handle Success
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (!context.mounted) return;
        _showSuccessDialog(context);
      } else {
        // Handle API specified errors
        final errorData = jsonDecode(response.body);
        Get.snackbar(
          "Request Failed",
          errorData['detail'] ??
              errorData['message'] ??
              "Could not cancel booking",
          backgroundColor: Colors.orange,
        );
      }
    } catch (e) {
      debugPrint("Network Exception: $e");
      Get.snackbar(
        "Connection Error",
        "Unable to reach the server. Please check your internet.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Private Helper to keep logic clean
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Reviewpopupmsg(
          name: 'Successful',
          namedetels: 'You have successfully cancelled the booking.',
          buName1: 'Back to home',
          ontap1: () {
            reasonController.clear();
            Get.offAllNamed(AppRoute.homedetels);
          },
        ),
      ),
    );
  }

  @override
  void onClose() {
    reasonController.dispose();
    super.onClose();
  }
}
