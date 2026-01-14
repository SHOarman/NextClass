import 'package:get/get.dart';
import '../create_newclasses/classProvider.dart';

class HomeController extends GetxController {
  final ClassProvider provider = ClassProvider();

  // --- Variables ---
  var classList = [].obs;
  var pendingRequestCount = 0.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchActiveClasses();
    fetchPendingRequests();
  }

  void fetchActiveClasses() async {
    isLoading.value = true;
    try {
      final response = await provider.getMyClasses(); // API: /api/classes/my_listings/

      if (response.statusCode == 200) {
        classList.value = response.body;
      } else {
        print("Failed to load classes: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching classes: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void fetchPendingRequests() async {
    try {
      final response = await provider.getAllBookings();

      if (response.statusCode == 200) {
        List data = response.body;


        pendingRequestCount.value = data.length;

      } else {
        print("Failed to load bookings: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching requests: $e");
    }
  }
}