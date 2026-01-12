import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Classcreatecontroller extends GetxController {
  final TextEditingController tuitionontroller = TextEditingController();
  final TextEditingController enrichmentclasscontroller =
      TextEditingController();
  final TextEditingController dayofweekcontroller = TextEditingController();

  Future<void> addClass() async {
    try {
      var body = {
        'email': tuitionontroller.text,
        'password': enrichmentclasscontroller.text,
        'address': dayofweekcontroller.text,
      };
      print("Login Body: $body");

      print(body);
      var headers = {'Content-Type': 'application/json'};

      var result = await http.post(
        Uri.parse('YOUR_API_URL_HERE'),
        body: jsonEncode(body),
        headers: headers,
      );

      //===========condition=======data====================================

      if (result.statusCode == 200) {
        var data = jsonDecode(result.body);
        print(data);

        clear();

        // Optional: Show a success message
        Get.snackbar("Success", "Class added successfully");
      } else {
        print("Failed with status: ${result.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // This method clears the text fields
  void clear() {
    tuitionontroller.clear();
    enrichmentclasscontroller.clear();
    dayofweekcontroller.clear();
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CreateClassController extends GetxController {
//   // --- Step Management ---
//   var currentStep = 0.obs;
//
//   // --- Step 1 Data ---
//   var selectedLevel = "Primary".obs; // Default
//   var selectedGroupType = "Individual".obs; // Default
//
//   // --- Step 2 Data ---
//   var classType = "Tuition".obs;
//   TextEditingController titleController = TextEditingController();
//
//   // --- Step 3 Data ---
//   TextEditingController subjectController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController dayController = TextEditingController();
//
//   // --- Navigation Logic ---
//   void nextStep() {
//     if (currentStep.value < 2) {
//       currentStep.value++;
//     } else {
//       submitClass();
//     }
//   }
//
//   void previousStep() {
//     if (currentStep.value > 0) {
//       currentStep.value--;
//     }
//   }
//
//   void goToStep(int step) {
//     currentStep.value = step;
//   }
//
//   // --- API Submit Logic ---
//   void submitClass() async {
//     print("Submitting...");
//     print("Title: ${titleController.text}");
//     print("Price: ${priceController.text}");
//     print("Level: ${selectedLevel.value}");
//
//     // TODO: Call Provider Here
//   }
//
//   @override
//   void onClose() {
//     titleController.dispose();
//     subjectController.dispose();
//     priceController.dispose();
//     dayController.dispose();
//     super.onClose();
//   }
// }