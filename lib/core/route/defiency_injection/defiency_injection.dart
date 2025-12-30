import 'package:first_project/core/route/Genaral_Controler/Genaral_Controler.dart';
import 'package:first_project/teacher_presentScreen/Techechercontrler/techercotroler.dart';
import 'package:get/get.dart';

import '../../../Parent_parsentScreen/home_Ui/homedetels/chartdetels/chatControllerTeacher.dart';
import '../../../Services/auth_Controller/auth_Controller.dart';
import '../../../teacher_presentScreen/chat2/msgController.dart';
import '../../succesfullcontroler/succesfullcontroler.dart';
import '../Genaral_Controler/imagepickurecontroller.dart';

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
    Get.lazyPut(()=>ChatController());
    Get.lazyPut(()=>Chatcontrollerteacher());


    //=========================imagepiker===========================
    Get.lazyPut(() => ImagePickureController());


    //=====================AuthController=========================================...........>>>>>>>>>>

    Get.lazyPut(() => Authcontroller());
  }
}
