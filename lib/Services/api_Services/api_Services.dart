class ApiServices {

//===================BaseUral==========================================================
  static String baseUrl='http://10.10.7.51:8000';

  //===================Authurl==========================================================

  static String login='$baseUrl/api/accounts/auth/login/';
  static String Registerurl='$baseUrl/api/accounts/auth/register/';
  static String verify_otp='$baseUrl/api/accounts/auth/verify_otp/';
  static String passwordReseed='$baseUrl/api/accounts/auth/password_reset_request/';
  static String Resedpasswordconfrom='$baseUrl/api/accounts/auth/password_reset_confirm/';


}