import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model_class/bokkingmodelclass.dart';

//======================== Booking Details Controller ========================
class BookingDetailsController extends GetxController {

  //======================== Booking Data ========================
  // Holds booking details received from previous screen
  late BookingModel bookingData;

  @override
  void onInit() {
    super.onInit();

    //======================== Receive Navigation Argument ========================
    // Get booking data passed through Get.arguments
    bookingData = Get.arguments;
  }
}
