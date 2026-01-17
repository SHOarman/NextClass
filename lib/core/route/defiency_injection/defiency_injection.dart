import 'package:first_project/Parent_parsentScreen/auth_Screen/auth_controller/auth_controller.dart';
import 'package:first_project/Parent_parsentScreen/auth_Screen/auth_controller/parsent_tutor_reg_controller/parsent_tutor_reg_controller.dart';
import 'package:first_project/Parent_parsentScreen/home_Ui/homedetels/chartdetels/chat_controller_teacher.dart';
import 'package:first_project/Parent_parsentScreen/profile_Screen/profileController/profile_controller.dart';
import 'package:first_project/Services/Controller_view/chartmsg.dart';
import 'package:first_project/Services/Controller_view/home_par_controller.dart';
import 'package:first_project/core/route/general_controller/general_controller.dart';
import 'package:first_project/teacher_presentScreen/Techechercontrler/techercotroler.dart';
import 'package:first_project/teacher_presentScreen/chat2/msg_controller.dart';
import 'package:first_project/teacher_presentScreen/create_newclasses/classCreateController/class_create_controller.dart';
import 'package:first_project/teacher_presentScreen/create_newclasses/class_provider.dart';
import 'package:first_project/teacher_presentScreen/create_newclasses/create_newclasses.dart';
import 'package:first_project/teacher_presentScreen/home_ui/home_controller.dart';
import 'package:get/get.dart';

import '../../succesfullcontroler/succesfullcontroler.dart';
import '../general_controller/imagepickurecontroller.dart';
import '../general_controller/date_controller.dart';
import '../general_controller/teachercontroller.dart';

class DependencyInjection {
  static void bindings() {
    Get.lazyPut(() => GenaralControler());
    //card============1
    Get.lazyPut(() => GenaralController());
    //card2===========================
    Get.lazyPut(() => Card2());
    Get.lazyPut(() => TechSlashController());

    //successful msg----------------
    Get.lazyPut(
      () => Successfullmsg(
        name: '',
        namedetels: '',
        buName1: '',
        ontap1: () {},
        buName2: '',
        ontap2: () {},
      ),
    );

    //card3==========================

    Get.lazyPut(() => BookingController());

    //==================Selecttype===============
    Get.lazyPut(() => SelectType());
   // Get.lazyPut(() => ChatController());
     // Get.lazyPut(() => ChatControllerTeacher());

    //=========================imagepiker===========================
    Get.lazyPut(() => ImagePickureController());
    //=============Datepiker============================
    Get.lazyPut(() => DateController());

    //=====================AuthController=========================================...........>>>>>>>>>>

    Get.lazyPut(() => AuthController());

    //=====================profileController=========================================...........>>>>>>>>>>
    Get.lazyPut(() => ProfileController());

    //======================>>>>>>>>>>>>>>>tutoril===============Controller====================>>>>>>>>>>>>>>>>>>>>>>>>

    Get.lazyPut(() => ParsenttutorRegController());

    //=================firsthome===========================

    Get.lazyPut(() => TeacherController());

    //===================CreateNewclass===================>>>>>>>>>>>>>>>>>>>>>
    Get.lazyPut(() => CreateClassController());

    //=======================ClassProvider===================================
    Get.lazyPut(() => ClassProvider());

    //=========================Techer_HomeController=====================================
    Get.lazyPut(() => HomeController());

    //==================================Classescontroller=============================================
    Get.lazyPut(() => CreateNewclasses());

    //======================================ParentHomeController====================================
   // Get.lazyPut(()=>ParentHomeController());

    //========================chatadata==================================
    Get.lazyPut(()=>Chartmsg());
  }
}
