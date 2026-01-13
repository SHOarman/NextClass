import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/route/Genaral_Controler/locationController.dart';
import '../../../core/succesfullcontroler/succesfullcontroler.dart'
    show Successfullmsg;
import '../classProvider.dart';

class CreateClassController extends GetxController {
  final UserLocationController locationController =
      Get.find<UserLocationController>();
  final ClassProvider provider = ClassProvider();

  // --- Reactive Variables ---
  var selectedEducationLevel = "Primary".obs;
  var selectedClassSize = "Group".obs;
  var selectedClassType = "Tuition".obs;
  var isLoading = false.obs;

  // Observable for real-time UI updates
  var addressObs = "".obs;

  // --- Text Controllers ---
  final classLevelInputController = TextEditingController();
  final titleController = TextEditingController();
  final detailsController = TextEditingController();
  final locationTextController = TextEditingController();
  final priceController = TextEditingController();
  final dayController = TextEditingController();

  // --- Update Location Data ---
  void setLocationFromMap(double lat, double lng, String address) {
    locationController.latitude.value = lat;
    locationController.longitude.value = lng;

    // Update both controller and observable for UI refresh
    locationTextController.text = address;
    addressObs.value = address;

    update();
  }

  // 🔥 NEW FUNCTION: Clear all inputs
  void clearFields() {
    titleController.clear();
    detailsController.clear();
    classLevelInputController.clear();
    locationTextController.clear();
    priceController.clear();
    dayController.clear();

    // Reset Variables to Default
    selectedEducationLevel.value = "Primary";
    selectedClassSize.value = "Group";
    selectedClassType.value = "Tuition";
    addressObs.value = "";

    update(); // Refresh UI
  }

  // --- Submit Class Function ---
  Future<void> submitClass() async {
    // 1. Basic Validation
    if (titleController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "Please enter class title",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (priceController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "Please enter price",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (dayController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "Please enter day",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (locationTextController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "Please select location",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      // 2. Check GPS if map was not used
      if (locationController.latitude.value == 0.0) {
        await locationController.getUserLocation();
        if (locationController.latitude.value == 0.0) {
          Get.snackbar("Error", "Location is required. Please enable GPS.");
          isLoading.value = false;
          return;
        }
      }

      bool isGroup =
          selectedClassSize.value == "Group" ||
          selectedClassSize.value == "Both";

      // 3. Process Schedule
      List<String> inputDays = dayController.text.split(',');
      List<Map<String, dynamic>> scheduleList = [];

      for (var day in inputDays) {
        String cleanDay = day.trim().toLowerCase();
        if (cleanDay.isNotEmpty) {
          scheduleList.add({
            "day_of_week": cleanDay,
            // "start_time": "14:00:00",
            // "end_time": "15:00:00",
            "is_recurring": true,
          });
        }
      }

      if (scheduleList.isEmpty) {
        scheduleList.add({
          "day_of_week": dayController,
          // "start_time": "14:00:00",
          // "end_time": "15:00:00",
          "is_recurring": true,
        });
      }

      // 4. Prepare API Body
      Map<String, dynamic> body = {
        "title": titleController.text,
        "description": detailsController.text.isEmpty
            ? "No details provided"
            : detailsController.text,
        "subject": titleController.text,
        "level": classLevelInputController.text.isNotEmpty
            ? classLevelInputController.text
            : selectedEducationLevel.value,
        "class_type": selectedClassType.value == "Tuition"
            ? "academic"
            : "enrichment",
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

      // 5. Call API
      final response = await provider.createClass(body);

      // 6. Handle Response
      if (response.statusCode == 201 || response.statusCode == 200) {
        //  CLEAR FIELDS HERE====================================================
        clearFields();

        // Success Dialog
        Get.dialog(
          Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            child: Successfullmsg(
              name: "Successful",
              namedetels: "Class created successfully!",
              bu_name1: "Track class",
              ontap1: () {
                Get.toNamed(AppRoute.home2);
              },
              bu_name2: "Close",
              ontap2: () {

                Get.back();
              },
            ),
          ),
          barrierDismissible: false,
        );
      } else {
        // Error Snackbar
        Get.snackbar(
          "Error",
          "Server Error: ${response.statusText}",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    classLevelInputController.dispose();
    titleController.dispose();
    detailsController.dispose();
    locationTextController.dispose();
    priceController.dispose();
    dayController.dispose();
    super.onClose();
  }
}

