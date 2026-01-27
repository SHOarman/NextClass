import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/route/route.dart';
import '../../teacher_presentScreen/home_ui/home_controller.dart';
import 'booking_teacher_list_controller.dart';
import '../api_Services/api_services.dart';

//========================= Delete / Reject Booking Controller =========================
class DeleteBookingController extends GetxController {
  // Loading state
  var isLoading = false.obs;

  //========================= Delete or Reject Booking =========================
  Future<void> deleteOrRejectBooking(int bookingId) async {
    try {
      isLoading.value = true;

      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) return;

      final String url =
          "${ApiServices.baseUrl}/api/bookings/$bookingId/reject/";

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        // 1️⃣ Refresh the main bookings list
        Get.put(Bookingtecherlistcontroller()).fetchMyBookings();

        // 2️⃣ Update home screen counters if HomeController is registered
        if (Get.isRegistered<HomeController>()) {
          Get.find<HomeController>().fetchPendingRequests();
        }

        // 3️⃣ Navigate directly to the main home page
        Get.offAllNamed(AppRoute.home2);

        // ✅ Optional Snackbar for feedback
        Get.snackbar(
          "Deleted",
          "Booking removed and returning to home",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint("Delete Error: $e");
      Get.snackbar(
        "Error",
        "Unable to delete booking",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
