import 'dart:convert';
import 'package:get/get.dart';

import '../../teacher_presentScreen/create_newclasses/class_provider.dart';
import '../model_class/model_class.dart'; // Ensure this import path is correct

class ClassesController extends GetxController {
  // Initialize the API Provider
  final ClassProvider provider = ClassProvider();

  // Observable variable for loading state
  var isLoading = false.obs;

  // 1. Define Lists to store Active and Inactive classes
  // We use RxList<ListingFeature> to specify the type of data
  RxList<ListingFeature> activeList = <ListingFeature>[].obs;
  RxList<ListingFeature> inactiveList = <ListingFeature>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch data when the controller starts
    fetchMySpecificClasses();
  }

  void fetchMySpecificClasses() async {
    // Start the loading indicator
    isLoading.value = true;

    // final prefs = await SharedPreferences.getInstance();
    // You can get the User ID here if needed for further filtering
    // int? myUserId = prefs.getInt('userId');

    try {
      // 2. Call the API to get the list of classes
      // We use getMyClasses() which hits '/api/classes/my_listings/'
      final response = await provider.getMyClasses();

      if (response.statusCode == 200) {
        // 3. Decode the Response Body
        // Handle cases where the body might be a String or a Map
        dynamic decodedData;
        if (response.body is String) {
          decodedData = jsonDecode(response.body);
        } else {
          decodedData = response.body;
        }

        // 4. Convert JSON data to our Model Class
        final responseModel = ListingResponse.fromJson(decodedData);

        // Check if the list of features (classes) is not null
        if (responseModel.results?.features != null) {
          // Get the full list of data
          List<ListingFeature> allData = responseModel.results!.features!;

          // ================= Filtering Logic =================

          // 5. Filter Active Classes
          // Condition: Status must be 'approved'
          var approved = allData.where((item) {
            return item.properties?.status?.toLowerCase() == 'approved';
          }).toList();

          // 6. Filter Inactive Classes
          // Condition: Status must be 'pending' OR 'rejected'
          var pendingOrrejected = allData.where((item) {
            String status = item.properties?.status?.toLowerCase() ?? '';
            return status == 'pending' || status == 'rejected';
          }).toList();

          // 7. Update the UI lists with the filtered data
          activeList.assignAll(approved);
          inactiveList.assignAll(pendingOrrejected);

          // Print result for debugging
          // Print result for debugging
          // print("✅ Active Classes: ${activeList.length}");
          // print("⚠️ Inactive Classes: ${inactiveList.length}");
        }
      } else {
        // print("❌ API Error: ${response.statusCode}");
      }
    } catch (e) {
      // print("❌ Critical Error: $e");
    } finally {
      // 8. Stop the loading indicator
      isLoading.value = false;
    }
  }
}


