import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../teacher_presentScreen/teacherfirstSecationController/teacherfirstSecationController.dart';

class DateController extends GetxController {
  // 🔹 Reactive variables (obs)
  var fromDate = ''.obs;
  var toDate = ''.obs;

  // Text Controllers for the UI widgets
  // final fromDateController = TextEditingController();
  // final toDateController = TextEditingController();

  var  datecontoller=Get.put(Teacherfirstsecationcontroller());
  // 🔹 Function to pick a date
  Future<void> selectDate(
    BuildContext context, {
    required bool isFromDate,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      // Format: DD-MM-YYYY
      String formattedDate =
          "${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}";

      // 1. Update the Text Controller (visual update in TextField)
      if (isFromDate) {
        datecontoller.fromDateController.text = formattedDate;
        fromDate.value = formattedDate; // Update obs variable
      } else {
        datecontoller.toDateController.text = formattedDate;
        toDate.value = formattedDate; // Update obs variable
      }
    }
  }
  cleartext(){

    datecontoller.fromDateController.clear();
    datecontoller. toDateController.clear();
  }

  @override
  void onClose() {

    datecontoller.fromDateController.dispose();
    datecontoller. toDateController.dispose();
    super.onClose();
  }
}
