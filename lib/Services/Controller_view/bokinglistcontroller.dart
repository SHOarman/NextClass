// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// //========================= API & Models =========================
// import '../../../../Services/api_Services/api_services.dart';
// import '../model_class/bokkingmodelclass.dart';
//
// //========================= Booking List Controller =========================
// class BookingListController extends GetxController {
//
//   //========================= Observable State =========================
//   final isLoading = false.obs;
//
//   // All bookings returned from API
//   final allBookings = <BookingModel>[].obs;
//
//   // Filtered lists by status
//   final acceptedAndPendingBookings = <BookingModel>[].obs;
//   final rejectedBookings = <BookingModel>[].obs;
//   final completedBookings = <BookingModel>[].obs;
//
//   //========================= Lifecycle =========================
//   @override
//   void onInit() {
//     super.onInit();
//     fetchBookings();
//   }
//
//   //========================= Fetch Bookings =========================
//   Future<void> fetchBookings() async {
//     try {
//       isLoading.value = true;
//
//       // Read saved auth token
//       final prefs = await SharedPreferences.getInstance();
//       final String? token = prefs.getString('token');
//
//       if (token == null) {
//         debugPrint('Token not found');
//         return;
//       }
//
//       // API request
//       final response = await http.get(
//         Uri.parse(ApiServices.listbokking),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final jsonData = jsonDecode(response.body);
//         final bookingResponse = BookingResponseModel.fromJson(jsonData);
//
//         // Sync data and apply filters
//         allBookings.assignAll(bookingResponse.results ?? []);
//         _filterData();
//       } else {
//         debugPrint('API Error: ${response.statusCode} - ${response.body}');
//       }
//     } catch (e) {
//       debugPrint('Fetch Error: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   //========================= Filter Logic (Real-time) =========================
//   void _filterData() {
//     acceptedAndPendingBookings.clear();
//     completedBookings.clear();
//     rejectedBookings.clear();
//
//     for (final booking in allBookings) {
//       // Status is already normalized in the model
//       final String status = booking.status ?? '';
//
//       if (status == 'completed' || status == 'finish') {
//         completedBookings.add(booking);
//       } else if (status == 'rejected' || status == 'cancelled') {
//         rejectedBookings.add(booking);
//       } else {
//         // pending / accepted / approved / confirmed
//         acceptedAndPendingBookings.add(booking);
//       }
//     }
//
//     // Ensure UI updates
//     acceptedAndPendingBookings.refresh();
//     completedBookings.refresh();
//     rejectedBookings.refresh();
//
//     // Debug summary
//     debugPrint('--- Filter Summary ---');
//     debugPrint('Total: ${allBookings.length}');
//     debugPrint('Pending/Accepted: ${acceptedAndPendingBookings.length}');
//     debugPrint('Completed: ${completedBookings.length}');
//     debugPrint('Rejected: ${rejectedBookings.length}');
//   }
//
//   //========================= UI Helper: Status Color =========================
//   Color getStatusColor(String? status) {
//     final s = (status ?? '').toLowerCase().trim();
//     switch (s) {
//       case 'pending':
//         return Colors.amber;
//       case 'accepted':
//       case 'approved':
//       case 'confirmed':
//         return Colors.blue;
//       case 'completed':
//         return Colors.green;
//       case 'rejected':
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }
// }



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//========================= API & Models =========================
import '../../../../Services/api_Services/api_services.dart';
import '../model_class/bokkingmodelclass.dart';

//========================= Booking List Controller =========================
class BookingListController extends GetxController {

  //========================= Observable State =========================
  final isLoading = false.obs;

  // All bookings returned from API
  final allBookings = <BookingModel>[].obs;

  // Filtered lists by status
  final acceptedAndPendingBookings = <BookingModel>[].obs;
  final rejectedBookings = <BookingModel>[].obs;
  final completedBookings = <BookingModel>[].obs;

  //========================= Lifecycle =========================
  @override
  void onInit() {
    super.onInit();
    fetchBookings();
  }

  //========================= Fetch Bookings =========================
  Future<void> fetchBookings() async {
    try {
      isLoading.value = true;

      // Read saved auth token
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token == null) {
        debugPrint('Token not found');
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

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final bookingResponse = BookingResponseModel.fromJson(jsonData);

        // Sync data and apply filters
        allBookings.assignAll(bookingResponse.results ?? []);
        _filterData();
      } else {
        debugPrint('API Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      debugPrint('Fetch Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  //========================= Filter Logic (Real-time) =========================
  void _filterData() {
    acceptedAndPendingBookings.clear();
    completedBookings.clear();
    rejectedBookings.clear();

    for (final booking in allBookings) {
      final String status = (booking.status ?? '').toLowerCase().trim();

      if (status == 'completed' || status == 'finish') {
        completedBookings.add(booking);
      } else if (status == 'rejected' || status == 'cancelled') {
        rejectedBookings.add(booking);
      } else {
        // pending / accepted / approved / confirmed
        acceptedAndPendingBookings.add(booking);
      }
    }

    // Ensure UI updates
    acceptedAndPendingBookings.refresh();
    completedBookings.refresh();
    rejectedBookings.refresh();

    debugPrint('--- Filter Summary ---');
    debugPrint('Total: ${allBookings.length}');
    debugPrint('Completed: ${completedBookings.length}');
  }

  //========================= Update Status (Mark as Complete) =========================
  // এই ফাংশনটি আপনার 'Mark as complete' বাটন থেকে কল হবে
  Future<void> updateBookingStatus(int bookingId, String status) async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      // এপিআই এন্ডপয়েন্ট (বুকিং আইডি সহ প্যাচ রিকোয়েস্ট)
      final String url = "${ApiServices.baseUrl}/api/bookings/$bookingId/update_status/";

      final response = await http.patch(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"status": status}), // যেমন: status = 'completed'
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('Status updated successfully to $status');

        // সফলভাবে আপডেট হলে সব ডাটা পুনরায় ফেচ করা হবে যাতে UI আপডেট হয়
        await fetchBookings();

        Get.back(); // ডায়ালগ বন্ধ করা
        Get.snackbar(
          "Success",
          "Booking marked as $status",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      } else {
        debugPrint('Update Error: ${response.statusCode}');
        Get.snackbar("Error", "Failed to update status");
      }
    } catch (e) {
      debugPrint('Update Status Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  //========================= UI Helper: Status Color =========================
  Color getStatusColor(String? status) {
    final s = (status ?? '').toLowerCase().trim();
    switch (s) {
      case 'pending':
        return Colors.amber;
      case 'accepted':
      case 'approved':
      case 'confirmed':
        return Colors.blue;
      case 'completed':
        return Colors.green;
      case 'rejected':
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}