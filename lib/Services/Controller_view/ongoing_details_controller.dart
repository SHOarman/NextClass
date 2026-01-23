import 'package:get/get.dart';
import '../../teacher_presentScreen/home_ui/home_controller.dart';
import '../model_class/bokkingmodelclass.dart';
// ✅ Make sure the model path is correct

class OngoingDetailsController extends GetxController {
  // --------------------------
  // Controller reference
  // --------------------------
  // HomeController already exists in the app, so we fetch it
  final HomeController homeController = Get.put(HomeController());

  // --------------------------
  // State variables
  // --------------------------
  var _allEnrolledStudents = <BookingModel>[]; // Full list (internal use)
  var enrolledStudents = <BookingModel>[].obs; // Reactive list for UI
  var isLoading = false.obs; // Loading indicator
  var bookingCount = 0.obs; // Number of enrolled students

  // --------------------------
  // 1. Filter students by class ID
  // --------------------------
  void filterStudentsByClass(int? classId) {
    if (classId == null) return;

    isLoading.value = true;

    // Fetch all bookings from HomeController
    final List<BookingModel>? allBookings = homeController.allBookingData.value.results;

    if (allBookings != null) {
      // Filter bookings for:
      // - Specific class ID
      // - Status accepted or confirmed
      final results = allBookings.where((booking) {
        bool isMatchClass = booking.classListing == classId;
        bool isAccepted = booking.status?.toLowerCase() == "confirmed" ||
            booking.status?.toLowerCase() == "accepted";
        return isMatchClass && isAccepted;
      }).toList();

      // Assign filtered results to internal and reactive lists
      _allEnrolledStudents = results;
      enrolledStudents.value = List.from(_allEnrolledStudents);

      // Update booking count
      bookingCount.value = _allEnrolledStudents.length;
    }

    isLoading.value = false;
  }

  // --------------------------
  // 2. Search enrolled students
  // --------------------------
  // Search by parent name or student name
  void searchStudent(String query) {
    if (query.isEmpty) {
      // Reset to full list
      enrolledStudents.value = List.from(_allEnrolledStudents);
    } else {
      // Filter based on search query
      enrolledStudents.value = _allEnrolledStudents.where((student) {
        final parentName = student.parentDetails?.fullName?.toLowerCase() ?? "";
        final studentName = student.studentName?.toLowerCase() ?? "";
        final searchInput = query.toLowerCase();

        return parentName.contains(searchInput) || studentName.contains(searchInput);
      }).toList();
    }
  }
}
