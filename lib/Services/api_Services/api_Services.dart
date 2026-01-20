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

  //=============== Socket Web () ==========================
  static String get socketBaseUrl {
    return baseUrl.replaceAll('http', 'ws');
  }

  static const String chatMessages = "$baseUrl/api/chat/messages/";
  static const String conversationsBase = "$baseUrl/api/chat/conversations/";
  //bokking===========================================================
  static const String bookingRequest = "$baseUrl/api/bookings/";
  static const String listbokking = "$baseUrl/api/bookings/";
  static const String cencelbokking="$baseUrl/api/bookings/{id}/cancel/";
}
