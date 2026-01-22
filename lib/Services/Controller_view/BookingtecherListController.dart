<<<<<<< HEAD
=======
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../Services/api_Services/api_Services.dart';
// // আপনার সঠিক মডেল পাথটি নিশ্চিত করুন
// import '../model_class/bokkingmodelclass.dart';
//
// class Bookingtecherlistcontroller extends GetxController {
//   var isLoading = false.obs;
//   var bookingList = <BookingModel>[].obs;
//   var totalPending = 0.obs;
//
//   @override
//   void onInit() {
//     fetchMyBookings();
//     super.onInit();
//   }
//
//   // ডাটা গ্রুপিং লজিক: একই ক্লাসের বুকিংগুলো একসাথে করা
//   Map<int, List<BookingModel>> get groupedBookings {
//     Map<int, List<BookingModel>> groups = {};
//     for (var booking in bookingList) {
//       int classId = booking.classListing ?? 0;
//       if (!groups.containsKey(classId)) {
//         groups[classId] = [];
//       }
//       groups[classId]!.add(booking);
//     }
//     return groups;
//   }
//
//   Future<void> fetchMyBookings() async {
//     try {
//       isLoading.value = true;
//       final prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//
//       final response = await http.get(
//         Uri.parse(ApiServices.listbokking),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         var jsonData = jsonDecode(response.body);
//         BookingResponseModel responseData = BookingResponseModel.fromJson(jsonData);
//
//         bookingList.assignAll(responseData.results ?? []);
//         totalPending.value = responseData.count ?? 0;
//       }
//       if(bookingList.isNotEmpty) print("First Student: ${bookingList[0].studentName}");
//     } catch (e) {
//       print("Error fetching bookings: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }


>>>>>>> origin/main
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
<<<<<<< HEAD

//======================= API & Model Imports ========================
import '../../../../Services/api_Services/api_Services.dart';
import '../model_class/bokkingmodelclass.dart';

//======================= Booking Teacher List Controller ========================
class Bookingtecherlistcontroller extends GetxController {

  //======================= Observable Variables ========================
  var isLoading = false.obs;                 // Loading indicator
  var bookingList = <BookingModel>[].obs;   // All booking data
  var totalPending = 0.obs;                 // Total booking count

  @override
  void onInit() {
    fetchMyBookings(); // Fetch bookings when controller initializes
    super.onInit();
  }

  //======================= Grouped Booking Logic ========================
  // Groups bookings based on classListing ID
  // Each class will have its own list of bookings
  Map<int, List<BookingModel>> get groupedBookings {
    Map<int, List<BookingModel>> groups = {};

    for (var booking in bookingList) {
      int classId = booking.classListing ?? 0;

      if (!groups.containsKey(classId)) {
        groups[classId] = [];
      }

=======
import '../../../../Services/api_Services/api_Services.dart';
import '../model_class/bokkingmodelclass.dart';

class Bookingtecherlistcontroller extends GetxController {
  var isLoading = false.obs;
  var bookingList = <BookingModel>[].obs;
  var totalPending = 0.obs;

  @override
  void onInit() {
    fetchMyBookings();
    super.onInit();
  }

  // ডাটা গ্রুপিং লজিক
  Map<int, List<BookingModel>> get groupedBookings {
    Map<int, List<BookingModel>> groups = {};
    for (var booking in bookingList) {
      int classId = booking.classListing ?? 0;
      if (!groups.containsKey(classId)) {
        groups[classId] = [];
      }
>>>>>>> origin/main
      groups[classId]!.add(booking);
    }
    return groups;
  }

<<<<<<< HEAD
  //======================= Fetch Booking Data from Server ========================
  Future<void> fetchMyBookings() async {
    try {
      isLoading.value = true;

      // Get stored auth token
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      // API request
=======
  Future<void> fetchMyBookings() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

>>>>>>> origin/main
      final response = await http.get(
        Uri.parse(ApiServices.listbokking),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

<<<<<<< HEAD
      //======================= Success Response ========================
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        // Parse response using model class
        BookingResponseModel responseData =
        BookingResponseModel.fromJson(jsonData);

        // Update booking list
        bookingList.assignAll(responseData.results ?? []);
        totalPending.value = responseData.count ?? 0;

        //======================= Debug Logs ========================
        if (bookingList.isNotEmpty) {
          print("----- Booking Fetch Successful -----");
          print("Total Bookings Found: ${bookingList.length}");
          print("First Student Name: ${bookingList[0].studentName}");
          print("First Student Age: ${bookingList[0].studentAge}");
        }
      } else {
        print(
          "Failed to load bookings. Status Code: ${response.statusCode}",
        );
=======
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        // মডেল ক্লাসের মাধ্যমে ডাটা পার্সিং (মডেলটি আপডেট থাকতে হবে)
        BookingResponseModel responseData = BookingResponseModel.fromJson(jsonData);

        // ✅ লিস্ট আপডেট করা হচ্ছে
        bookingList.assignAll(responseData.results ?? []);
        totalPending.value = responseData.count ?? 0;

        // ✅ ডিবাগিং লজিক: কনসোলে ডাটা চেক করার জন্য
        if (bookingList.isNotEmpty) {
          print("--- Booking Fetch Successful ---");
          print("Total Bookings found: ${bookingList.length}");
          print("First Student Name from Server: ${bookingList[0].studentName}");
          print("First Student Age from Server: ${bookingList[0].studentAge}");
        }
      } else {
        print("Failed to load bookings. Status Code: ${response.statusCode}");
>>>>>>> origin/main
      }
    } catch (e) {
      print("Error fetching bookings: $e");
    } finally {
      isLoading.value = false;
    }
  }

<<<<<<< HEAD
  //======================= Refresh Booking List ========================
  // Can be used for pull-to-refresh or manual reload
  void refreshBookings() {
    fetchMyBookings();
  }
}
=======
  // ✅ অতিরিক্ত লজিক: লিস্ট রিফ্রেশ করার জন্য
  void refreshBookings() {
    fetchMyBookings();
  }
}
>>>>>>> origin/main
