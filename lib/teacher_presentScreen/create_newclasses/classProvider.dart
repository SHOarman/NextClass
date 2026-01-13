import 'package:first_project/Services/api_Services/api_Services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassProvider extends GetConnect {

  @override
  void onInit() {
    // Initialize Base URL and Timeout settings
    httpClient.baseUrl = ApiServices.baseUrl;
    httpClient.timeout = const Duration(seconds: 30);
  }

  Future<Response> createClass(Map<String, dynamic> body) async {
    // 1. Retrieve the saved token from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    // 2. Debug print to check execution
    print("🚀 API Call: Creating Class...");
    print("🔑 Token Found: $token");

    // 3. Prepare standard Request Headers
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // 4. Attach the Authorization Header if the token exists
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    } else {
      print("⚠️ Warning: Token is NULL! User might need to login.");
    }

    // 5. Send the POST Request with headers and body
    return post(
        ApiServices.CreateClass,
        body,
        headers: headers
    );
  }
}