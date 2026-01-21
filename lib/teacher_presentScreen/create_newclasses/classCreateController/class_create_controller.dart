import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_project/core/route/general_controller/location_controller.dart';
import 'package:first_project/core/route/route.dart';
import 'package:first_project/Services/Controller_view/create_a_class.dart'; // ⚠️ Check this import path
import '../../../core/succesfullcontroler/succesfullcontroler.dart' show Successfullmsg;
import '../class_provider.dart';

class CreateClassController extends GetxController {

  //====================== Dependency Injection ========================
  final UserLocationController locationController = Get.find<UserLocationController>();
  final ClassProvider provider = ClassProvider();

  //====================== Reactive Variables ========================
  var selectedEducationLevel = "Primary".obs;
  var selectedClassSize = "Group".obs;
  var selectedClassType = "Tuition".obs;
  var isLoading = false.obs;
  var addressObs = "".obs;

  //====================== Text Controllers ========================
  final classLevelInputController = TextEditingController();
  final titleController = TextEditingController();
  final detailsController = TextEditingController();
  final locationTextController = TextEditingController();
  final priceController = TextEditingController();
  final dayController = TextEditingController();

  //====================== Set Location from Map ========================
  void setLocationFromMap(double lat, double lng, String address) {
    locationController.latitude.value = lat;
    locationController.longitude.value = lng;
    locationTextController.text = address;
    addressObs.value = address;
    update();
  }

  //====================== Clear Form Fields ========================
  void clearFields() {
    titleController.clear();
    detailsController.clear();
    classLevelInputController.clear();
    locationTextController.clear();
    priceController.clear();
    dayController.clear();

    // Reset selections
    selectedEducationLevel.value = "Primary";
    selectedClassSize.value = "Group";
    selectedClassType.value = "Tuition";
    addressObs.value = "";

    update();
  }

  //====================== Submit Class Logic ========================
  Future<void> submitClass() async {

    // 1. Validate Inputs
    if (titleController.text.isEmpty) {
      Get.snackbar("Required", "Please enter a title", backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }
    if (priceController.text.isEmpty) {
      Get.snackbar("Required", "Please enter a price", backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }
    if (dayController.text.isEmpty) {
      Get.snackbar("Required", "Please enter days (e.g. Monday, Friday)", backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }
    if (locationTextController.text.isEmpty) {
      Get.snackbar("Required", "Please select a location", backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    isLoading.value = true;

    try {
      // 2. Ensure Location is Valid
      if (locationController.latitude.value == 0.0) {
        await locationController.getUserLocation();
        if (locationController.latitude.value == 0.0) {
          Get.snackbar("Error", "Location Required. Please enable GPS.", backgroundColor: Colors.redAccent, colorText: Colors.white);
          isLoading.value = false;
          return;
        }
      }

      // 3. Prepare Logic (Group vs Individual)
      bool isGroup = selectedClassSize.value == "Group" || selectedClassSize.value == "Both";

      // 4. Parse Schedule Days (Comma separated)
      List<String> inputDays = dayController.text.split(',');
      List<Map<String, dynamic>> scheduleList = [];
      for (var day in inputDays) {
        String cleanDay = day.trim().toLowerCase();
        if (cleanDay.isNotEmpty) {
          scheduleList.add({"day_of_week": cleanDay, "is_recurring": true});
        }
      }

      // 5. Construct API Body
      Map<String, dynamic> body = {
        "title": titleController.text,
        "description": detailsController.text.isEmpty ? "No details provided" : detailsController.text,
        "subject": titleController.text,
        "level": classLevelInputController.text.isNotEmpty ? classLevelInputController.text : selectedEducationLevel.value,
        "class_type": selectedClassType.value == "Tuition" ? "academic" : "enrichment",
        "price_per_hour": double.tryParse(priceController.text) ?? 0.0,
        "postal_code": "1212",
        "location": {
          "type": "Point",
          "coordinates": [
            locationController.longitude.value,
            locationController.latitude.value,
          ],
        },
        "address": locationTextController.text,
        "venue_name": locationTextController.text,
        "is_group_class": isGroup,
        "max_students": isGroup ? 10 : 1,
        "duration_minutes": 60,
        "schedules": scheduleList,
      };

      // 6. Call API
      final response = await provider.createClass(body);

      // 7. Handle Response
      if (response.statusCode == 201 || response.statusCode == 200) {
        // Success: Clear fields
        clearFields();

        // Refresh List if controller is active
        if (Get.isRegistered<ClassesController>()) {
          Get.find<ClassesController>().fetchMySpecificClasses();
        }

        // Show Success Dialog
        Get.dialog(
          Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(10),
            child: Successfullmsg(
              name: "Successful",
              namedetels: "Class created successfully!",
              buName1: "Track class",
              ontap1: () {
                Get.back(); // Close dialog
                Get.toNamed(AppRoute.home2);
              },
              buName2: "Close",
              ontap2: () {
                Get.back();
              },
            ),
          ),
          barrierDismissible: false,
        );
      } else {
        // Server Error
        Get.snackbar(
          "Error",
          "Server Error: ${response.statusText}",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Exception Error
      Get.snackbar("Error", "Something went wrong", backgroundColor: Colors.redAccent, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // Dispose controllers if needed
    titleController.dispose();
    detailsController.dispose();
    classLevelInputController.dispose();
    locationTextController.dispose();
    priceController.dispose();
    dayController.dispose();
    super.onClose();
  }
}