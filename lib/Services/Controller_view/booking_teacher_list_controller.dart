import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api_Services/api_services.dart';
import '../model_class/bokkingmodelclass.dart';

class Bookingtecherlistcontroller extends GetxController {
  //================= Loading state ========================
  var isLoading = false.obs;

  //================= Main booking list ========================
  var bookingList = <BookingModel>[].obs;

  //================= Search query for filtering ========================
  var searchQuery = "".obs;

  //================= Status based filtered lists ========================
  var pendingBookings = <BookingModel>[].obs;
  var acceptedBookings = <BookingModel>[].obs;
  var rejectedBookings = <BookingModel>[].obs;

  @override
  void onInit() {
    //================= Fetch bookings on controller init ========================
    fetchMyBookings();
    super.onInit();
  }

  //================= Update search query ========================
  void updateSearchQuery(String query) {
    searchQuery.value = query.toLowerCase().trim();
  }

  //================= Apply status based filters ========================
  void _applyFilters() {
    pendingBookings.clear();
    acceptedBookings.clear();
    rejectedBookings.clear();

    for (var booking in bookingList) {
      final String status = (booking.status ?? "").toLowerCase().trim();

      if (status == "pending") {
        pendingBookings.add(booking);
      } else if (status == "accepted" ||
          status == "confirmed" ||
          status == "approved") {
        acceptedBookings.add(booking);
      } else if (status == "rejected" || status == "cancelled") {
        rejectedBookings.add(booking);
      }
    }

    pendingBookings.refresh();
    acceptedBookings.refresh();
    rejectedBookings.refresh();
  }

  //================= Fetch teacher bookings from API ========================
  Future<void> fetchMyBookings() async {
    try {
      isLoading.value = true;

      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) return;

      final response = await http.get(
        Uri.parse(ApiServices.listbokking),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        BookingResponseModel responseData = BookingResponseModel.fromJson(
          jsonData,
        );

        bookingList.assignAll(responseData.results ?? []);

        //================= Update filtered lists ========================
        _applyFilters();
      }
    } catch (e) {
      debugPrint("Fetch Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  //================= Group bookings by class ID ========================
  Map<int, List<BookingModel>> get groupedBookings {
    Map<int, List<BookingModel>> groups = {};

    for (var booking in bookingList) {
      int classId = booking.classListing ?? 0;
      groups.putIfAbsent(classId, () => []);
      groups[classId]!.add(booking);
    }

    return groups;
  }
}
