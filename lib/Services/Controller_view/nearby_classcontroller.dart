import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:first_project/Services/api_Services/api_Services.dart';

class NearbyClassProvider extends GetConnect {
  @override
  void onInit() {
    // 1. Base URL Setup
    httpClient.baseUrl = ApiServices.baseUrl;
    httpClient.timeout = const Duration(seconds: 30);

    // 2. Request Modifier (Token অটোমেটিক সব রিকোয়েস্টে অ্যাড হবে)
    httpClient.addRequestModifier<dynamic>((request) async {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      request.headers['Content-Type'] = 'application/json';
      request.headers['accept'] = 'application/json';

      // টোকেন থাকলে হেডারে যুক্ত করা
      if (token != null && token.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      print("🚀 Calling API: ${request.url}");
      return request;
    });
  }

  //====================== Get Nearby Classes ========================
  Future<Response> getNearbyClasses(double lat, double lng, double radius) {
    Map<String, dynamic> query = {
      "lat": lat.toString(),
      "lng": lng.toString(),
      "radius": radius.toString(),
    };

    return get(ApiServices.parentApprovedClasses, query: query);
  }
}