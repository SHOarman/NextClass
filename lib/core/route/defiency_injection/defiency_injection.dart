import 'package:first_project/core/route/Genaral_Controler/genaral_controler.dart';
import 'package:first_project/teacher_presentScreen/Techechercontrler/techercotroler.dart';
import 'package:first_project/teacher_presentScreen/create_newclasses/classCreateController/classCreateController.dart';
import 'package:first_project/teacher_presentScreen/create_newclasses/create_newclasses.dart';
import 'package:get/get.dart';

import '../../../Parent_parsentScreen/auth_Screen/auth_Controller/authController.dart';
import '../../../Parent_parsentScreen/auth_Screen/auth_Controller/parsent_tutorReg_Controller/parsent_tutorReg_Controller.dart';
import '../../../Parent_parsentScreen/home_Ui/homedetels/chartdetels/chatControllerTeacher.dart';

import '../../../Parent_parsentScreen/profile_Screen/profileController/profileController.dart';
import '../../../teacher_presentScreen/chat2/msgController.dart';
import '../../../teacher_presentScreen/create_newclasses/classProvider.dart';
import '../../../teacher_presentScreen/home_ui/homeController.dart';
import '../../succesfullcontroler/succesfullcontroler.dart';
import '../Genaral_Controler/imagepickurecontroller.dart';
import '../Genaral_Controler/date_controller.dart';
import '../Genaral_Controler/teachercontroller.dart';

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
        bu_name1: '',
        ontap1: () {},
        bu_name2: '',
        ontap2: () {},
      ),
    );

    //card3==========================

    Get.lazyPut(() => BookingController());

    //==================Selecttype===============
    Get.lazyPut(() => Selecttype());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => Chatcontrollerteacher());

    //=========================imagepiker===========================
    Get.lazyPut(() => ImagePickureController());
    //=============Datepiker============================
    Get.lazyPut(() => DateController());

    //=====================AuthController=========================================...........>>>>>>>>>>

    Get.lazyPut(() => Authcontroller());

    //=====================profileController=========================================...........>>>>>>>>>>
    Get.lazyPut(() => Profilecontroller());

    //======================>>>>>>>>>>>>>>>tutoril===============Controller====================>>>>>>>>>>>>>>>>>>>>>>>>

    Get.lazyPut(() => ParsentTutorregController());

    //=================firsthome===========================

    Get.lazyPut(() => Teachercontroller());

    //===================CreateNewclass===================>>>>>>>>>>>>>>>>>>>>>
    Get.lazyPut(() => CreateClassController());

    //=======================ClassProvider===================================
    Get.lazyPut(() => ClassProvider());

    //=========================Techer_HomeController=====================================
    Get.lazyPut(() => HomeController());

    //==================================Classescontroller=============================================
    Get.lazyPut(() => CreateNewclasses());
  }
}
