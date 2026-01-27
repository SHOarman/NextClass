import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/api_Services/api_services.dart';
import 'booking_teacher_list_controller.dart';

class MarkAsCompleteController extends GetxController {
  //=============== Loading state for UI ===================
  // ✅ Will show CircularProgressIndicator in modal button
  var isLoading = false.obs;

  //=============== Complete Booking API ===================
  Future<void> completeBooking(int bookingId) async {
    try {
      isLoading.value = true; // ✅ Start loading

      //=============== Get auth token ===================
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        Get.snackbar("Error", "Authentication token not found");
        return;
      }

      //=============== API Endpoint ===================
      // POST /api/bookings/{id}/complete/
      final String url =
          "${ApiServices.baseUrl}/api/bookings/$bookingId/complete/";

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      //=============== Success Handling ===================
      if (response.statusCode == 200 || response.statusCode == 201) {
        final listController = Get.find<Bookingtecherlistcontroller>();

        // ✅ Remove from local list immediately for UI update
        listController.bookingList.removeWhere((item) => item.id == bookingId);
        listController.bookingList.refresh();

        // ✅ Fetch fresh data from API
        await listController.fetchMyBookings();

        // ✅ Close the modal/dialog
        Get.back();

        // ✅ Show success snackbar
        Get.snackbar(
          "Success",
          "Tuition Marked as Completed",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        //=============== Failure Handling ===================
        Get.snackbar("Error", "Failed to update status");
      }
    } catch (e) {
      debugPrint("Complete Error: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false; // ✅ Stop loading
    }
  }
}
