import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//======================== Routes ========================
import '../../core/route/route.dart';

//======================== UI ========================
import '../../core/succesfullcontroler/succesfullcontroler.dart';

//======================== API ========================
import '../api_Services/api_Services.dart';
import 'booking_teacher_list_controller.dart';

class Rejectbokking2 extends GetxController {
  final TextEditingController reasonController = TextEditingController();
  final RxBool isLoading = false.obs;

  //======================== Cancel Booking ========================
  Future<void> cancelBooking(
    int bookingId,
    BuildContext context, {
    VoidCallback? onSuccess,
  }) async {
    if (reasonController.text.trim().isEmpty) {
      Get.snackbar(
        'Required',
        'Please provide a reason',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null) {
        Get.offAllNamed(AppRoute.login);
        return;
      }

      final url = '${ApiServices.baseUrl}/api/bookings/$bookingId/cancel/';

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'cancellation_reason': reasonController.text.trim()}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Refresh the list
        Get.put(Bookingtecherlistcontroller()).fetchMyBookings();
        _showSuccessDialog(context, onSuccess);
      } else {
        final errorData = jsonDecode(response.body);
        Get.snackbar('Failed', errorData['detail'] ?? 'Something went wrong');
      }
    } catch (e) {
      debugPrint('Cancel booking error: $e');
      Get.snackbar('Error', 'Unable to cancel booking');
    } finally {
      isLoading.value = false;
    }
  }

  //======================== Success Dialog ========================
  void _showSuccessDialog(BuildContext context, VoidCallback? onSuccess) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        content: Reviewpopupmsg(
          name: 'Successful',
          namedetels: 'Booking cancelled successfully.',
          buName1: 'OK',
          ontap1: () {
            reasonController.clear();
            Get.back();

            if (onSuccess != null) {
              onSuccess();
            } else {
              Get.offAllNamed(AppRoute.home2);
            }
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
