// import 'package:get/get.dart';
// import '../api_Services/api_Services.dart';
// import '../../core/route/route.dart';
// import '../model_class/bokkingmodelclass.dart';
//
// //======================== Booking Details Controller ========================
// class BookingDetailsController extends GetxController {
//   //======================== Booking Data ========================
//   // Holds booking details received from previous screen
//   late BookingModel bookingData;
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     //======================== Receive Navigation Argument ========================
//     // Get booking data passed through Get.arguments
//     bookingData = Get.arguments;
//   }
//
//   //======================== ACTIONS ========================
//   var isChatLoading = false.obs;
//
//   Future<void> startChatWithTutor() async {
//     // 1. Validation
//     if (bookingData.tutorDetails?.id == null) {
//       Get.snackbar("Error", "Tutor details not found");
//       return;
//     }
//
//     try {
//       isChatLoading.value = true;
//       final int tutorId = bookingData.tutorDetails!.id!;
//
//       // 2. Call API to get/create conversation
//       final response = await ApiServices.startChatConversation(tutorId);
//
//       // 3. Navigate if successful
//       if (response != null && response['id'] != null) {
//         final int conversationId = response['id'];
//
//         Get.toNamed(
//           AppRoute.chatScreen1,
//           arguments: {
//             'id': conversationId, // ✅ Use Correct Conversation ID
//             'name': bookingData.tutorDetails?.fullName ?? "Tutor",
//             'profile': bookingData.tutorDetails?.profilePicture ?? "",
//           },
//         );
//       } else {
//         Get.snackbar("Error", "Could not start conversation");
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Something went wrong: $e");
//     } finally {
//       isChatLoading.value = false;
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_Services/api_Services.dart';
import '../../core/route/route.dart';
import '../model_class/bokkingmodelclass.dart';

//======================== Booking Details Controller ========================
class BookingDetailsController extends GetxController {
  //======================== Booking Data ========================
  late BookingModel bookingData;
  var isChatLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    //======================== Receive Navigation Argument ========================
    if (Get.arguments != null && Get.arguments is BookingModel) {
      bookingData = Get.arguments;
    }
  }

  //======================== ACTIONS ========================

  // টিউটারের সাথে চ্যাট শুরু করার মেথড
  Future<void> startChatWithTutor() async {
    // ১. টিউটার আইডি চেক করা
    if (bookingData.tutorDetails?.id == null) {
      Get.snackbar(
          "Error",
          "Tutor ID not found",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white
      );
      return;
    }

    try {
      isChatLoading.value = true;
      final int tutorUserId = bookingData.tutorDetails!.id!;

      // ২. এপিআই কল করে কনভারসেশন আইডি বের করা (পুরানো চ্যাট থাকলে সেটিই দিবে)
      final response = await ApiServices.startChatConversation(tutorUserId);

      // ৩. সাকসেসফুল হলে আর্গুমেন্টসহ চ্যাট স্ক্রিনে যাওয়া
      if (response != null && response['id'] != null) {
        final int conversationId = response['id'];
        final String tutorName = bookingData.tutorDetails?.fullName ?? "Tutor";
        final String tutorProfile = bookingData.tutorDetails?.profilePicture ?? "";

        debugPrint("🚀 Chat Started! Conversation ID: $conversationId");

        Get.toNamed(
          AppRoute.chatScreen1, // আপনার প্যারেন্ট চ্যাট স্ক্রিন রাউট
          arguments: {
            'id': conversationId,      // এটি চ্যাট স্ক্রিনের জন্য মেইন আইডি
            'name': tutorName,
            'profile': tutorProfile,
            'receiverId': tutorUserId, // অপ্টিমিস্টিক মেসেজের জন্য
          },
        );
      } else {
        Get.snackbar("Error", "Could not start conversation. Please check connection.");
      }
    } catch (e) {
      debugPrint("❌ Chat Initialization Error: $e");
      Get.snackbar("Error", "Server is not responding. Try again later.");
    } finally {
      isChatLoading.value = false;
    }
  }
}