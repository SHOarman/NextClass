import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//======================== API & Models ========================
import '../../../../Services/api_Services/api_Services.dart';
import '../model_class/bokkingmodelclass.dart';

class Confrombokking extends GetxController {
  //======================== Observable Variables ========================
  var isLoading = false.obs;

  // আলাদা আলাদা ট্যাবের জন্য লিস্ট
  var pendingList = <BookingModel>[].obs;
  var acceptedList = <BookingModel>[].obs;
  var rejectedList = <BookingModel>[].obs;

  @override
  void onInit() {
    fetchMyBookings(); // স্ক্রিন লোড হওয়ার সময় ডাটা নিয়ে আসবে
    super.onInit();
  }

  //======================== ১. বুকিং কনফার্ম করা (Accept Action) ========================
  Future<void> confirmBookingStatus(int id) async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      // POST Request to confirm
      final response = await http.post(
        Uri.parse("${ApiServices.baseUrl}/api/bookings/$id/confirm/"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Booking has been accepted",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // ২. ডাটা রিফ্রেশ করা যাতে এটি পেন্ডিং থেকে সরে একসেপ্টে চলে যায়
        await fetchMyBookings();
      } else {
        Get.snackbar("Error", "Failed to confirm booking");
      }
    } catch (e) {
      debugPrint("Confirmation Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  //======================== ৩. ডাটা ফেচ এবং ট্যাব অনুযায়ী ভাগ করা ========================
  Future<void> fetchMyBookings() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(ApiServices.listbokking),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        BookingResponseModel responseData = BookingResponseModel.fromJson(jsonData);

        List<BookingModel> allResults = responseData.results ?? [];

        pendingList.assignAll(allResults.where((b) => b.status?.toLowerCase() == 'pending').toList());
        acceptedList.assignAll(allResults.where((b) => b.status?.toLowerCase() == 'accepted' || b.status?.toLowerCase() == 'confirmed').toList());
        rejectedList.assignAll(allResults.where((b) => b.status?.toLowerCase() == 'rejected').toList());

        debugPrint("Pending: ${pendingList.length}, Accepted: ${acceptedList.length}");
      }
    } catch (e) {
      debugPrint("Fetch Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}