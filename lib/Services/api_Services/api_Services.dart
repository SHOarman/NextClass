class ApiServices {
  ApiServices._();

  static const String baseUrl = 'http://10.10.7.51:8000';

  // Auth Endpoints
  static const String login = '$baseUrl/api/accounts/auth/login/';
  static const String register = '$baseUrl/api/accounts/auth/register/';
  static const String sendOtp = '$baseUrl/api/accounts/auth/resend_otp/';
  static const String verifyOtp = '$baseUrl/api/accounts/auth/verify_otp/';
  static const String passwordResetRequest = '$baseUrl/api/accounts/auth/password_reset_request/';
  static const String passwordResetConfirm = '$baseUrl/api/accounts/auth/password_reset_confirm/';

  static const String Parentreg = '$baseUrl/api/auth/register/parent/';
  static const String Tutorreg = '$baseUrl/api/auth/register/tutor/';
  static const String changepassword = '$baseUrl/api/accounts/users/change_password/';
  static const String uploadocument = "$baseUrl/api/tutors/profiles/upload_document/";
  static const String updateAcound = "$baseUrl/api/accounts/users/me/";

  static const String Createavailability = "$baseUrl/api/tutors/availability/bulk_create/";
  static const String top_rated = "$baseUrl/api/tutors/profiles/top_rated/";
  static const String featuredtutors = "$baseUrl/api/tutors/profiles/featured/";

  // Create Class URL
  static const String CreateClass = '$baseUrl/api/classes/';

  // Bookings
  static const String bookings = "$baseUrl/api/bookings/";

  static const String techerallclasses = "$baseUrl/api/classes/my_listings/";

  static const String classSummary = "$baseUrl/api/classes/summary/";
}