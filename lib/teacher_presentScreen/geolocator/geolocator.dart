import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class UserLocationController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  Future<void> getUserLocation() async {
    isLoading.value = true;
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          isLoading.value = false;
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      print("Global Location Set: ${latitude.value}, ${longitude.value}");

    } catch (e) {
      print("Error fetching location: $e");
    } finally {
      isLoading.value = false;
    }
  }
}