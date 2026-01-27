// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:image_picker/image_picker.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import '../../../Services/api_Services/api_services.dart'; // পাথটি চেক করে নিন
// //
// // class ProfileController extends GetxController {
// //   // ================= ✅ REACTIVE VARIABLES ✅ =================
// //   var address = "Loading location...".obs; // ✅ লোকেশন ভেরিয়েবল
// //   var fullName = "Loading...".obs;
// //   var email = "Loading...".obs;
// //   var profileImgUrl = "".obs;
// //   var bio = "No bio available".obs;
// //
// //   // Image Picker Variables
// //   Rx<XFile?> pickedImage = Rx<XFile?>(null);
// //   var selectedImagePath = ''.obs;
// //
// //   // Getter to check if a local file is picked
// //   bool get hasImage => pickedImage.value != null;
// //
// //   // ================= ✅ CONTROLLERS ✅ =================
// //   final TextEditingController editProfileController = TextEditingController();
// //   final TextEditingController bioController = TextEditingController();
// //   final TextEditingController currentPassController = TextEditingController();
// //   final TextEditingController changeNewPassController = TextEditingController();
// //   final TextEditingController changeConfirmPassController = TextEditingController();
// //
// //   final ImagePicker _picker = ImagePicker();
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     getUserData(); // প্রথমবার ডাটা লোড করার জন্য
// //   }
// //
// //   // ================= ✅ GET USER DATA API ✅ =================
// //   Future<void> getUserData() async {
// //     final SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String? token = prefs.getString('token');
// //
// //     if (token == null) return;
// //
// //     try {
// //       var url = Uri.parse("${ApiServices.baseUrl}/api/accounts/users/me/");
// //
// //       var response = await http.get(
// //         url,
// //         headers: {
// //           'Content-Type': 'application/json',
// //           'Authorization': 'Bearer $token',
// //         },
// //       );
// //
// //       if (response.statusCode == 200) {
// //         var data = jsonDecode(response.body);
// //
// //         // ১. বেসিক ইনফো আপডেট
// //         fullName.value = data['full_name'] ?? "No Name";
// //         email.value = data['email'] ?? "No email";
// //
// //         // ২. ✅ লোকেশন/অ্যাড্রেস আপডেট (সার্ভার ডাটা অনুযায়ী)
// //         // আপনার সার্ভার থেকে যদি 'address' বা প্রোফাইলের ভেতরে 'address' আসে সেটি এখানে সেট করুন
// //         if (data['address'] != null) {
// //           address.value = data['address'];
// //         } else if (data['profile'] != null && data['profile']['address'] != null) {
// //           address.value = data['profile']['address'];
// //         } else {
// //           address.value = "Location not set";
// //         }
// //
// //         // ৩. ইমেজ আপডেট
// //         if (data['profile_picture'] != null) {
// //           profileImgUrl.value = data['profile_picture'];
// //         }
// //
// //         // ৪. বায়ো আপডেট (Nested Profile object থেকে)
// //         if (data['profile'] != null && data['profile']['bio'] != null) {
// //           bio.value = data['profile']['bio'];
// //         } else {
// //           bio.value = "No bio added yet.";
// //         }
// //
// //         // টেক্সট কন্ট্রোলারে ডাটা সেট করা
// //         editProfileController.text = fullName.value;
// //         bioController.text = bio.value;
// //
// //       } else {
// //         address.value = "Location not available";
// //       }
// //     } catch (e) {
// //       address.value = "Error loading location";
// //     }
// //   }
// //
// //   // ================= IMAGE PICKER =================
// //   Future<void> pickImg() async {
// //     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
// //     if (image != null) {
// //       pickedImage.value = image;
// //       selectedImagePath.value = image.path;
// //     }
// //   }
// //
// //   // ================= ✅ UPDATE PROFILE API ✅ =================
// //   Future<void> updateProfile() async {
// //     final SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String? token = prefs.getString('token');
// //
// //     if (token == null) return;
// //
// //     bool isSuccess = false;
// //
// //     try {
// //       var headers = {
// //         'Content-Type': 'application/json',
// //         'Authorization': 'Bearer $token',
// //       };
// //
// //       // নাম এবং বায়ো আপডেট করার বডি
// //       Map<String, dynamic> body = {
// //         "full_name": editProfileController.text,
// //         "profile": {
// //           "bio": bioController.text,
// //         },
// //       };
// //
// //       var response = await http.patch(
// //         Uri.parse(ApiServices.updateAcound),
// //         headers: headers,
// //         body: jsonEncode(body),
// //       );
// //
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         isSuccess = true;
// //         fullName.value = editProfileController.text;
// //         bio.value = bioController.text;
// //       }
// //     } catch (e) {
// //       debugPrint("Update Error: $e");
// //     }
// //
// //     // ইমেজ আপডেট করার লজিক (Multipart)
// //     if (selectedImagePath.value.isNotEmpty) {
// //       try {
// //         var request = http.MultipartRequest('PATCH', Uri.parse(ApiServices.updateAcound));
// //         request.headers.addAll({'Authorization': 'Bearer $token'});
// //         var file = await http.MultipartFile.fromPath('profile_picture', selectedImagePath.value);
// //         request.files.add(file);
// //
// //         var streamedResponse = await request.send();
// //         var response = await http.Response.fromStream(streamedResponse);
// //
// //         if (response.statusCode == 200 || response.statusCode == 201) {
// //           isSuccess = true;
// //           var data = jsonDecode(response.body);
// //           if (data['profile_picture'] != null) {
// //             profileImgUrl.value = data['profile_picture'];
// //           }
// //           pickedImage.value = null;
// //           selectedImagePath.value = '';
// //         }
// //       } catch (e) {
// //         debugPrint("Image Upload Error: $e");
// //       }
// //     }
// //
// //     if (isSuccess) {
// //       Get.back();
// //       Get.snackbar("Success", "Profile Updated Successfully!", backgroundColor: Colors.greenAccent);
// //       getUserData(); // ডাটা পুনরায় সিঙ্ক করার জন্য
// //     } else {
// //       Get.snackbar("Error", "Update Failed. Please try again.", backgroundColor: Colors.redAccent);
// //     }
// //   }
// //
// //   // ================= LOAD DATA HELPER =================
// //   void loadCurrentData() {
// //     editProfileController.text = fullName.value;
// //     bioController.text = bio.value;
// //   }
// //
// //   // ================= CHANGE PASSWORD =================
// //   void changePassword() async {
// //     final SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String? token = prefs.getString('token');
// //
// //     if (token == null) return;
// //
// //     if (currentPassController.text.isEmpty || changeNewPassController.text.isEmpty) {
// //       Get.snackbar("Required", "Fill all fields", backgroundColor: Colors.redAccent);
// //       return;
// //     }
// //
// //     try {
// //       var body = {
// //         "old_password": currentPassController.text,
// //         "new_password": changeNewPassController.text,
// //       };
// //
// //       var response = await http.post(
// //         Uri.parse(ApiServices.changepassword),
// //         body: jsonEncode(body),
// //         headers: {
// //           'Content-Type': 'application/json',
// //           'Authorization': 'Bearer $token',
// //         },
// //       );
// //
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         currentPassController.clear();
// //         changeNewPassController.clear();
// //         Get.back();
// //         Get.snackbar("Success", "Password Changed", backgroundColor: Colors.greenAccent);
// //       } else {
// //         Get.snackbar("Error", "Failed to change password", backgroundColor: Colors.redAccent);
// //       }
// //     } catch (e) {
// //       Get.snackbar("Error", "Network Error", backgroundColor: Colors.redAccent);
// //     }
// //   }
// // }
//
//
//
//
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:geolocator/geolocator.dart'; // ✅ ফোনের লোকেশনের জন্য
// import 'package:geocoding/geocoding.dart';   // ✅ অক্ষাংশ থেকে ঠিকানা বের করার জন্য
// import '../../../Services/api_Services/api_services.dart';
//
// class ProfileController extends GetxController {
//   var userId = 0.obs;
//   // ================= ✅ REACTIVE VARIABLES ✅ =================
//   var address = "Fetching location...".obs; // ✅ রিয়েল-টাইম লোকেশন
//   var fullName = "Loading...".obs;
//   var email = "Loading...".obs;
//   var profileImgUrl = "".obs;
//   var bio = "No bio available".obs;
//
//   // ইমেজ পিকার ভেরিয়েবল
//   Rx<XFile?> pickedImage = Rx<XFile?>(null);
//   var selectedImagePath = ''.obs;
//
//   bool get hasImage => pickedImage.value != null;
//
//   // ================= ✅ CONTROLLERS ✅ =================
//   final TextEditingController editProfileController = TextEditingController();
//   final TextEditingController bioController = TextEditingController();
//   final TextEditingController currentPassController = TextEditingController();
//   final TextEditingController changeNewPassController = TextEditingController();
//   final TextEditingController changeConfirmPassController = TextEditingController();
//
//   final ImagePicker _picker = ImagePicker();
//
//   @override
//   void onInit() {
//     super.onInit();
//     getUserData();       // সার্ভার থেকে ইউজার ডাটা আনা
//     getCurrentLocation(); // ✅ ফোনের জিপিএস লোকেশন নেওয়া
//   }
//
//   // ================= ✅ ফোনের রিয়েল-টাইম লোকেশন লজিক ✅ =================
//   Future<void> getCurrentLocation() async {
//     try {
//       // ১. পারমিশন চেক ও রিকোয়েস্ট
//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           address.value = "Permission denied";
//           return;
//         }
//       }
//
//       if (permission == LocationPermission.deniedForever) {
//         address.value = "Location permissions are permanently denied";
//         return;
//       }
//
//       // ২. বর্তমান জিপিএস পজিশন নেওয়া
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high
//       );
//
//       // ৩. অক্ষাংশ/দ্রাঘিমাংশকে মানুষের পড়ার যোগ্য ঠিকানায় রূপান্তর
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//           position.latitude,
//           position.longitude
//       );
//
//       if (placemarks.isNotEmpty) {
//         Placemark place = placemarks[0];
//         // সিটি এবং কান্ট্রি ফরম্যাটে সেট করা (উদা: Dhaka, Bangladesh)
//         address.value = "${place.locality}, ${place.country}";
//       }
//     } catch (e) {
//       address.value = "Location error";
//       debugPrint("Location Error: $e");
//     }
//   }
//
//   // ================= ✅ GET USER DATA API ✅ =================
//   Future<void> getUserData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//
//     if (token == null) return;
//
//     try {
//       var url = Uri.parse("${ApiServices.baseUrl}/api/accounts/users/me/");
//       var response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         userId.value = data['id'] ?? 0;
//
//         fullName.value = data['full_name'] ?? "No Name";
//         email.value = data['email'] ?? "No email";
//
//         // প্রোফাইল পিকচার আপডেট
//         if (data['profile_picture'] != null) {
//           profileImgUrl.value = data['profile_picture'];
//         }
//
//         // বায়ো আপডেট (Nested Profile object চেক করা হচ্ছে)
//         if (data['profile'] != null && data['profile']['bio'] != null) {
//           bio.value = data['profile']['bio'];
//         } else {
//           bio.value = "No bio added yet.";
//         }
//
//         // এডিট কন্ট্রোলারে ভ্যালু সেট করা
//         editProfileController.text = fullName.value;
//         bioController.text = bio.value;
//
//       }
//     } catch (e) {
//       debugPrint("Error fetching user data: $e");
//     }
//   }
//
//   // ================= ✅ IMAGE PICKER ✅ =================
//   Future<void> pickImg() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       pickedImage.value = image;
//       selectedImagePath.value = image.path;
//     }
//   }
//
//   // ================= ✅ UPDATE PROFILE API ✅ =================
//   Future<void> updateProfile() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//     if (token == null) return;
//
//     bool isSuccess = false;
//
//     // ১. টেক্সট ডাটা আপডেট (নাম ও বায়ো)
//     try {
//       var body = {
//         "full_name": editProfileController.text,
//         "profile": {
//           "bio": bioController.text,
//         },
//       };
//
//       var response = await http.patch(
//         Uri.parse(ApiServices.updateAcound),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//         body: jsonEncode(body),
//       );
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         isSuccess = true;
//         fullName.value = editProfileController.text;
//         bio.value = bioController.text;
//       }
//     } catch (e) {
//       debugPrint("Update Text Error: $e");
//     }
//
//     // ২. ইমেজ আপডেট (Multipart Request)
//     if (selectedImagePath.value.isNotEmpty) {
//       try {
//         var request = http.MultipartRequest('PATCH', Uri.parse(ApiServices.updateAcound));
//         request.headers.addAll({'Authorization': 'Bearer $token'});
//
//         var file = await http.MultipartFile.fromPath('profile_picture', selectedImagePath.value);
//         request.files.add(file);
//
//         var streamedResponse = await request.send();
//         var response = await http.Response.fromStream(streamedResponse);
//
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           isSuccess = true;
//           var data = jsonDecode(response.body);
//           if (data['profile_picture'] != null) {
//             profileImgUrl.value = data['profile_picture'];
//           }
//           // ক্লিয়ার লোকাল সিলেকশন
//           pickedImage.value = null;
//           selectedImagePath.value = '';
//         }
//       } catch (e) {
//         debugPrint("Image Upload Error: $e");
//       }
//     }
//
//     if (isSuccess) {
//       Get.back();
//       Get.snackbar("Success", "Profile Updated Successfully!", backgroundColor: Colors.greenAccent);
//       getUserData(); // পুনরায় ডাটা সিঙ্ক করা
//     } else {
//       Get.snackbar("Error", "Update Failed. Please try again.", backgroundColor: Colors.redAccent);
//     }
//   }
//
//   // ================= ✅ CHANGE PASSWORD API ✅ =================
//   void changePassword() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//
//     if (token == null) return;
//
//     if (currentPassController.text.isEmpty || changeNewPassController.text.isEmpty) {
//       Get.snackbar("Required", "Fill all fields", backgroundColor: Colors.redAccent);
//       return;
//     }
//
//     try {
//       var body = {
//         "old_password": currentPassController.text,
//         "new_password": changeNewPassController.text,
//       };
//
//       var response = await http.post(
//         Uri.parse(ApiServices.changepassword),
//         body: jsonEncode(body),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         currentPassController.clear();
//         changeNewPassController.clear();
//         Get.back();
//         Get.snackbar("Success", "Password Changed", backgroundColor: Colors.greenAccent);
//       } else {
//         Get.snackbar("Error", "Failed to change password", backgroundColor: Colors.redAccent);
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Network Error", backgroundColor: Colors.redAccent);
//     }
//   }
//
//   void loadCurrentData() {
//     editProfileController.text = fullName.value;
//     bioController.text = bio.value;
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../../Services/api_Services/api_services.dart';

class ProfileController extends GetxController {
  // চ্যাট স্ক্রিনে 'myId' এর জন্য এই ভ্যারিয়েবলটি ব্যবহৃত হবে
  var userId = 0.obs;

  // ================= ✅ REACTIVE VARIABLES ✅ =================
  var address = "Fetching location...".obs;
  var fullName = "Loading...".obs;
  var email = "Loading...".obs;
  var profileImgUrl = "".obs;
  var bio = "No bio available".obs;
  var isLoading = false.obs; // লোডিং স্টেট দেখানোর জন্য নতুন লজিক

  // ইমেজ পিকার ভেরিয়েবল
  Rx<XFile?> pickedImage = Rx<XFile?>(null);
  var selectedImagePath = ''.obs;

  bool get hasImage => pickedImage.value != null;

  // ================= ✅ CONTROLLERS ✅ =================
  final TextEditingController editProfileController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController changeNewPassController = TextEditingController();
  final TextEditingController changeConfirmPassController =
      TextEditingController();

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    getUserData(); // সার্ভার থেকে ইউজার ডাটা এবং আইডি আনা
    getCurrentLocation(); // ফোনের জিপিএস লোকেশন আপডেট করা
  }

  // ================= ✅ ফোনের রিয়েল-টাইম লোকেশন লজিক ✅ =================
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          address.value = "Permission denied";
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        address.value = "Location permissions are permanently denied";
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        // সিটি এবং কান্ট্রি ফরম্যাটে সেট করা
        address.value = "${place.locality}, ${place.country}";
      }
    } catch (e) {
      address.value = "Location error";
      debugPrint("Location Error: $e");
    }
  }

  // ================= ✅ GET USER DATA API ✅ =================
  // ProfileController এর getUserData মেথড আপডেট
  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) return;

    try {
      isLoading.value = true;
      var url = Uri.parse("${ApiServices.baseUrl}/api/accounts/users/me/");
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // ✅ চ্যাট স্ক্রিনে 'isMe' চেক করার জন্য এই আইডিটি সেট করা জরুরি
        userId.value = data['id'] ?? 0;
        fullName.value = data['full_name'] ?? "No Name";

        if (data['profile_picture'] != null) {
          profileImgUrl.value = data['profile_picture'];
        }

        // ডাটা রিফ্রেশ করা যাতে অন্য স্ক্রিনগুলো আপডেট পায়
        userId.refresh();
        fullName.refresh();

        editProfileController.text = fullName.value;
      }
    } catch (e) {
      debugPrint("Error fetching user data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ================= ✅ IMAGE PICKER ✅ =================
  Future<void> pickImg() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = image;
      selectedImagePath.value = image.path;
    }
  }

  // ================= ✅ UPDATE PROFILE API ✅ =================
  Future<void> updateProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) return;

    isLoading.value = true;
    bool isSuccess = false;

    // ১. নাম ও বায়ো আপডেট
    try {
      var body = {
        "full_name": editProfileController.text,
        "profile": {"bio": bioController.text},
      };

      var response = await http.patch(
        Uri.parse(ApiServices.updateAcound),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        isSuccess = true;
        fullName.value = editProfileController.text;
        bio.value = bioController.text;
      }
    } catch (e) {
      debugPrint("Update Text Error: $e");
    }

    // ২. ইমেজ আপডেট (Multipart Request)
    if (selectedImagePath.value.isNotEmpty) {
      try {
        var request = http.MultipartRequest(
          'PATCH',
          Uri.parse(ApiServices.updateAcound),
        );
        request.headers.addAll({'Authorization': 'Bearer $token'});

        var file = await http.MultipartFile.fromPath(
          'profile_picture',
          selectedImagePath.value,
        );
        request.files.add(file);

        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200 || response.statusCode == 201) {
          isSuccess = true;
          var data = jsonDecode(response.body);
          if (data['profile_picture'] != null) {
            profileImgUrl.value = data['profile_picture'];
          }
          pickedImage.value = null;
          selectedImagePath.value = '';
        }
      } catch (e) {
        debugPrint("Image Upload Error: $e");
      }
    }

    isLoading.value = false;

    if (isSuccess) {
      Get.back();
      Get.snackbar(
        "Success",
        "Profile Updated Successfully!",
        backgroundColor: Colors.greenAccent,
      );
      getUserData();
    } else {
      Get.snackbar(
        "Error",
        "Update Failed. Please try again.",
        backgroundColor: Colors.redAccent,
      );
    }
  }

  // ================= ✅ CHANGE PASSWORD ✅ =================
  void changePassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) return;

    if (currentPassController.text.isEmpty ||
        changeNewPassController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "Fill all fields",
        backgroundColor: Colors.redAccent,
      );
      return;
    }

    try {
      var body = {
        "old_password": currentPassController.text,
        "new_password": changeNewPassController.text,
      };

      var response = await http.post(
        Uri.parse(ApiServices.changepassword),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        currentPassController.clear();
        changeNewPassController.clear();
        Get.back();
        Get.snackbar(
          "Success",
          "Password Changed",
          backgroundColor: Colors.greenAccent,
        );
      } else {
        Get.snackbar(
          "Error",
          "Failed to change password",
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Network Error", backgroundColor: Colors.redAccent);
    }
  }

  void loadCurrentData() {
    editProfileController.text = fullName.value;
    bioController.text = bio.value;
  }
}
