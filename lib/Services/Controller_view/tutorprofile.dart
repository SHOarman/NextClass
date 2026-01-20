import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model_class/bokkingmodelclass.dart';
import '../model_class/usershow_model.dart';

class TutorPublicProfileController extends GetxController {
  // Variables to support two types of models
  TutorDetails? tutor; // For tutor profile data
  UserAccountDetails? bokking; // For booking-related user data

  @override
  void onInit() {
    super.onInit();
    _loadTutorData(); // Load data from arguments
  }

  // Load data passed via Get.arguments
  void _loadTutorData() {
    var args = Get.arguments;
    debugPrint("Received arguments type: ${args.runtimeType}");

    if (args != null) {
      // If data is TutorDetails type
      if (args is TutorDetails) {
        tutor = args;
        update(); // Update UI
      }
      // If data is UserAccountDetails type (from booking page)
      else if (args is UserAccountDetails) {
        bokking = args;
        update(); // Update UI
      }
      else {
        debugPrint("Error: Arguments did not match any known Model");
      }
    }
  }

  // ==================== Getters for UI ====================

  // Display name
  String get name => tutor?.fullName ?? bokking?.fullName ?? "No Name";

  // Display profile image
  String get image => tutor?.profilePicture ?? bokking?.profilePicture ?? "";

  // Display biography
  String get bio =>
      tutor?.profile?.bio ?? bokking?.profile?.bio ?? "No biography provided.";

  // Display average rating
  double get rating =>
      tutor?.profile?.averageRating ?? bokking?.profile?.averageRating ?? 0.0;
}
