import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//======================== API & Models ========================
import '../../../../Services/api_Services/api_services.dart';
import '../model_class/bokkingmodelclass.dart';

//======================== Booking List Controller ========================
class BookingListController extends GetxController {

  //======================== Loading State ========================
  var isLoading = false.obs;

  //======================== Booking Lists ========================
  // All bookings from API
  var allBookings = <BookingModel>[].obs;

  // Pending + Accepted bookings
  var acceptedAndPendingBookings = <BookingModel>[].obs;

  // Rejected or Cancelled bookings
  var rejectedBookings = <BookingModel>[].obs;

  // Completed bookings
  var completedBookings = <BookingModel>[].obs;

  @override
  void onInit() {
    // Fetch booking list when controller is initialized
    fetchBookings();
    super.onInit();
  }

  //======================== Fetch Bookings API ========================
  Future<void> fetchBookings() async {
    isLoading.value = true;

    try {
      // Get saved token
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      // Token validation
      if (token == null) {
        debugPrint("Error: Token not found");
        return;
      }

      // API request
      final response = await http.get(
        Uri.parse(ApiServices.listbokking),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      //======================== Success Response ========================
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        // Map API data using BookingResponseModel
        var bookingResponse =
        BookingResponseModel.fromJson(jsonData);

        if (bookingResponse.results != null) {
          allBookings.assignAll(
              bookingResponse.results!);

          // Separate bookings by status
          _filterData();
        }
      }

      //======================== API Error ========================
      else {
        debugPrint(
            "API Error: ${response.statusCode} - ${response.body}");
      }
    }

    //======================== Exception Handling ========================
    catch (e) {
      debugPrint("Fatal Error in Fetching: $e");
    }

    //======================== Stop Loading ========================
    finally {
      isLoading.value = false;
    }
  }

  //======================== Booking Status Filter ========================
  void _filterData() {

    // Clear lists before filtering
    acceptedAndPendingBookings.clear();
    rejectedBookings.clear();
    completedBookings.clear();

    for (var booking in allBookings) {
      final status =
      (booking.status ?? "").toLowerCase().trim();

      // Pending / Accepted bookings
      if (status == "pending" ||
          status == "accepted" ||
          status == "approved" ||
          status == "confirmed") {
        acceptedAndPendingBookings.add(booking);
      }

      // Rejected bookings
      else if (status == "rejected" ||
          status == "cancelled") {
        rejectedBookings.add(booking);
      }

      // Completed bookings
      else if (status == "completed") {
        completedBookings.add(booking);
      }
    }

    debugPrint(
        "Filtering done. Accepted/Pending: ${acceptedAndPendingBookings.length}");
  }

  //======================== Status Color Helper ========================
  // Use this method to show status colors in UI
  Color getStatusColor(String? status) {
    final s = (status ?? "").toLowerCase().trim();

    switch (s) {
      case "pending":
        return Colors.amber; // Yellow

      case "accepted":
      case "approved":
      case "confirmed":
      case "completed":
        return Colors.green; // Green

      case "rejected":
      case "cancelled":
        return Colors.red; // Red

      default:
        return Colors.grey;
    }
  }
}
