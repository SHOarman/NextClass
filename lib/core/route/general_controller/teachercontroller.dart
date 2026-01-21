import 'package:get/get.dart';

class TeacherController extends GetxController{


  RxString selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }

  //===================other==================================

  final RxBool isCheck = false.obs;
  final RxBool isheck = false.obs;

  final RxBool isSucces = false.obs;

  ///////////////////////////SelectType/===================================

  RxString selectedCard = ''.obs;
  void selectCard(String title) {
    selectedCard.value = title;
  }





}
