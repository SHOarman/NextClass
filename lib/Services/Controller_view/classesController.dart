import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../teacher_presentScreen/create_newclasses/classProvider.dart';
import '../modelClass.dart'; // Make sure this import is correct

class ClassesController extends GetxController {
  // 1. Initialize Provider
  final ClassProvider provider = ClassProvider();

  // Loading state
  var isLoading = false.obs;

  // 2. Define Lists with specific type 'ListingFeature' to avoid errors
  RxList<ListingFeature> activeList = <ListingFeature>[].obs;
  RxList<ListingFeature> inactiveList = <ListingFeature>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch data when controller starts
    fetchMySpecificClasses();
  }

  void fetchMySpecificClasses() async {
    // Start loading
    isLoading.value = true;

    // Get User ID from Shared Preferences (Optional: Used for verification)
    final prefs = await SharedPreferences.getInstance();
    // int? myUserId = prefs.getInt('userId');

    try {
      // 3. Call the correct API (my_listings)
      final response = await provider.getMyClasses();

      if (response.statusCode == 200) {

        // 4. Decode Data (Handle if body is String or Map)
        var decodedData;
        if (response.body is String) {
          decodedData = jsonDecode(response.body);
        } else {
          decodedData = response.body;
        }

        // 5. Convert JSON to Model
        final responseModel = ListingResponse.fromJson(decodedData);

        // Check if features exist
        if (responseModel.results?.features != null) {

          // Get all features
          List<ListingFeature> allData = responseModel.results!.features!;

          // 6. Filter Active Classes (Status: Approved)
          var approved = allData.where((item) {
            // Check status safely
            return item.properties?.status?.toLowerCase() == 'approved';
          }).toList();

          // 7. Filter Inactive Classes (Status: Pending or Rejected)
          var pendingOrRejected = allData.where((item) {
            String status = item.properties?.status?.toLowerCase() ?? '';
            return status == 'pending' || status == 'rejected';
          }).toList();

          // 8. Update the UI Lists
          activeList.assignAll(approved);
          inactiveList.assignAll(pendingOrRejected);

          // Debug Prints
          print("✅ Data Loaded.");
          print("Active Count: ${activeList.length}");
          print("Inactive Count: ${inactiveList.length}");
        }
      } else {
        print("❌ API Error: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Critical Error: $e");
    } finally {
      // Stop loading
      isLoading.value = false;
    }
  }
}