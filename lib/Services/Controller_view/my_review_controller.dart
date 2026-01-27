import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../api_Services/api_services.dart';
import '../model_class/review.dart';

class MyReviewController extends GetxController {
  // Loading state for API calls
  var isLoading = false.obs;

  // List to store user reviews
  var reviews = <ReviewResult>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyReviews(); // Fetch reviews when controller is initialized
  }

  /// Fetch user's reviews from API
  Future<void> fetchMyReviews() async {
    try {
      isLoading(true);

      // Get saved token from SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        debugPrint("No token found. Cannot fetch reviews.");
        return;
      }

      final response = await http.get(
        Uri.parse("${ApiServices.baseUrl}/api/reviews/my_reviews/"),
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        ReviewModel reviewModel = ReviewModel.fromJson(jsonData);

        // Update observable review list
        reviews.assignAll(reviewModel.results ?? []);
      } else {
        debugPrint(
          "Failed to fetch reviews. Status code: ${response.statusCode}",
        );
      }
    } catch (e) {
      debugPrint("Error fetching reviews: $e");
    } finally {
      isLoading(false);
    }
  }
}
