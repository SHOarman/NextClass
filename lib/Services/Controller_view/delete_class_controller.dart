import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/api_Services/api_Services.dart';
import '../../core/route/route.dart';
import 'booking_teacher_list_controller.dart';

class DeleteClassController extends GetxController {
  var isLoading = false.obs;

  //========================= Delete Class API =========================
  Future<void> deleteClass(int classId) async {
    try {
      //================= Start loading ========================
      isLoading.value = true;

      //================= Get stored auth token ========================
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      //================= Delete class endpoint ========================
      final String url = "${ApiServices.baseUrl}/api/classes/$classId/";

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        //================= Refresh booking list after delete ========================
        if (Get.isRegistered<Bookingtecherlistcontroller>()) {
          Get.find<Bookingtecherlistcontroller>().fetchMyBookings();
        }

        //================= Navigate to home screen ========================
        Get.offAllNamed(AppRoute.home2);

        //================= Show success message ========================
        Get.snackbar(
          "Deleted",
          "Class deleted successfully",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        //================= API failure message ========================
        Get.snackbar("Error", "Failed to delete class");
      }
    } catch (e) {
      //================= Exception handling ========================
      debugPrint("Delete Error: $e");
    } finally {
      //================= Stop loading ========================
      isLoading.value = false;
    }
  }
}
