import 'package:first_project/Services/api_Services/api_Services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassProvider extends GetConnect {
  @override
  void onInit() {
    // 1. Set Base URL and Timeout
    httpClient.baseUrl = ApiServices.baseUrl;
    httpClient.timeout = const Duration(seconds: 30);
  }

  // ================= 1. Create Class (POST) =================
  Future<Response> createClass(Map<String, dynamic> body) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    print("🚀 API Call: Creating Class...");

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    // Post request to create a new class
    return post(ApiServices.CreateClass, body, headers: headers);
  }

  // ================= 2. Get My Listings (Original) =================
  // Calls /api/classes/my_listings/ (used for fetching teacher's classes)
  Future<Response> getMyClasses() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return get(ApiServices.techerallclasses, headers: headers);
  }

  // ================= 3. Get Class Summary (ACTIVE/INACTIVE LOGIC) =================
  Future<Response> getClassSummary() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // Using direct path here to avoid modifying the ApiServices file
    return get('/api/classes/summary/', headers: headers);
  }

  // ================= 4. Get Bookings (Other Logic) =================
  // This is for the booking list (not for Active/Inactive classes)
  Future<Response> getAllBookings() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    return get(ApiServices.bookings, headers: headers);
  }
}