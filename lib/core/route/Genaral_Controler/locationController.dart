// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:get/get.dart';
//
// class UserLocationController extends GetxController {
//   // Default address (Image er moto)
//   var currentAddress = "Los Angeles, Street 2/A, USA".obs;
//   var isLoading = false.obs;
//
//   Future<void> getUserLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     isLoading.value = true;
//
//     // 1. Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       Get.snackbar("Error", "Location services are disabled.");
//       isLoading.value = false;
//       return;
//     }
//
//     // 2. Check Permissions
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         Get.snackbar("Error", "Location permission denied");
//         isLoading.value = false;
//         return;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       Get.snackbar("Error", "Location permissions are permanently denied.");
//       isLoading.value = false;
//       return;
//     }
//
//     // 3. Get Current Position
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     // 4. Convert Coordinates to Address (Reverse Geocoding)
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );
//
//       Placemark place = placemarks[0];
//
//       // Address update kora hocche
//       currentAddress.value = "${place.street}, ${place.locality}, ${place.country}";
//
//     } catch (e) {
//       Get.snackbar("Error", "Failed to get address details");
//       print('=================================>.............................$e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }


import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class UserLocationController extends GetxController {

  // --- Variables ---
  var currentAddress = "Fetching address...".obs;
  var latitude = 0.0.obs;  // Required for API
  var longitude = 0.0.obs; // Required for API
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Calls location method as soon as the controller loads
    getUserLocation();
  }

  Future<void> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    isLoading.value = true;

    // 1. Check Service
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Error", "Location services are disabled. Please enable GPS.");
      isLoading.value = false;
      return;
    }

    // 2. Check Permission
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

    // 3. Get Position
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // *** Save coordinates for API ***
      latitude.value = position.latitude;
      longitude.value = position.longitude;

      // 4. Convert to Address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        // Formatting address nicely (including null check)
        currentAddress.value = [
          place.street,
          place.subLocality,
          place.locality,
          place.country
        ].where((element) => element != null && element.isNotEmpty).join(", ");

      } else {
        currentAddress.value = "Address not found";
      }

    } catch (e) {
      Get.snackbar("Error", "Failed to get location");
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}