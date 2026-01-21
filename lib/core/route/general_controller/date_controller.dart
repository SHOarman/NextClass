import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../Parent_parsentScreen/auth_Screen/auth_controller/parsent_tutor_reg_controller/parsent_tutor_reg_controller.dart';

class DateController extends GetxController {
  // 🔹 Reactive variables (obs)
  var fromDate = ''.obs;
  var toDate = ''.obs;

  // Text controllers for the UI widgets
  // final fromDateController = TextEditingController();
  // final toDateController = TextEditingController();

  final ParsenttutorRegController parsenttutorRegController = Get.put(
    ParsenttutorRegController(),
  );

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
      // ✅ FIX: Server expects DD/MM/YYYY (Slash instead of Hyphen)
      String formattedDate =
          "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";

      if (isFromDate) {
        parsenttutorRegController.fromDateController.text = formattedDate;
        fromDate.value = formattedDate; // Update obs variable
      } else {
        parsenttutorRegController.toDateController.text = formattedDate;
        toDate.value = formattedDate; // Update obs variable
      }
    }
  }
}
