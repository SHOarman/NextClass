class ApiServices {
  // 1. Base URL (Use 'static const' for immutable strings)
  static const String baseUrl = 'http://10.10.7.51:8000';

  // 2. Auth Endpoints
  static const String login = '$baseUrl/api/accounts/auth/login/';

  // Renamed 'Registerurl' to 'register' (standard naming)
  static const String register = '$baseUrl/api/accounts/auth/register/';

  static const String sendOtp = '$baseUrl/api/accounts/auth/resend_otp/';

  // Renamed 'verify_otp' to 'verifyOtp' (lowerCamelCase)
  static const String verifyOtp = '$baseUrl/api/accounts/auth/verify_otp/';

  // Fixed spelling: 'passwordReseed' -> 'passwordResetRequest'
  static const String passwordResetRequest = '$baseUrl/api/accounts/auth/password_reset_request/';

  // Fixed spelling: 'Resedpasswordconfrom' -> 'passwordResetConfirm'
  static const String passwordResetConfirm = '$baseUrl/api/accounts/auth/password_reset_confirm/';
}