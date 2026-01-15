//
// import 'dart:io';
//
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImagePickureController extends GetxController {
//   var selectedFile = Rx<File?>(null);
//
//
//   var selectedImagePath = ''.obs;
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     selectedImagePath.value = ''; // Reset image path
//   }
//
//
//   void clearImage() {
//     selectedImagePath.value = '';
//   }
//
//   // 4. Image pick korar function
//   Future<void> getImage() async {
//     final ImagePicker _picker = ImagePicker();
//     // Pick image from gallery
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//
//     if (image != null) {
//       selectedImagePath.value = image.path; // Update path
//       print("Image selected: ${selectedImagePath.value}");
//     } else {
//       print('No image selected');
//     }
//   }
// }

import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickureController extends GetxController {
  var selectedFile = Rx<File?>(null);

  var selectedImagePath = ''.obs;

  void clearImage() {
    selectedFile.value = null;
    selectedImagePath.value = '';
  }

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedFile.value = File(image.path);
      selectedImagePath.value = image.path;

      // print("Image selected: ${selectedFile.value!.path}");
    } else {
      // print('No image selected');
    }
  }
}
