// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../Services/model_class/usershow_model.dart';
//
// class TeacherDetailsController extends GetxController {
//   // Reactive variable to hold the class data
//   final _classData = Rxn<ClassFeature>();
//
//   // Getter to access data easily from the UI
//   ClassFeature? get classData => _classData.value;
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     // Check if arguments are passed correctly
//     if (Get.arguments != null && Get.arguments is ClassFeature) {
//       _classData.value = Get.arguments;
//
//       // ✅ Corrected: accessing fullName via tutorDetails
//       // properties এর ভেতর সরাসরি fullName নেই, এটি tutorDetails এর ভেতরে আছে।
//       debugPrint(
//         "Data Received in Controller: ${classData?.properties.tutorDetails.fullName}",
//       );
//     } else {
//       debugPrint("Error: No valid ClassFeature data passed!");
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Services/model_class/usershow_model.dart';

class TeacherDetailsController extends GetxController {
  final _classData = Rxn<ClassFeature>();
  ClassFeature? get classData => _classData.value;

  @override
  void onInit() {
    super.onInit();

    // আর্গুমেন্ট চেক এবং ডাটা অ্যাসাইন
    if (Get.arguments != null && Get.arguments is ClassFeature) {
      _classData.value = Get.arguments;
      debugPrint("Tutor Name: ${classData?.properties.tutorDetails.fullName}"); //
    } else {
      debugPrint("Error: No valid ClassFeature data passed!");
    }
  }
}