import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Services/api_Services/api_services.dart';
import '../Controller_view/booking_teacher_list_controller.dart';

class ConfirmBookingController extends GetxController {
  //================= Loading state for UI (show progress indicator) ========================
  var isLoading = false.obs;

  //================= Confirm booking API call ========================
  Future<void> confirmBooking(int bookingId, BuildContext context) async {
    isLoading.value =
        true; //================= Start loading ========================

    try {
      //================= Get stored token ========================
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) return;

      //================= API endpoint for confirming/accepting booking ========================
      final String url =
          "${ApiServices.baseUrl}/api/bookings/$bookingId/confirm/";

      //================= HTTP POST request ========================
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      //================= Success response handling ========================
      if (response.statusCode == 200 || response.statusCode == 201) {
        //================= Refresh teacher booking list ========================
        Get.put(Bookingtecherlistcontroller()).fetchMyBookings();

        //================= Close the dialog ========================
        Get.back();

        //================= Show success message ========================
        Get.snackbar(
          "Success",
          "Request Accepted Successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      //================= Error handling ========================
      else {
        Get.snackbar("Error", "Could not accept request");
      }
    }
    //================= Catch any exception ========================
    catch (e) {
      debugPrint("Confirm Error: $e");
    }
    //================= Stop loading ========================
    finally {
      isLoading.value = false;
    }
  }
}
