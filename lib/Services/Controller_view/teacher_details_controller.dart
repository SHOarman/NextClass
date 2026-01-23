import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Services/model_class/usershow_model.dart';

class TeacherDetailsController extends GetxController {
  //================= Reactive variable to hold class data ========================
  final _classData = Rxn<ClassFeature>();

  //================= Getter for easy access in UI ========================
  ClassFeature? get classData => _classData.value;

  @override
  void onInit() {
    super.onInit();

    //================= Check if arguments are passed and assign to reactive variable ========================
    if (Get.arguments != null && Get.arguments is ClassFeature) {
      _classData.value = Get.arguments;

      //================= Debug print tutor full name ========================
      debugPrint("Tutor Name: ${classData?.properties.tutorDetails.fullName}");
    }
    //================= Handle missing or invalid data ========================
    else {
      debugPrint("Error: No valid ClassFeature data passed!");
    }
  }
}
