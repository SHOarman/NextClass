// class ApiServices {
//   ApiServices._();
//
//   static const String baseUrl = 'http://10.10.7.51:8000';
//
//   // Auth Endpoints
//   static const String login = '$baseUrl/api/accounts/auth/login/';
//   static const String register = '$baseUrl/api/accounts/auth/register/';
//   static const String sendOtp = '$baseUrl/api/accounts/auth/resend_otp/';
//   static const String verifyOtp = '$baseUrl/api/accounts/auth/verify_otp/';
//   static const String passwordResetRequest =
//       '$baseUrl/api/accounts/auth/password_reset_request/';
//   static const String passwordResetConfirm =
//       '$baseUrl/api/accounts/auth/password_reset_confirm/';
//
//   static const String parentReg = '$baseUrl/api/auth/register/parent/';
//   static const String tutorReg = '$baseUrl/api/auth/register/tutor/';
//   static const String changepassword =
//       '$baseUrl/api/accounts/users/change_password/';
//
//   static const String uploadocument =
//       "$baseUrl/api/tutors/profiles/upload_document/";
//   static const String updateAcound = "$baseUrl/api/accounts/users/me/";
//
//   static const String createAvailability =
//       "$baseUrl/api/tutors/availability/bulk_create/";
//   static const String topRated = "$baseUrl/api/tutors/profiles/topRated/";
//   static const String featuredtutors = "$baseUrl/api/tutors/profiles/featured/";
//
//   // Create Class URL
//   static const String createClass = '$baseUrl/api/classes/';
//
//   // Bookings
//   static const String bookings = "$baseUrl/api/bookings/";
//
//   static const String techerallclasses = "$baseUrl/api/classes/my_listings/";
//
//   static const String classSummary = "$baseUrl/api/classes/summary/";
//
//   //==========================location ways Parents=================================
//
//   static const String teachersListLocationsWise =
//       "$baseUrl/api/tutors/profiles/nearby/";
//
//   //=====================Booking Secation=========================================
//   static const String createbookings = "$baseUrl/api/bookings/";
//
//   //======================================Classes Nearb============================
//   static const String parentApprovedClasses =
//       "$baseUrl/api/classes/parent-approved-by-admin/";
//   static const String listoffclass = "$baseUrl/api/classes/";
//
//   static const String recommendedClasses =
//       "/api/accounts/parent-profile/active_classes/";
//
//   //=============== Socket Web () ==========================
//
//
//
//   //bokking===========================================================
//   static const String bookingRequest = "$baseUrl/api/bookings/";
//   static const String listbokking = "$baseUrl/api/bookings/";
//   static const String cencelbokking = "$baseUrl/api/bookings/{id}/cancel/";
//   static String confirmBooking(int id) => "/api/bookings/$id/confirm/";
//
//   //==========================review===========================
//
//   static const String reviewAdd = "$baseUrl/api/reviews/";
//
//   //==============msg====================
//   // static const String conversetion="$baseUrl/chat/conversations";
//
//
//
//
//   static const String  get socketBaseUrl {
//     return baseUrl.replaceAll('http', 'ws'); // Output: ws://10.10.7.51:8000
//
//   }
//     // =============== Chat Endpoints ==========================
//
//     // 1. Message list fetch korar jonno
//     // URL format: {{baseURL}}/api/chat/messages/?conversation_id=18
//     static const String chatMessages = "$baseUrl/api/chat/messages/";
//
//     // 2. Conversation list fetch korar jonno
//     static const String conversationsBase = "$baseUrl/api/chat/conversations/";
//
//     // 3. Notun conversation shuru korar jonno
//     // Post body: {"other_user_id": 42, "class_listing_id": 1}
//     static const String startConversation = "$baseUrl/api/chat/conversations/start_conversation/";
//
//     // 4. Message mark as read korar jonno (Dynamic function)
//     // Endpoint: {{baseURL}}/api/chat/conversations/{id}/mark_read/
//     static const String postMarkAsRead(
//         int id) => "$baseUrl/api/chat/conversations/$id/mark_read/";
//
//
//
//
//
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  ApiServices._();

  static const String baseUrl = 'http://10.10.7.51:8000';

  // Auth Endpoints
  static const String login = '$baseUrl/api/accounts/auth/login/';
  static const String register = '$baseUrl/api/accounts/auth/register/';
  static const String sendOtp = '$baseUrl/api/accounts/auth/resend_otp/';
  static const String verifyOtp = '$baseUrl/api/accounts/auth/verify_otp/';
  static const String passwordResetRequest =
      '$baseUrl/api/accounts/auth/password_reset_request/';
  static const String passwordResetConfirm =
      '$baseUrl/api/accounts/auth/password_reset_confirm/';

  static const String parentReg = '$baseUrl/api/auth/register/parent/';
  static const String tutorReg = '$baseUrl/api/auth/register/tutor/';
  static const String changepassword =
      '$baseUrl/api/accounts/users/change_password/';

  static const String uploadocument =
      "$baseUrl/api/tutors/profiles/upload_document/";
  static const String updateAcound = "$baseUrl/api/accounts/users/me/";

  static const String createAvailability =
      "$baseUrl/api/tutors/availability/bulk_create/";
  static const String topRated = "$baseUrl/api/tutors/profiles/topRated/";
  static const String featuredtutors = "$baseUrl/api/tutors/profiles/featured/";

  // Create Class URL
  static const String createClass = '$baseUrl/api/classes/';

  // Bookings
  static const String bookings = "$baseUrl/api/bookings/";
  static const String techerallclasses = "$baseUrl/api/classes/my_listings/";
  static const String classSummary = "$baseUrl/api/classes/summary/";

  //==========================location ways Parents=================================
  static const String teachersListLocationsWise =
      "$baseUrl/api/tutors/profiles/nearby/";

  //=====================Booking Secation=========================================
  static const String createbookings = "$baseUrl/api/bookings/";

  //======================================Classes Nearb============================
  static const String parentApprovedClasses =
      "$baseUrl/api/classes/parent-approved-by-admin/";
  static const String listoffclass = "$baseUrl/api/classes/";
  static const String recommendedClasses =
      "/api/accounts/parent-profile/active_classes/";

  //bokking===========================================================
  static const String bookingRequest = "$baseUrl/api/bookings/";
  static const String listbokking = "$baseUrl/api/bookings/";
  static const String cencelbokking = "$baseUrl/api/bookings/{id}/cancel/";
  static String confirmBooking(int id) => "/api/bookings/$id/confirm/";

  //==========================review===========================
  static const String reviewAdd = "$baseUrl/api/reviews/";

  //==============msg Socket====================
  static String get socketBaseUrl {
    return baseUrl.replaceAll('http', 'ws');
  }

  // =============== Chat Endpoints ==========================
  static const String chatMessages = "$baseUrl/api/chat/messages/";
  static const String conversationsBase = "$baseUrl/api/chat/conversations/";
  static const String startConversation =
      "$baseUrl/api/chat/conversations/start_conversation/";

  //============================================================================
  // ১. getChatMessages: মেসেজ লিস্ট নিয়ে আসার জন্য মেথড
  //============================================================================
  static Future<Map<String, dynamic>?> getChatMessages(
    int conversationId,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await http.get(
        Uri.parse("$chatMessages?conversation_id=$conversationId"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        debugPrint("Chat Messages API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("Chat Messages Exception: $e");
      return null;
    }
  }

  //============================================================================
  // ২. postMarkAsRead: মেসেজ রিড হিসেবে মার্ক করার মেথড
  //============================================================================
  static Future<bool> postMarkAsRead(int id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await http.post(
        Uri.parse("$baseUrl/api/chat/conversations/$id/mark_read/"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      debugPrint("Mark As Read Exception: $e");
      return false;
    }
  }

  //============================================================================
  // ৩. sendMessage: HTTP এর মাধ্যমে মেসেজ পাঠানো (Socket Fallback)
  //============================================================================
  static Future<bool> sendChatMessage(
    int conversationId,
    String message,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await http.post(
        Uri.parse("$chatMessages?conversation_id=$conversationId"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: json.encode({
          "message": message,
        }), // Backend expected format check required
      );

      debugPrint("📤 HTTP Send Response: ${response.statusCode}");
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      debugPrint("❌ HTTP Send Exception: $e");
      return false;
    }
  }

  //============================================================================
  // ৪. startChatConversation: নতুন কনভারসেশন তৈরি বা ফেচ করা
  //============================================================================
  static Future<Map<String, dynamic>?> startChatConversation(
    int otherUserId,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      debugPrint("🚀 Starting Conversation with User ID: $otherUserId");

      final response = await http.post(
        Uri.parse(startConversation),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: json.encode({"other_user_id": otherUserId}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("✅ Conversation Started/Fetched: ${response.body}");
        return json.decode(response.body);
      } else {
        debugPrint("❌ Start Conversation Failed: ${response.statusCode}");
        debugPrint("❌ Body: ${response.body}");
        return null;
      }
    } catch (e) {
      debugPrint("❌ Start Conversation Exception: $e");
      return null;
    }
  }
}
