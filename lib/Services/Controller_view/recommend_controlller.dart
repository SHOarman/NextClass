import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Services/api_Services/api_services.dart';
import '../model_class/recommend.dart';

class RecommendedController extends GetxController {
  var recommendedList = <RecommendedClass>[].obs;
  var isLoading = false.obs;

  // ডাইনামিক ফিল্টারিং ফাংশন
  Future<void> fetchRecommendedClasses({String? level, String? type, String? subjects}) async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      // এপিআই ইউআরএল তৈরি - আপনার প্রোফাইল ডাটা অনুযায়ী
      final String url = "${ApiServices.baseUrl}/api/accounts/parent-profile/active_classes/?"
          "child_education_level=${level ?? ''}"
          "&class_type=${type ?? ''}"
          "&preferred_subjects=${subjects ?? ''}";

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);

        // results -> features লজিক হ্যান্ডেল করা
        var responseModel = RecommendedClassResponse.fromJson(decodedData);
        recommendedList.assignAll(responseModel.results ?? []);

        debugPrint("✅ Data Loaded: ${recommendedList.length} items matched your profile");
      }
    } catch (e) {
      debugPrint("⚠️ API Error: $e");
    } finally {
      isLoading(false);
    }
  }
}