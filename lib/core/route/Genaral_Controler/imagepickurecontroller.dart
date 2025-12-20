// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class Imagepickurecontroller extends GetxController {
//   Future getImage() async {
//     RxString path = ''.obs;
//
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       path.value = image.path;
//       print(path.value);
//
//     }
//     else{
//       print('no image selected');
//     }
//
//   }
// }


import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickureController extends GetxController {


  var selectedImagePath = ''.obs;


  @override
  void onInit() {
    super.onInit();
    selectedImagePath.value = ''; // Reset image path
  }


  void clearImage() {
    selectedImagePath.value = '';
  }

  // 4. Image pick korar function
  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick image from gallery
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImagePath.value = image.path; // Update path
      print("Image selected: ${selectedImagePath.value}");
    } else {
      print('No image selected');
    }
  }
}