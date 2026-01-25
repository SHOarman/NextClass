import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../api_Services/api_Services.dart';

// Controllers
import '../Controller_view/bokinglistcontroller.dart';
import 'my_review_controller.dart';

class ReviewController extends GetxController {
  var isLoading = false.obs;

  /// Create a new review for a booking
  Future<bool> createReview({
    required int bookingId,
    required int rating,
    required String comment,
  }) async {
    try {
      isLoading(true);
      debugPrint("Submitting review for Booking ID: $bookingId");

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        _showErrorSnackbar("Unauthorized", "Please login first.");
        return false;
      }

      final Map<String, dynamic> body = {
        "booking": bookingId,
        "rating": rating,
        "title": "Tutor Review",
        "comment": comment,
        "communication_rating": rating,
        "teaching_quality_rating": rating,
        "value_for_money_rating": rating,
      };

      final String apiUrl = "${ApiServices.baseUrl}/api/reviews/";

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(body),
      );

      debugPrint("API Response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Review submitted successfully!");

        // Refresh booking list if controller exists
        if (Get.isRegistered<BookingListController>()) {
          await Get.find<BookingListController>().fetchBookings();
        }

        // Refresh my reviews list if controller exists
        if (Get.isRegistered<MyReviewController>()) {
          await Get.find<MyReviewController>().fetchMyReviews();
        }

        return true;
      } else {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        String errorMessage = errorData['booking']?[0] ?? "Submission failed";
        _showErrorSnackbar("Error", errorMessage);
        return false;
      }
    } catch (e) {
      debugPrint("Review submission error: $e");
      _showErrorSnackbar("Error", "Something went wrong.");
      return false;
    } finally {
      isLoading(false);
    }
  }

  /// Show error snackbar at bottom
  void _showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  }
}
