import 'package:first_project/Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/bokking_widget/cancal,delect/cancelmodel.dart';
import 'package:first_project/Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/bokkingdetels.dart';
import 'package:first_project/Parent_parsentScreen/home_Ui/homedetels/homedetels.dart';
import 'package:first_project/Parent_parsentScreen/home_Ui/homedetels/myProfiledetels/myProfiledetels.dart';
import 'package:first_project/Parent_parsentScreen/home_Ui/homedetels/seeDetels.dart';
import 'package:first_project/Parent_parsentScreen/profile_Screen/Privacy_Policy/Privacy_Policy.dart';
import 'package:first_project/Parent_parsentScreen/profile_Screen/favoritetutor/favoritetutor.dart';
import 'package:first_project/Parent_parsentScreen/profile_Screen/logoutScreen/logoutScreen.dart';
import 'package:first_project/Parent_parsentScreen/profile_Screen/pervice&privice/pervice&privice.dart';
import 'package:first_project/Parent_parsentScreen/profile_Screen/support_team/support_team.dart';
import 'package:first_project/Parent_parsentScreen/profile_Screen/update_password/update_password.dart';
import 'package:first_project/teacher_presentScreen/home_ui/home_ui.dart';
import 'package:first_project/teacher_presentScreen/myprofileexta/Privacypolicy/Privacypolicy.dart';
import 'package:first_project/teacher_presentScreen/myprofileexta/editprofile2/editprofile2.dart';
import 'package:first_project/teacher_presentScreen/myprofileexta/update_passwordtecher/update_passwordtecher.dart';
import 'package:first_project/teacher_presentScreen/tech_Slash.dart';
import 'package:get/get.dart';
import '../../Parent_parsentScreen/auth_Screen/reg_screen.dart';
import '../../Parent_parsentScreen/auth_Screen/creat_new_password.dart';
import '../../Parent_parsentScreen/auth_Screen/forget_password.dart';
import '../../Parent_parsentScreen/auth_Screen/login_Screen.dart';
import '../../Parent_parsentScreen/auth_Screen/otp_verification.dart';
import '../../Parent_parsentScreen/auth_Screen/regVerifyScreen.dart';
import '../../Parent_parsentScreen/home_Ui/filtermodel/filtermodel.dart';
import '../../Parent_parsentScreen/home_Ui/home_Screen.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/Recommended_page_detes_techer/Recommended_page_detes_techer0.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/Recommended_page_detes_techer/Recommended_page_detes_techer1.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/Recommended_page_detes_techer/Recommended_page_detes_techer2.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/Recommended_page_detes_techer/Recommended_page_detes_techer3.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/accpect/tution_accpectpage/tution_accpectpage1.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/completed/tution_Completed/reviewadd/reviewadd.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/completed/tution_Completed/tusioncomplectfullreviewscreen/tusioncomplectfullreviewscreen.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/completed/tution_Completed/tutionComplectadepage1.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/requestboking.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/requested/tusionRejestiondetels.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/chartdetels/chartdetels.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/chartdetels/chatConationTeacher.dart';
import '../../Parent_parsentScreen/home_Ui/homedetels/expendedpage/expendedpage.dart';
import '../../Parent_parsentScreen/home_Ui/qutionaries Screen.dart';
import '../../Parent_parsentScreen/profile_Screen/delectAccound/delectAccound.dart';
import '../../Parent_parsentScreen/profile_Screen/edit_profile/edit_profile.dart';
import '../../Parent_parsentScreen/profile_Screen/edit_profile/editmodel.dart';
import '../../Parent_parsentScreen/slash_onloding/onlodaing_Screen.dart';
import '../../Parent_parsentScreen/slash_onloding/slash_screen.dart';
import '../../teacher_presentScreen/bokking2/boking_detelsScreen.dart';
import '../../teacher_presentScreen/bokking2/bokking2.dart';
import '../../teacher_presentScreen/chat2/chat2.dart';
import '../../teacher_presentScreen/chat2/convarcation.dart';
import '../../teacher_presentScreen/cleses/activepage.dart';
import '../../teacher_presentScreen/cleses/cleses.dart';
import '../../teacher_presentScreen/cleses/inacriveongoingdetelsScreen.dart';
import '../../teacher_presentScreen/cleses/onlodingdetelsScareen.dart';
import '../../teacher_presentScreen/create_newclasses/create_newclasses.dart';
import '../../teacher_presentScreen/create_newclasses/step1.dart';
import '../../teacher_presentScreen/create_newclasses/step2.dart';
import '../../teacher_presentScreen/create_newclasses/step3.dart';
import '../../teacher_presentScreen/myprofile/myprofile.dart';
import '../../teacher_presentScreen/myprofileexta/Terms_conditions/Terms_conditions.dart';
import '../../teacher_presentScreen/myprofileexta/delet_accound/delet_accoundteacher.dart';
import '../../teacher_presentScreen/myprofileexta/editprofile2/editmodel2.dart';
import '../../teacher_presentScreen/myprofileexta/reviewsecation/reviewsecation.dart';
import '../../teacher_presentScreen/myprofileexta/support_teacherteam/support_teacherteam.dart';

class AppRoute {
  static const String slashscreen = '/slashscreen';
  static const String onloding = '/onloding';

  //=========================authscreen=============================================
  static const String login = '/login';
  static const String reg = '/reg';
  static const String forgetpassword = '/forgetpassword';
  static const String otp = '/otp';
  static const String createnewpassword = '/createnewpassword';
  static const String regVerifyScreen = '/regVerifyScreen';
  static const String regVerifyScreenteacher = '/regVerifyScreenteacher';

  //===========================home==============================================
  static const String home = '/home';

  //===============location=============================================
  static const String allowlocation = '/allowlocation';

  //===============totureal Screeen=============================================

  static const String teachscre = '/teachscre';

  //================my profile==================================================
  static const String updatpassword = '/updatpassword';
  static const String conditions = '/conditions';
  static const String pervice = '/pervice';
  static const String supporteam = '/supporteam';

  static const String favourite = '/favourite';
  static const String delectaccound = '/delectaccound';
  static const String editprofile = '/editprofile';
  static const String editmodel = '/editmodel';

  //====================================homedetels=====================
  static const String homedetels = '/homedetels';
  static const String bokkingdetels = '/bokkingdetels';
  static const String chartdetels = '/chartdetels';
  static const String myProfiledetels = '/myProfiledetels';
  static const String filtermodel = '/filtermodel';
  static const String expadedpage = '/expadedpage';
  static const String requestboking = '/requestboking';
  static const String qutionaries = '/qutionaries';

  //===============homechat=================================================

  static const String chatconation_teacher = '/chatconation_teacher';

  //===========================Recommended_page_detes_techer===================================

  static const String recommendedPageDetesTecher0 =
      '/recommendedPageDetesTecher0';
  static const String recommendedPageDetesTecher1 =
      '/recommendedPageDetesTecher1';
  static const String recommendedPageDetesTecher2 =
      '/recommendedPageDetesTecher2';
  static const String recommendedPageDetesTecher3 =
      '/recommendedPageDetesTecher3';

  //=====================accpectpage====================================================
  static const String tution_accpectpage1 = '/tution_accpectpage1';
  static const String cancel_model = '/cancel_model';

  //=====================Completad====================================================
  static const String tution_complectadepage1 = '/tution_complectadepage1';
  static const String reviewpage = '/reviewpage';
  static const String tusioncomplectfullreviewscreen =
      '/tusioncomplectfullreviewscreen';

  //=====================tacherpage =====================================================
  static const String home2 = '/home2';
  static const String bokking2 = '/bokking2';
  static const String chat2 = '/chat2';
  static const String classes = '/classes';
  static const String myprofile2 = '/myprofile2';
  static const String updateprofile2 = '/updateprofile2';
  static const String Termsconditions2 = '/Termsconditions2';
  static const String Privacypolicy2 = '/Privacypolicy2';
  static const String supporteachetteam = '/supporteachetteam';
  static const String delectteacheraccound = '/delectteacheraccound';
  static const String reviewsecation = '/reviewsecation';
  static const String editprofileteacher = '/editprofileteacher';
  static const String editmodel2 = '/editmodel2';
  static const String onlodingdetelsscreen = '/onlodingdetelsscreen';
  static const String inacriveongoingdetelsscreen =
      '/inacriveongoingdetelsscreen';
  static const String activepage = '/activepage';
  static const String rejectiondetels = '/rejectiondetels';
  //=====================tacherpageauthpage====================================================

  static const creeatnrewpasswordtec = '/creeatnrewpasswordtec';
  static const String forgetpasswordtec = '/forgetpasswordtec';
  static const String loginScreentec = '/loginScreentec';
  static const String otpverifcationtec = '/otpverifcationtec';
  static const String regScrerentec = '/regScrerentec';

  //====================chatdetss================================
  static const String convarcation = '/convarcation';

  static const String seDetels = '/seDetels';
  static const String logoutscreennew = '/logoutscreennew';

  //==============================tec-newclassscreate=================================
  static const String create_newclasses = '/create_newclasses';
  static const String step1 = '/step1';
  static const String step2 = '/step2';
  static const String step3 = '/step3';

  static const String regVerifyScreenallow = '/regVerifyScreenallow';

  //=============Boking detelsScareen==============================
  static const String bokkingdetels2 = '/bokkingdetels2';

  static List<GetPage> mypage = [
    GetPage(name: slashscreen, page: () => const SlashScreen()),
    GetPage(name: onloding, page: () => const OnlodaingScreen()),

    //=========================authscreen============================================
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: reg, page: () => RegScreen()),
    GetPage(name: forgetpassword, page: () => const ForgetPassword()),
    GetPage(name: otp, page: () => const VerifyOtpScreen()),
    GetPage(name: createnewpassword, page: () => const CreatNewPassword()),

    //=============homescreen==============================================
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(
      name: homedetels,
      page: () => Homedetels(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),

    GetPage(name: teachscre, page: () => TechSlash()),

    //================my profile==================================================
    GetPage(name: updatpassword, page: () => UpdatePassword()),
    GetPage(name: conditions, page: () => Perviceprivice()),
    GetPage(name: pervice, page: () => PrivacyPolicy()),
    GetPage(name: supporteam, page: () => SupportTeam()),
    GetPage(name: favourite, page: () => Favoritetutor()),
    GetPage(name: delectaccound, page: () => Delectaccound()),
    GetPage(name: editprofile, page: () => EditProfile()),
    GetPage(name: editmodel, page: () => EditModel()),
    GetPage(name: qutionaries, page: () => Qutionaries()),
    GetPage(name: seDetels, page: () => Seedetels()),
    GetPage(name: logoutscreennew, page: () => Logoutscreennew()),

    //================================================, page: page)

    //====================detels================================
    GetPage(
      name: bokkingdetels,
      page: () => Bokkingdetels(),
      transition: Transition.noTransition,

      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: chartdetels,
      page: () => Chartdetels(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: myProfiledetels,
      page: () => Myprofiledetels(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(name: filtermodel, page: () => Filtermodel()),
    GetPage(name: expadedpage, page: () => Expendedpage()),
    GetPage(name: requestboking, page: () => Requestboking()),

    GetPage(name: chatconation_teacher, page: () => Chatconationteacher()),

    //================================, page: page)

    //=====================tacherpage =====================================================
    GetPage(
      name: home2,
      page: () => HomeUi(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: bokking2,
      page: () => Bokking2(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: chat2,
      page: () => Chat2(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: classes,
      page: () => Cleses(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: myprofile2,
      page: () => Myprofile(),
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
    ),
    GetPage(name: updateprofile2, page: () => UpdatePasswordtecher()),
    GetPage(name: Termsconditions2, page: () => TermsConditions()),
    GetPage(name: Privacypolicy2, page: () => Privacypolicytecher()),
    GetPage(name: supporteachetteam, page: () => SupportTeacherteam()),
    GetPage(name: delectteacheraccound, page: () => DeletAccoundteacher()),
    GetPage(name: reviewsecation, page: () => Reviewsecation()),
    GetPage(name: editprofileteacher, page: () => EditProfile2()),
    GetPage(name: editmodel2, page: () => EditModel2()),

    GetPage(name: onlodingdetelsscreen, page: () => Onlodingdetelsscareen()),
    GetPage(
      name: inacriveongoingdetelsscreen,
      page: () => Inacriveongoingdetelsscreen(),
    ),
    GetPage(name: activepage, page: () => Activepage()),
    GetPage(name: rejectiondetels, page: () => Tusionrejestiondetels()),

    //=====================techerauthscsreen =====================================================

    //============================msgconvasion-============================================
    GetPage(name: convarcation, page: () => ConversationScreen()),

    //==============================tec-newclassscreate=================================
    GetPage(name: create_newclasses, page: () => CreateNewclasses()),
    GetPage(name: step1, page: () => Step1()),
    GetPage(name: step2, page: () => Step2()),
    GetPage(name: step3, page: () => Step3()),

    //=================bokingdetsel Scaren============================
    GetPage(name: bokkingdetels2, page: () => BokingDetelsscreen()),

    //===========================Recommended_page_detes_techer===================================
    GetPage(
      name: recommendedPageDetesTecher0,
      page: () => RecommendedPageDetesTecher0(),
    ),
    GetPage(
      name: recommendedPageDetesTecher1,
      page: () => RecommendedPageDetesTecher1(),
    ),
    GetPage(
      name: recommendedPageDetesTecher2,
      page: () => RecommendedPageDetesTecher2(),
    ),
    GetPage(
      name: recommendedPageDetesTecher3,
      page: () => RecommendedPageDetesTecher3(),
    ),

    //=====================accpectpage====================================================
    GetPage(name: tution_accpectpage1, page: () => TutionAccpectpage1()),

    //=====================Completad====================================================
    GetPage(
      name: tution_complectadepage1,
      page: () => Tutioncomplectadepage1(),
    ),
    GetPage(name: reviewpage, page: () => Reviewadd()),
    GetPage(
      name: tusioncomplectfullreviewscreen,
      page: () => Tusioncomplectfullreviewscreen(),
    ),
    GetPage(name: cancel_model, page: () => CancelModel()),
    GetPage(name: regVerifyScreenallow, page: () => RegScreen()),
    GetPage(name: regVerifyScreen, page: () => Regverifyscreen()),
  ];
}
