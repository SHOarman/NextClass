// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:first_project/core/route/general_controller/location_controller.dart';
// import '../model_class/usershow_model.dart';
// import 'nearby_classcontroller.dart';
//
// class ParentHomeController extends GetxController {
//
//   // Location controller instance
//   final UserLocationController locationController =
//   Get.find<UserLocationController>();
//
//   // API provider
//   final NearbyClassProvider provider = NearbyClassProvider();
//
//   // UI state
//   var isLoading = false.obs;
//   var nearbyClasses = <ClassFeature>[].obs;
//
//   final count = 0.obs;
//
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     // Automatically fetch data when location changes
//     ever(locationController.latitude, (lat) {
//       if (lat != 0.0 && nearbyClasses.isEmpty) {
//         fetchApprovedClasses();
//       }
//     });
//
//     // Fetch immediately if location already exists
//     if (locationController.latitude.value != 0.0) {
//       fetchApprovedClasses();
//     }
//   }
//
//   // Helper method to extract latitude & longitude from geometry string
//   Map<String, double> _parseGeometry(String geometry) {
//     try {
//       final coordsString = geometry.split('(').last.split(')').first;
//       final coords = coordsString.split(' ');
//       return {
//         'lng': double.parse(coords[0]),
//         'lat': double.parse(coords[1]),
//       };
//     } catch (e) {
//       return {'lng': 0.0, 'lat': 0.0};
//     }
//   }
//
//   // Fetch approved nearby classes based on user location
//   Future<void> fetchApprovedClasses() async {
//     double myLat = locationController.latitude.value;
//     double myLng = locationController.longitude.value;
//
//     if (myLat == 0.0) {
//       debugPrint("⚠️ Location not available yet.");
//       return;
//     }
//
//     isLoading.value = true;
//
//     try {
//       final response = await provider.getNearbyClasses(
//         myLat,
//         myLng,
//         10.0,
//       );
//
//       if (response.statusCode == 200) {
//         var decodedData = response.body is String
//             ? jsonDecode(response.body)
//             : response.body;
//
//         final modelResponse =
//         ClassFeatureResponse.fromJson(decodedData);
//
//         if (modelResponse.results.isNotEmpty) {
//           var filtered = modelResponse.results.where((item) {
//
//             // Check class approval status
//             bool isApproved =
//                 item.properties.status.toLowerCase() == 'approved';
//
//             // Parse geometry coordinates
//             var coords = _parseGeometry(item.geometry);
//             double classLat = coords['lat']!;
//             double classLng = coords['lng']!;
//
//             if (classLat == 0.0) return false;
//
//             // Calculate distance from user
//             double distanceInMeters = Geolocator.distanceBetween(
//               myLat,
//               myLng,
//               classLat,
//               classLng,
//             );
//
//             return isApproved && distanceInMeters <= 10000;
//           }).toList();
//
//           nearbyClasses.assignAll(filtered);
//         } else {
//           nearbyClasses.clear();
//         }
//       }
//     } catch (e) {
//       debugPrint("❌ fetchApprovedClasses Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:first_project/core/route/general_controller/location_controller.dart';
import '../model_class/usershow_model.dart';
import 'nearby_classcontroller.dart';

class ParentHomeController extends GetxController {

  // Location controller instance
  final UserLocationController locationController =
  Get.find<UserLocationController>();

  // API provider
  final NearbyClassProvider provider = NearbyClassProvider();

  // UI state
  var isLoading = false.obs;
  var nearbyClasses = <ClassFeature>[].obs;

  final count = 0.obs;


  @override
  void onInit() {
    super.onInit();

    // Automatically fetch data when location changes
    ever(locationController.latitude, (lat) {
      if (lat != 0.0 && nearbyClasses.isEmpty) {
        fetchApprovedClasses();
      }
    });

    // Fetch immediately if location already exists
    if (locationController.latitude.value != 0.0) {
      fetchApprovedClasses();
    }
  }

  // Helper method to extract latitude & longitude from geometry string
  Map<String, double> _parseGeometry(String geometry) {
    try {
      final coordsString = geometry.split('(').last.split(')').first;
      final coords = coordsString.split(' ');
      return {
        'lng': double.parse(coords[0]),
        'lat': double.parse(coords[1]),
      };
    } catch (e) {
      return {'lng': 0.0, 'lat': 0.0};
    }
  }

  // Fetch approved nearby classes based on user location
  Future<void> fetchApprovedClasses() async {
    double myLat = locationController.latitude.value;
    double myLng = locationController.longitude.value;

    if (myLat == 0.0) {
      debugPrint("⚠️ Location not available yet.");
      return;
    }

    isLoading.value = true;

    try {
      final response = await provider.getNearbyClasses(
        myLat,
        myLng,
        10.0,
      );

      if (response.statusCode == 200) {
        var decodedData = response.body is String
            ? jsonDecode(response.body)
            : response.body;

        final modelResponse =
        ClassFeatureResponse.fromJson(decodedData);

        if (modelResponse.results.isNotEmpty) {
          var filtered = modelResponse.results.where((item) {

            // Check class approval status
            bool isApproved =
                item.properties.status.toLowerCase() == 'approved';

            // Parse geometry coordinates
            var coords = _parseGeometry(item.geometry);
            double classLat = coords['lat']!;
            double classLng = coords['lng']!;

            if (classLat == 0.0) return false;

            // Calculate distance from user
            double distanceInMeters = Geolocator.distanceBetween(
              myLat,
              myLng,
              classLat,
              classLng,
            );

            return isApproved && distanceInMeters <= 10000;
          }).toList();

          nearbyClasses.assignAll(filtered);
        } else {
          nearbyClasses.clear();
        }
      }
    } catch (e) {
      debugPrint("❌ fetchApprovedClasses Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}