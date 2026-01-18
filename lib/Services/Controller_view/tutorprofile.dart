// //======================= Imports ============================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model_class/usershow_model.dart'; // Ensure correct path

class TutorPublicProfileController extends GetxController {
  // //======================= Observable Data ============================
  // Nullable variable to avoid LateInitializationError
  TutorDetails? tutor;

  @override
  void onInit() {
    super.onInit();
    // //======================= Initialization Logic ============================
    _loadTutorData();
  }

  void _loadTutorData() {
    // Safely retrieve the tutor object passed via Get.toNamed() arguments
    if (Get.arguments != null && Get.arguments is TutorDetails) {
      tutor = Get.arguments;

      // Log for debugging purposes
      debugPrint("Successfully loaded profile for: ${tutor?.fullName}");

      // Notify GetBuilder listeners to rebuild the UI
      update();
    } else {
      debugPrint("Error: No TutorDetails object found in Get.arguments");
    }
  }
}
