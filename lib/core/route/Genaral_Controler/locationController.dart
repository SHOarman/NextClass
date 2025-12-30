import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class UserLocationController extends GetxController {
  // Default address (Image er moto)
  var currentAddress = "Los Angeles, Street 2/A, USA".obs;
  var isLoading = false.obs;

  Future<void> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    isLoading.value = true;

    // 1. Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Error", "Location services are disabled.");
      isLoading.value = false;
      return;
    }

    // 2. Check Permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Error", "Location permission denied");
        isLoading.value = false;
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Error", "Location permissions are permanently denied.");
      isLoading.value = false;
      return;
    }

    // 3. Get Current Position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // 4. Convert Coordinates to Address (Reverse Geocoding)
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];

      // Address update kora hocche
      currentAddress.value = "${place.street}, ${place.locality}, ${place.country}";

    } catch (e) {
      Get.snackbar("Error", "Failed to get address details");
      print('=================================>.............................$e');
    } finally {
      isLoading.value = false;
    }
  }
}