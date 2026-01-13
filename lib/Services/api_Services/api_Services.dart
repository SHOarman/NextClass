class ApiServices {

  ApiServices._();


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


  //===============================paresentReg==========================================================
static const String Parentreg='$baseUrl/api/auth/register/parent/';
//===============================tutorReg==========================================================
static const String Tutorreg='$baseUrl/api/auth/register/tutor/';

//======================updatepassword=========================================
  static const String changepassword='$baseUrl/api/accounts/users/change_password/';
  //========================uploaducommend===============================================

static const String uploadocument="$baseUrl/api/tutors/profiles/upload_document/";


//========================updateAcound==============================================
static const String updateAcound="$baseUrl/api/accounts/users/me/";
//================Createavailability===========================
static const String Createavailability="$baseUrl/api/tutors/availability/bulk_create/";

//============top_rated============================================
static const String top_rated ="$baseUrl/api/tutors/profiles/top_rated/";

//========================featuredtutors===============================
 static const String featuredtutors="$baseUrl/api/tutors/profiles/featured/";

 //==============CreateClasss====================================================
static const String CreateClass='$baseUrl/api/classes/';











}