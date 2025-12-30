import 'package:get/get.dart'; // Import Get is enough, it includes rx_types and state_manager
import 'package:image_picker/image_picker.dart';

class Profilecontroller extends GetxController {

  // 1. Initialize as nullable Rx<XFile?>. Set initial value to null.
  Rx<XFile?> pickedImage = Rx<XFile?>(null);

  // 2. Use a getter for hasImage.
  // This automatically becomes true if pickedImage is not null.
  bool get hasImage => pickedImage.value != null;

  Future<void> pickImg() async {
    final ImagePicker picker = ImagePicker();

    // 3. Pick the image (don't use .obs here!)
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    // 4. Check if user actually picked something (didn't press cancel)
    if (image != null) {
      pickedImage.value = image; // Update the value triggers the UI
    }
  }
}