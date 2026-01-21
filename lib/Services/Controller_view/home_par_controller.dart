// // // import 'dart:convert';
// // // import 'package:first_project/Services/model_class/model_class.dart';
// // // import 'package:first_project/teacher_presentScreen/create_newclasses/class_provider.dart';
// // // import 'package:get/get.dart';
// // // import 'package:first_project/core/route/general_controller/location_controller.dart';
// // //    // আপনার Model (NearbyResponse/ListingFeature)
// // //
// // // class ParentHomeController extends GetxController {
// // //   // ১. লোকেশন কন্ট্রোলার খুঁজে বের করা
// // //   final UserLocationController locationController = Get.find<UserLocationController>();
// // //   final ClassProvider provider = ClassProvider();
// // //
// // //   var isLoading = false.obs;
// // //   var nearbyClasses = <ListingFeature>[].obs; // ডাটা রাখার লিস্ট
// // //
// // //   @override
// // //   void onInit() {
// // //     super.onInit();
// // //     // অ্যাপ চালু হলে যদি লোকেশন আগে থেকেই থাকে, তবে লোড করো
// // //     if (locationController.latitude.value != 0.0) {
// // //       fetchNearbyClasses();
// // //     }
// // //   }
// // //
// // //   // ২. মেইন ফাংশন: যা ১০ কি.মি. রেডিয়াসের ক্লাস আনবে
// // //   Future<void> fetchNearbyClasses() async {
// // //     isLoading.value = true;
// // //
// // //     try {
// // //       // লোকেশন ভ্যালু চেক করা
// // //       double lat = locationController.latitude.value;
// // //       double lng = locationController.longitude.value;
// // //
// // //       if (lat == 0.0 || lng == 0.0) {
// // //         isLoading.value = false;
// // //         return; // লোকেশন না থাকলে API কল করব না
// // //       }
// // //
// // //       print("📍 Fetching classes for Lat: $lat, Lng: $lng within 10km");
// // //
// // //       // ৩. API কল (Radius = 10km)
// // //       final response = await provider.getNearbyClasses(lat, lng, 10.0);
// // //
// // //       if (response.statusCode == 200) {
// // //         // ৪. আপনার Model ব্যবহার করে ডাটা পার্স করা
// // //         var decodedData = response.body;
// // //         if (response.body is String) {
// // //           decodedData = jsonDecode(response.body);
// // //         }
// // //
// // //         // এখানে আপনার NearbyResponse মডেল ব্যবহার করবেন
// // //         // আমি ধরে নিচ্ছি আপনি আগের Model টি ব্যবহার করছেন
// // //         final nearbyData = ListingResponse.fromJson(decodedData);
// // //         // অথবা: final nearbyData = NearbyResponse.fromJson(decodedData); (যদি আলাদা মডেল বানিয়ে থাকেন)
// // //
// // //         if (nearbyData.results?.features != null) {
// // //
// // //           // ৫. শুধু Approved ক্লাসগুলো নেওয়া
// // //           var approvedClasses = nearbyData.results!.features!.where((item) {
// // //             return item.properties?.status?.toLowerCase() == 'approved';
// // //           }).toList();
// // //
// // //           nearbyClasses.assignAll(approvedClasses);
// // //         }
// // //       }
// // //     } catch (e) {
// // //       print("Error fetching nearby classes: $e");
// // //     } finally {
// // //       isLoading.value = false;
// // //     }
// // //   }
// // // }
// // import 'dart:convert';
// // import 'package:get/get.dart';
// // import 'package:first_project/Services/model_class/model_class.dart';
// // import 'package:first_project/teacher_presentScreen/create_newclasses/class_provider.dart';
// // import 'package:first_project/core/route/general_controller/location_controller.dart';
// //
// // class ParentHomeController extends GetxController {
// //   //====================== Dependency Injection ========================
// //   final UserLocationController locationController = Get.find<UserLocationController>();
// //   final ClassProvider provider = ClassProvider();
// //
// //   //====================== Reactive Variables ========================
// //   var isLoading = false.obs;
// //   // নিশ্চিত করুন ListingFeature ক্লাসটি আপনার মডেলে ইমপোর্ট করা আছে
// //   var nearbyClasses = <ListingFeature>[].obs;
// //
// //   //====================== Lifecycle Methods ========================
// //   @override
// //   void onInit() {
// //     super.onInit();
// //
// //     // 🔥 FIX: লোকেশন পরিবর্তন হলে অটোমেটিক API কল হবে
// //     // অ্যাপ অন করার পর লোকেশন ০ থেকে যখন আসল লোকেশনে আপডেট হবে, তখন এটি কল হবে।
// //     ever(locationController.latitude, (lat) {
// //       if (lat != 0.0 && nearbyClasses.isEmpty) {
// //         fetchNearbyClasses();
// //       }
// //     });
// //
// //     // যদি অলরেডি লোকেশন থাকে, তবে এখনই কল করো
// //     if (locationController.latitude.value != 0.0) {
// //       fetchNearbyClasses();
// //     }
// //   }
// //
// //   //====================== Fetch Nearby Classes Logic ========================
// //   Future<void> fetchNearbyClasses() async {
// //     // লোডিং শুরু করার আগে চেক করুন লোকেশন আছে কিনা
// //     double lat = locationController.latitude.value;
// //     double lng = locationController.longitude.value;
// //
// //     if (lat == 0.0 || lng == 0.0) {
// //       print("⚠️ Location not found, waiting for updates...");
// //       return;
// //     }
// //
// //     isLoading.value = true;
// //     print("📍 Fetching classes for Lat: $lat, Lng: $lng within 10km");
// //
// //     try {
// //       final response = await provider.getNearbyClasses(lat, lng, 10.0);
// //
// //       if (response.statusCode == 200) {
// //         var decodedData = response.body;
// //         if (response.body is String) {
// //           decodedData = jsonDecode(response.body);
// //         }
// //
// //         // মডেল পার্সিং (GeoJSON ফরম্যাট অনুযায়ী)
// //         final nearbyData = ListingResponse.fromJson(decodedData);
// //
// //         if (nearbyData.results?.features != null) {
// //
// //           // 🔥 ফিল্টারিং লজিক (Status Approved)
// //           var approvedClasses = nearbyData.results!.features!.where((item) {
// //             // Null Safety Check added
// //             return item.properties?.status?.toLowerCase() == 'approved';
// //           }).toList();
// //
// //           nearbyClasses.assignAll(approvedClasses);
// //           print("✅ Total Approved Classes: ${approvedClasses.length}");
// //
// //         } else {
// //           print("⚠️ No features found in response.");
// //           nearbyClasses.clear();
// //         }
// //       } else {
// //         print("❌ API Error: ${response.statusCode} - ${response.statusText}");
// //       }
// //     } catch (e) {
// //       print("❌ Error fetching nearby classes: $e");
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// // }
//
// // import 'dart:convert';
// // import 'package:get/get.dart';
// // // আপনার প্রজেক্টের পাথ অনুযায়ী ইমপোর্ট চেক করুন
// // import 'package:first_project/Services/model_class/model_class.dart';
// // import 'package:first_project/teacher_presentScreen/create_newclasses/class_provider.dart';
// // import 'package:first_project/core/route/general_controller/location_controller.dart';
// //
// // class ParentHomeController extends GetxController {
// //   //====================== Dependency Injection ========================
// //   final UserLocationController locationController = Get.find<UserLocationController>();
// //   final ClassProvider provider = ClassProvider();
// //
// //   //====================== Reactive Variables ========================
// //   var isLoading = false.obs;
// //   // এখানে ListingFeature টাইপ ব্যবহার করা হয়েছে
// //   var nearbyClasses = <ListingFeature>[].obs;
// //
// //   //====================== Lifecycle Methods ========================
// //   @override
// //   void onInit() {
// //     super.onInit();
// //
// //     // 1. Worker: লোকেশন আপডেট হওয়ার সাথে সাথে API কল হবে
// //     ever(locationController.latitude, (lat) {
// //       if (lat != 0.0 && locationController.longitude.value != 0.0) {
// //         fetchNearbyClasses();
// //       }
// //     });
// //
// //     // প্রথমবার চেক (যদি অ্যাপ ওপেন করার সময় অলরেডি লোকেশন থাকে)
// //     if (locationController.latitude.value != 0.0) {
// //       fetchNearbyClasses();
// //     }
// //   }
// //
// //   //====================== Fetch Nearby Classes Logic ========================
// //   Future<void> fetchNearbyClasses() async {
// //     // লোডিং বাফার চেক
// //     if (isLoading.value) return;
// //
// //     isLoading.value = true;
// //
// //     try {
// //       double lat = locationController.latitude.value;
// //       double lng = locationController.longitude.value;
// //
// //       print("📍 API calling for: $lat, $lng");
// //
// //       // ১০ কি.মি. রেডিয়াস সেট করা হয়েছে
// //       final response = await provider.getNearbyClasses(lat, lng, 10.0);
// //
// //       if (response.statusCode == 200) {
// //         var decodedData = response.body;
// //         // যদি রেসপন্স স্ট্রিং হয়, তবে জেসন ডিকোড করে নিন
// //         if (response.body is String) {
// //           decodedData = jsonDecode(response.body);
// //         }
// //
// //         // মডেল পার্সিং
// //         final nearbyData = ListingResponse.fromJson(decodedData);
// //
// //         // ✅ পরিবর্তন: নতুন মডেলে results নিজেই একটি List, তাই features খোঁজার দরকার নেই
// //         if (nearbyData.results != null) {
// //
// //           // যদি আপনি অ্যাপের ভেতরেই 'Approved' ফিল্টার করতে চান:
// //           // var approvedOnly = nearbyData.results!.where((item) => item.properties?.status?.toLowerCase() == 'approved').toList();
// //           // nearbyClasses.assignAll(approvedOnly);
// //
// //           // অথবা সরাসরি সব ডাটা দেখাতে চাইলে:
// //           nearbyClasses.assignAll(nearbyData.results!);
// //
// //           print("✅ Data Loaded: ${nearbyClasses.length}");
// //         } else {
// //           print("⚠️ No results found.");
// //           nearbyClasses.clear();
// //         }
// //
// //       } else {
// //         print("❌ API Error: ${response.statusCode} - ${response.statusText}");
// //       }
// //     } catch (e) {
// //       print("❌ Error fetching classes: $e");
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// // }
//
//
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:first_project/core/route/general_controller/location_controller.dart';
//
// // ✅ আপনার নতুন মডেল ফাইলটি ইমপোর্ট করুন (ClassFeatureResponse ও ClassFeature যেখানে আছে)
// import '../model_class/usershow_model.dart';
// import 'nearby_classcontroller.dart';
//
// class ParentHomeController extends GetxController {
//   final UserLocationController locationController = Get.find<UserLocationController>();
//   final NearbyClassProvider provider = NearbyClassProvider();
//
//   var isLoading = false.obs;
//
//   // ✅ এখন লিস্টের টাইপ হবে ClassFeature (নতুন GeoJSON মডেল অনুযায়ী)
//   var nearbyClasses = <ClassFeature>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     // ইউজার লোকেশন আপডেট হলে ডাটা ফেচ হবে
//     ever(locationController.latitude, (lat) {
//       if (lat != 0.0 && nearbyClasses.isEmpty) fetchApprovedClasses();
//     });
//
//     if (locationController.latitude.value != 0.0) fetchApprovedClasses();
//   }
//
//   void fetchApprovedClasses() async {
//     double myLat = locationController.latitude.value;
//     double myLng = locationController.longitude.value;
//
//     if (myLat == 0.0) return;
//
//     isLoading.value = true;
//     try {
//       // এপিআই কল: {{baseURL}}/api/classes/
//       final response = await provider.getNearbyClasses(myLat, myLng, 10.0);
//
//       if (response.statusCode == 200) {
//         var decodedData = response.body is String ? jsonDecode(response.body) : response.body;
//
//         // ✅ GeoJSON রেসপন্স পার্স করা
//         final modelResponse = ClassFeatureResponse.fromJson(decodedData);
//
//         if (modelResponse.results.isNotEmpty) {
//           // ১. শুধু 'approved' ক্লাস এবং ১০ কিমি ফিল্টার
//           var filtered = modelResponse.results.where((item) {
//
//             // ডাটাবেস থেকে আসা স্ট্যাটাস চেক
//             bool isApproved = item.properties.status.toLowerCase() == 'approved';
//
//             // আপনার নতুন মডেলে geometry থেকে ল্যাট-লং বের করার লজিক (যদি সরাসরি মডেলে না থাকে)
//             // অথবা ডাটাবেস থেকে সরাসরি properties এ latitude/longitude থাকলে সেটি ব্যবহার করুন।
//             // আপনার দেওয়া JSON অনুযায়ী অক্ষাংশ/দ্রাঘিমাংশ সরাসরি properties এ নেই,
//             // তাই geometry থেকে POINT ডাটা পার্স করতে হবে অথবা এপিআই থেকে সরাসরি ল্যাট-লং আনতে হবে।
//
//             // দূরত্ব মাপা (ধরে নিচ্ছি আপনার ClassFeature এ latitude ও longitude ফিল্ড আছে)
//             double distanceInMeters = Geolocator.distanceBetween(
//                 myLat, myLng,
//                 item.properties.latitude, // নিশ্চিত করুন মডেলে এই ফিল্ড দুটি ম্যাপ করেছেন
//                 item.properties.longitude
//             );
//
//             return isApproved && distanceInMeters <= 10000; // ১০ কিমি
//           }).toList();
//
//           nearbyClasses.assignAll(filtered);
//           print("✅ Nearby Approved Classes: ${nearbyClasses.length}");
//         }
//       }
//     } catch (e) {
//       print("❌ Error in ParentHomeController: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
//
