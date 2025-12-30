import 'dart:ui';

import 'package:get/get.dart';

class GenaralControler extends GetxController {
  //==================onloding=========================



  RxString selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }

  //===================other==================================

  final RxBool isCheck = false.obs;
  final RxBool isheck = false.obs;

  final RxBool isSucces = false.obs;

  ///////////////////////////Selecttype/===================================

  RxString selectedCard = ''.obs;
  void selectCard(String title) {
    selectedCard.value = title;
  }
}

//card 1====================================

class GenaralController extends GetxController {
  RxString selectedCard = ''.obs;


  void selectCard(String title) {
    selectedCard.value = title;
  }
}

//card 2====================================

class Card2 extends GetxController {
  RxString selectedCard = ''.obs;

  void selectCard2(String title) {
    selectedCard.value = title;
  }
}

//card 3====================================
class card3 extends GetxController {
  RxString selectedCard = ''.obs;

  void selectCard(String title) {
    selectedCard.value = title;
  }
}

//card 4====================================
class card4 extends GetxController {
  RxString selectedCard = ''.obs;

  void selectCard(String title) {
    selectedCard.value = title;
  }
}

class card5 extends GetxController {
  RxString selectedCard = ''.obs;

  void selectCard(String title) {
    selectedCard.value = title;
  }
}

class card6 extends GetxController {
  RxString selectedCard = ''.obs;

  void selectCard(String title) {
    selectedCard.value = title;
  }
}

class BookingController extends GetxController {
  // কোন ট্যাব select হয়েছে
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}

class Selecttype extends GetxController {
  RxString selectedCard = ''.obs;

  void selectCard(String title) {
    selectedCard.value = title;
  }
}
// class Classescreat2 extends GetxController {
//   RxString selectedCard = ''.obs;
//
//   void selectCard(String title) {
//     selectedCard.value = title;
//   }
// }
