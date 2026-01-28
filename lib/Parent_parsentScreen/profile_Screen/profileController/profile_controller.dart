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

  //=============== USER IDENTIFIER ===================
  // Used in chat screens to determine "isMe"
  var userId = 0.obs;

  //=============== REACTIVE USER DATA ===================
  // These values update UI automatically using GetX reactivity
  var address = "Fetching location...".obs;
  var fullName = "Loading...".obs;
  var email = "Loading...".obs;
  var profileImgUrl = "".obs;
  var bio = "No bio available".obs;

  //=============== LOADING STATE ===================
  // Used to show loader during API calls
  var isLoading = false.obs;

  //=============== IMAGE PICKER STATE ===================
  Rx<XFile?> pickedImage = Rx<XFile?>(null);
  var selectedImagePath = ''.obs;

  // Checks whether a local image is selected
  bool get hasImage => pickedImage.value != null;

  //=============== TEXT CONTROLLERS ===================
  // Used for editing profile and password fields
  final TextEditingController editProfileController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController changeNewPassController = TextEditingController();
  final TextEditingController changeConfirmPassController =
  TextEditingController();

  final ImagePicker _picker = ImagePicker();

  //=============== CONTROLLER LIFECYCLE ===================
  @override
  void onInit() {
    super.onInit();

    // Load cached user ID instantly (used in chat)
    loadLocalUserId();

    // Fetch user data from server
    getUserData();

    // Get live GPS-based location
    getCurrentLocation();
  }

  //=============== LOAD USER ID FROM LOCAL STORAGE ===================
  // Prevents delay when chat screen opens
  Future<void> loadLocalUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedId = prefs.getInt('user_id');

    if (savedId != null && savedId > 0) {
      userId.value = savedId;
      debugPrint("👤 Loaded Local User ID: $savedId");
    }
  }

  //=============== REAL-TIME LOCATION LOGIC ===================
  // Gets phone GPS location and converts it into city & country
  Future<void> getCurrentLocation() async {
    try {
      // Step 1: Check and request permission
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

      // Step 2: Get current GPS coordinates
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // Step 3: Convert latitude & longitude into readable address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        address.value = "${place.locality}, ${place.country}";
      }
    } catch (e) {
      address.value = "Location error";
      debugPrint("Location Error: $e");
    }
  }

  //=============== GET USER DATA API ===================
  // Fetches profile data and user ID from backend
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

        // Save user ID for chat message ownership
        int newId = data['id'] ?? 0;
        userId.value = newId;

        if (newId > 0) {
          await prefs.setInt('user_id', newId);
        }

        // Update profile info
        fullName.value = data['full_name'] ?? "No Name";
        email.value = data['email'] ?? "No Email";

        if (data['profile_picture'] != null) {
          profileImgUrl.value = data['profile_picture'];
        }

        // Refresh values so all screens update
        userId.refresh();
        fullName.refresh();
        email.refresh();

        editProfileController.text = fullName.value;
      }
    } catch (e) {
      debugPrint("Error fetching user data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  //=============== IMAGE PICKER ===================
  // Selects image from gallery for profile update
  Future<void> pickImg() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = image;
      selectedImagePath.value = image.path;
    }
  }

  //=============== UPDATE PROFILE API ===================
  // Updates name, bio, and profile picture
  Future<void> updateProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) return;

    isLoading.value = true;
    bool isSuccess = false;

    // Step 1: Update text fields (name & bio)
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

    // Step 2: Upload profile image (Multipart)
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

          // Clear local image selection
          pickedImage.value = null;
          selectedImagePath.value = '';
        }
      } catch (e) {
        debugPrint("Image Upload Error: $e");
      }
    }

    isLoading.value = false;

    // Step 3: Final UI feedback
    if (isSuccess) {
      Get.back();
      Get.snackbar(
        "Success",
        "Profile Updated Successfully!",
        backgroundColor: Colors.greenAccent,
      );
      getUserData(); // Re-sync latest data
    } else {
      Get.snackbar(
        "Error",
        "Update Failed. Please try again.",
        backgroundColor: Colors.redAccent,
      );
    }
  }

  //=============== CHANGE PASSWORD ===================
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
      Get.snackbar(
        "Error",
        "Network Error",
        backgroundColor: Colors.redAccent,
      );
    }
  }

  //=============== LOAD CURRENT DATA INTO FIELDS ===================
  void loadCurrentData() {
    editProfileController.text = fullName.value;
    bioController.text = bio.value;
  }
}
