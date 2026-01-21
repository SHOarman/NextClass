// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../Services/api_Services/api_Services.dart'; // Check your path
//
// class ProfileController extends GetxController {
//
//   // ================= ✅ REACTIVE VARIABLES ✅ =================
//   var fullName = "Loading...".obs;
//   var email = "Loading...".obs;
//   var profileImgUrl = "".obs;
//   var bio = "No bio available".obs;// Stores the server image URL
//
//   // Image Picker Variables
//   Rx<XFile?> pickedImage = Rx<XFile?>(null);
//   var selectedImagePath = ''.obs;
//
//   // Getter to check if a local file is picked
//   bool get hasImage => pickedImage.value != null;
//
//   // ================= ✅ CONTROLLERS ✅ =================
//   final TextEditingController currentPassController = TextEditingController();
//   final TextEditingController changeNewPassController = TextEditingController();
//   final TextEditingController changeConfirmPassController = TextEditingController();
//   final TextEditingController EditProfileController = TextEditingController();
//
//   //===========bio================================
//   final TextEditingController bioController = TextEditingController();
//   final TextEditingController fullNameController = TextEditingController();
//
//
//
//   final ImagePicker _picker = ImagePicker();
//
//   @override
//   void onInit() {
//     super.onInit();
//     getUserData(); // Load initial data
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
//       // URL to fetch user profile
//       var url = Uri.parse("${ApiServices.baseUrl}/api/accounts/users/me/");
//
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
//
//         // Update reactive variables
//         fullName.value = data['full_name'] ?? "No Name";
//         email.value = data['email'] ?? "No email";
//         bio.value = data['bio'] ?? "No bio added yet.";
//
//         if (data['profile_picture'] != null) {
//           profileImgUrl.value = data['profile_picture'];
//         }
//
//         // Set text for edit controller
//         EditProfileController.text = fullName.value;
//
//       } else {
//         print("Failed to load user data: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error fetching user data: $e");
//     }
//   }
//
//   // ================= IMAGE PICKER =================
//   Future<void> pickImg() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       pickedImage.value = image;
//       selectedImagePath.value = image.path;
//     }
//   }
//
//   // ================= ✅ UPDATE PROFILE API (FIXED) ✅ =================
// // ================= ✅ UPDATE PROFILE API (UPDATED) ✅ =================
//   Future<void> EditProfile() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//
//     try {
//       var request = http.MultipartRequest(
//         'PATCH',
//         Uri.parse(ApiServices.updateAcound),
//       );
//
//       request.headers.addAll({'Authorization': 'Bearer $token'});
//
//       print("🔵 Start Updating Profile...");
//
//       // 1. Add Name (আপনার আগের লজিক)
//       if (EditProfileController.text.isNotEmpty) {
//         request.fields['full_name'] = EditProfileController.text;
//       }
//
//
//       if (bioController.text.isNotEmpty) {
//         request.fields['bio'] = bioController.text;
//         request.fields['profile.bio'] = bioController.text;
//         request.fields['profile[bio]'] = bioController.text;
//         print("📝 Bio added to request: ${bioController.text}");
//       }
//
//       // 3. ✅ Add Image File (সেফটি চেক সহ)
//       if (selectedImagePath.value.isNotEmpty) {
//         File imgFile = File(selectedImagePath.value);
//
//         // ফাইলটি আসলে ফোনে আছে কিনা চেক করে নেওয়া
//         if (await imgFile.exists()) {
//           var file = await http.MultipartFile.fromPath(
//             'profile_picture',
//             selectedImagePath.value,
//           );
//           request.files.add(file);
//           print("📸 Image attached: ${selectedImagePath.value}");
//         } else {
//           print("❌ Error: Image file not found at path!");
//         }
//       }
//
//       print("🔵 Sending Request...");
//
//       var streamedResponse = await request.send();
//       var response = await http.Response.fromStream(streamedResponse);
//
//       print("🟢 Status Code: ${response.statusCode}");
//       print("🟢 Response Body: ${response.body}");
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//
//         // 1. Decode response
//         var data = jsonDecode(response.body);
//
//         // 2. Update Name Locally (UI তে সাথে সাথে চেঞ্জ হবে)
//         if (EditProfileController.text.isNotEmpty) {
//           fullName.value = EditProfileController.text;
//         }
//
//         // 3. ✅ Update Bio Locally (UI তে সাথে সাথে চেঞ্জ হবে)
//         if (bioController.text.isNotEmpty) {
//           bio.value = bioController.text;
//         }
//
//         // 4. ✅ Update Image URL from Server Response
//         // নেস্টেড ডাটা বা রুট ডাটা চেক করা হচ্ছে
//         if (data['profile_picture'] != null) {
//           profileImgUrl.value = data['profile_picture'];
//         } else if (data['user'] != null && data['user']['profile_picture'] != null) {
//           profileImgUrl.value = data['user']['profile_picture'];
//         }
//
//         // 5. Clear Local Data
//         pickedImage.value = null;
//         selectedImagePath.value = '';
//
//
//
//         Get.back();
//         Get.snackbar("Success", "Profile Updated Successfully!", backgroundColor: Colors.greenAccent);
//
//         // 6. Ensure data is synced completely
//         getUserData();
//
//       } else {
//         Get.snackbar("Error", "Update Failed: ${response.body}", backgroundColor: Colors.redAccent);
//       }
//     } catch (profileerror) {
//       print("Error: $profileerror");
//       Get.snackbar("Error", "Something went wrong", backgroundColor: Colors.redAccent);
//     }
//   }
//   // ================= LOAD DATA HELPER =================
//   void loadCurrentData() {
//     EditProfileController.text = fullName.value;
//   }
//
//   // ================= CHANGE PASSWORD =================
//   void changePassword() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//
//     if (token == null) {
//       Get.snackbar("Error", "Not logged in", backgroundColor: Colors.redAccent);
//       return;
//     }
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
//         Get.snackbar("Error", "Failed", backgroundColor: Colors.redAccent);
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Network Error", backgroundColor: Colors.redAccent);
//     }
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Services/api_Services/api_services.dart'; // Check your path

class ProfileController extends GetxController {
  // ================= ✅ REACTIVE VARIABLES ✅ =================
  var fullName = "Loading...".obs;
  var email = "Loading...".obs;
  var profileImgUrl = "".obs;
  var bio = "No bio available".obs;

  // Image Picker Variables
  Rx<XFile?> pickedImage = Rx<XFile?>(null);
  var selectedImagePath = ''.obs;

  // Getter to check if a local file is picked
  bool get hasImage => pickedImage.value != null;

  // ================= ✅ CONTROLLERS ✅ =================
  // controller for Name (You used EditProfileController in your UI)
  final TextEditingController editProfileController = TextEditingController();
  // controller for Bio
  final TextEditingController bioController = TextEditingController();

  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController changeNewPassController = TextEditingController();
  final TextEditingController changeConfirmPassController =
      TextEditingController();

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    getUserData(); // Load initial data
  }

  // ================= ✅ GET USER DATA API ✅ =================
  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) return;

    try {
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
        // print("📥 User Data: $data");

        // 1. Basic Info
        fullName.value = data['full_name'] ?? "No Name";
        email.value = data['email'] ?? "No email";

        // 2. Image
        if (data['profile_picture'] != null) {
          profileImgUrl.value = data['profile_picture'];
        }

        // 3. ✅ Bio Fix (Reading from nested profile object)
        if (data['profile'] != null && data['profile']['bio'] != null) {
          bio.value = data['profile']['bio'];
        } else {
          bio.value = "No bio added yet.";
        }

        // 4. Set text for edit controllers
        editProfileController.text = fullName.value;
        bioController.text = bio.value; // ✅ Set bio text
      } else {
        // print("Failed to load user data: ${response.statusCode}");
      }
    } catch (e) {
      // print("Error fetching user data: $e");
    }
  }

  // ================= IMAGE PICKER =================
  Future<void> pickImg() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = image;
      selectedImagePath.value = image.path;
    }
  }

  // ================= ✅ UPDATE PROFILE API (FINAL FIXED LOGIC) ✅ =================
  // ================= ✅ ULTIMATE FIX FOR BIO UPDATE ✅ =================
  Future<void> updateProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) return;

    // print("🔵 Updating Profile Started...");
    bool isSuccess = false;

    // ---------------------------------------------------------
    // 1️⃣ STEP 1: নাম এবং বায়ো আপডেট (JSON দিয়ে)
    // এটি Bio ফিক্স করবে কারণ আমরা Nested Structure পাঠাব
    // ---------------------------------------------------------
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // ✅ সার্ভার ঠিক যেমন চায়, তেমন JSON বানানো হচ্ছে
      Map<String, dynamic> body = {
        "full_name": editProfileController.text, // Name (Root level)
        "profile": {
          "bio": bioController.text, // ✅ Bio (Nested inside profile)
        },
      };

      // print("📤 Sending JSON Data: ${jsonEncode(body)}");

      // HTTP PATCH Request (Text Data)
      var response = await http.patch(
        Uri.parse(ApiServices.updateAcound),
        headers: headers,
        body: jsonEncode(body),
      );

      // print("🟢 Text Update Status: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        isSuccess = true;

        // ✅ UI আপডেট (লোকালি) - যাতে সাথে সাথে চেঞ্জ দেখা যায়
        fullName.value = editProfileController.text;
        bio.value = bioController.text;

        // print("✅ Bio updated locally to: ${bio.value}");
      } else {
        // print("❌ Text Update Failed: ${response.body}");
      }
    } catch (e) {
      // print("❌ Error Updating Text: $e");
    }

    // ---------------------------------------------------------
    // 2️⃣ STEP 2: ছবি আপডেট (Multipart দিয়ে) - যদি ছবি সিলেক্ট করা থাকে
    // ---------------------------------------------------------
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

        // print("📤 Uploading Image...");
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        // print("🟢 Image Update Status: ${response.statusCode}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          isSuccess = true;

          // সার্ভার থেকে নতুন ইমেজের লিংক নেওয়া
          var data = jsonDecode(response.body);
          if (data['profile_picture'] != null) {
            profileImgUrl.value = data['profile_picture'];
          } else if (data['user'] != null &&
              data['user']['profile_picture'] != null) {
            profileImgUrl.value = data['user']['profile_picture'];
          }

          // লোকাল সিলেকশন ক্লিয়ার
          pickedImage.value = null;
          selectedImagePath.value = '';
        }
      } catch (e) {
        // print("❌ Error Updating Image: $e");
      }
    }

    // ---------------------------------------------------------
    // 3️⃣ FINALIZE
    // ---------------------------------------------------------
    if (isSuccess) {
      Get.back();
      Get.snackbar(
        "Success",
        "Profile Updated Successfully!",
        backgroundColor: Colors.greenAccent,
      );
    } else {
      Get.snackbar(
        "Error",
        "Update Failed. Please try again.",
        backgroundColor: Colors.redAccent,
      );
    }
  }

  // ================= LOAD DATA HELPER =================
  void loadCurrentData() {
    editProfileController.text = fullName.value;
    bioController.text = bio.value; // ✅ Also load bio
  }

  // ================= CHANGE PASSWORD =================
  void changePassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      Get.snackbar("Error", "Not logged in", backgroundColor: Colors.redAccent);
      return;
    }

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
        Get.snackbar("Error", "Failed", backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      Get.snackbar("Error", "Network Error", backgroundColor: Colors.redAccent);
    }
  }
}
