// import 'package:first_project/Parent_parsentScreen/widget/back_slash/back_slash.dart';
// import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart' show SimpleCard;
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
// import 'package:get/get.dart';
//
// // Import your model and widgets
// import '../../Services/model_class/bokkingmodelclass.dart';
// import 'bokkingWidget/tuition_details.dart';
// import 'bokkingWidget/bokingtabbar.dart' show Bokingtabbar;
//
// class BokingDetelsscreen extends StatefulWidget {
//   const BokingDetelsscreen({super.key});
//
//   @override
//   State<BokingDetelsscreen> createState() => _BokingDetelsscreenState();
// }
//
// class _BokingDetelsscreenState extends State<BokingDetelsscreen> {
//   /// Text controller for searching by student name
//   late final TextEditingController nameController;
//
//   /// Booking list received from previous screen
//   late List<BookingModel> bookingsInClass;
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController();
//
//     // Receive the booking list passed as arguments from the previous screen
//     bookingsInClass = Get.arguments as List<BookingModel>;
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // All bookings belong to the same class, so take the first booking for class details
//     final firstBooking = bookingsInClass.first;
//     final properties = firstBooking.classDetails?.properties;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               SizedBox(height: 60.h),
//
//               /// Back button
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: BackSlashButton(
//                   onTap: () => Get.back(),
//                 ),
//               ),
//
//               SizedBox(height: 40.h),
//
//               /// Search input field
//               SimpleCard(
//                 controller: nameController,
//                 hintText: 'Search by name',
//                 prefixicon: true,
//               ),
//
//               SizedBox(height: 20.h),
//
//               /// Tuition details section
//               Tuitiondetails(
//                 title: 'Tuition details',
//                 title1: 'Class ${properties?.level ?? "N/A"}',        // Class level
//                 title2: properties?.subject ?? 'N/A',                // Subject
//                 title3: '\$${properties?.pricePerHour ?? "0.00"}',   // Price per hour
//                 title4: 'Group class',                                // Class type
//               ),
//
//               SizedBox(height: 32.h),
//
//               /// Booking tab bar (Pending / Accepted / Rejected)
//               Bokingtabbar(bookingList: bookingsInClass),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:first_project/Parent_parsentScreen/widget/back_slash/back_slash.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart' show SimpleCard;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';

import '../../Services/model_class/bokkingmodelclass.dart';
import 'bokkingWidget/tuition_details.dart';
import 'bokkingWidget/bokingtabbar.dart' show Bokingtabbar;

class BokingDetelsscreen extends StatefulWidget {
  const BokingDetelsscreen({super.key});

  @override
  State<BokingDetelsscreen> createState() => _BokingDetelsscreenState();
}

class _BokingDetelsscreenState extends State<BokingDetelsscreen> {
  late final TextEditingController nameController;
  late List<BookingModel> allBookingsInClass;

  // ফিল্টার করা ডাটা রাখার জন্য ভেরিয়েবল
  List<BookingModel> filteredBookings = [];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();

    // arguments থেকে আসা ডাটা গ্রহণ
    allBookingsInClass = Get.arguments as List<BookingModel>;
    filteredBookings = allBookingsInClass; // শুরুতে সব ডাটাই থাকবে

    // সার্চ বক্সে কিছু লিখলে লিস্ট আপডেট করার জন্য লিসেনার
    nameController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      filteredBookings = allBookingsInClass.where((booking) {
        final searchName = nameController.text.toLowerCase();
        final studentName = (booking.studentName ?? "").toLowerCase();
        final parentName = (booking.parentDetails?.fullName ?? "").toLowerCase();

        return studentName.contains(searchName) || parentName.contains(searchName);
      }).toList();
    });
  }

  @override
  void dispose() {
    nameController.removeListener(_onSearchChanged);
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // প্রথম বুকিং থেকে ক্লাস ডিটেইলস নেওয়া হচ্ছে
    final firstBooking = allBookingsInClass.first;
    final properties = firstBooking.classDetails?.properties;

    // ✅ স্ট্যাটাস অনুযায়ী লিস্টগুলো আলাদা করা হচ্ছে
    final pendingList = filteredBookings.where((b) => b.status == "pending").toList();
    final acceptedList = filteredBookings.where((b) => b.status == "accepted").toList();
    // cancelled এবং rejected দুই ধরণের ডাটাই রিজেক্টেড ট্যাবে দেখাবে
    final rejectedList = filteredBookings.where((b) => b.status == "cancelled" || b.status == "rejected").toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 60.h),

              Align(
                alignment: Alignment.centerLeft,
                child: BackSlashButton(
                  onTap: () => Get.back(),
                ),
              ),

              SizedBox(height: 40.h),

              SimpleCard(
                controller: nameController,
                hintText: 'Search by name',
                prefixicon: true,
              ),

              SizedBox(height: 20.h),

              Tuitiondetails(
                title: 'Tuition details',
                title1: 'Class ${properties?.level ?? "N/A"}',
                title2: properties?.subject ?? 'N/A',
                title3: '\$${properties?.pricePerHour ?? "0.00"}',
                title4: 'Group class',
              ),

              SizedBox(height: 32.h),

              /// ✅ আপডেট: এখন আমরা ৩টি আলাদা আলাদা লিস্ট পাঠাচ্ছি।
              /// এর ফলে Bokingtabbar বুঝতে পারবে কোন ট্যাবে কতটি ডাটা দেখাবে।
              Bokingtabbar(
                pendingList: pendingList,
                acceptedList: acceptedList,
                rejectedList: rejectedList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}