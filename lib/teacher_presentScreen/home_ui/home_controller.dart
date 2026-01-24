import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Services/model_class/bokkingmodelclass.dart';
import '../create_newclasses/class_provider.dart';

class HomeController extends GetxController {
  // --------------------------
  // State variables
  // --------------------------
  var allBookingData =
      BookingResponseModel().obs; // Stores all bookings (API response)
  final ClassProvider provider = ClassProvider(); // API provider

  var classList = [].obs; // List of active classes for the tutor
  var pendingRequestCount = 0.obs; // Number of pending bookings
  var isLoading = false.obs; // Loading indicator for UI

  // --------------------------
  // Lifecycle: onInit
  // --------------------------
  @override
  void onInit() {
    super.onInit();
    fetchActiveClasses(); // Load active classes for tutor
    fetchPendingRequests(); // Count pending bookings for the tutor
  }

  // ====================
  // FETCH ACTIVE CLASSES
  // ====================
  void fetchActiveClasses() async {
    isLoading.value = true;

    try {
      final response = await provider.getMyClasses();

      if (response.statusCode == 200) {
        // response.body is a Map, not a List
        final Map<String, dynamic> responseData = response.body;

        // Check for 'results' key in the API response
        if (responseData.containsKey('results')) {
          classList.value = responseData['results'];
        } else {
          // If 'results' key is missing, log an error
          debugPrint("Expected 'results' key but not found in response.");
        }
      } else {
        debugPrint("Failed to load classes: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching active classes: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ====================
  // FETCH PENDING BOOKINGS
  // ====================
  // Counts bookings with status "pending" for the current tutor
  void fetchPendingRequests() async {
    try {
      // Get current tutor ID from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      int? currentTutorId = prefs.getInt('user_id');

      final response = await provider.getAllBookings();

      if (response.statusCode == 200) {
        // response.body is a Map
        final Map<String, dynamic> responseData = response.body;

        // Extract list of bookings from 'results' key
        final List allBookings = responseData['results'] ?? [];

        // Filter bookings for:
        // 1. Status is "pending"
        // 2. Tutor ID matches current tutor
        final myPendingList = allBookings.where((booking) {
          bool isPending =
              booking['status'].toString().toLowerCase() == "pending";
          bool isMyTutor = booking['tutor'] == currentTutorId;

          return isPending && isMyTutor;
        }).toList();

        // Update observable count
        pendingRequestCount.value = myPendingList.length;
      }
    } catch (e) {
      debugPrint("Error filtering pending requests: $e");
    }
  }
}
