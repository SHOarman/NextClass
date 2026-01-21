// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// //
// // // ======================== Imports ========================
// // import '../../../Services/model_class/bokkingmodelclass.dart';
// // import '../accepted_value.dart';
// // import '../pending_value.dart';
// // import '../rejected_value.dart';
// //
// // class Bokingtabbar extends StatelessWidget {
// //
// //   /// 1. Booking list received from previous screen
// //   final List<BookingModel> bookingList;
// //
// //   /// 2. Constructor with required booking list
// //   const Bokingtabbar({
// //     super.key,
// //     required this.bookingList,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     // ======================== Status-wise Booking Count ========================
// //     final int pendingCount =
// //         bookingList.where((b) => b.status == 'pending').length;
// //
// //     final int acceptedCount =
// //         bookingList.where((b) => b.status == 'accepted').length;
// //
// //     final int rejectedCount =
// //         bookingList.where((b) => b.status == 'cancelled').length;
// //
// //     return DefaultTabController(
// //       length: 3,
// //       initialIndex: 0,
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //
// //           /// ======================== Tab Bar ========================
// //           /// Tab titles are dynamically updated based on server data
// //           TabBar(
// //             labelColor: const Color(0xff2563EB),
// //             indicatorColor: const Color(0xff2563EB),
// //             dividerColor: Colors.transparent,
// //             indicatorSize: TabBarIndicatorSize.tab,
// //             unselectedLabelColor: const Color(0xff888888),
// //             labelStyle: TextStyle(
// //               fontSize: 14.sp,
// //               fontWeight: FontWeight.w500,
// //             ),
// //             tabs: [
// //               Tab(text: 'Pending $pendingCount'),
// //               Tab(text: 'Accepted $acceptedCount'),
// //               Tab(text: 'Rejected $rejectedCount'),
// //             ],
// //           ),
// //
// //           const SizedBox(height: 12),
// //
// //           /// ======================== Tab Views ========================
// //           /// Filtered booking lists are passed to each tab screen
// //           SizedBox(
// //             height: 500.h, // Height adjusted for responsive layout
// //             child: TabBarView(
// //               children: [
// //                 Pendingvalue(
// //                   list: bookingList
// //                       .where((b) => b.status == 'pending')
// //                       .toList(),
// //                 ),
// //                 AcceptedValue(
// //                   list: bookingList
// //                       .where((b) => b.status == 'accepted')
// //                       .toList(),
// //                 ),
// //                 RejectedValue(
// //                   list: bookingList
// //                       .where((b) => b.status == 'cancelled')
// //                       .toList(),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// // ======================== Imports ========================
// import '../../../Services/model_class/bokkingmodelclass.dart';
// import '../accepted_value.dart';
// import '../pending_value.dart';
// import '../rejected_value.dart';
//
// class Bokingtabbar extends StatelessWidget {
//
//   /// 1. Booking list received from previous screen
//   final List<BookingModel> bookingList;
//
//   /// 2. Constructor with required booking list
//   const Bokingtabbar({
//     super.key,
//     required this.bookingList,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     // ======================== Status-wise Booking Count ========================
//     final int pendingCount =
//         bookingList.where((b) => b.status == 'pending').length;
//
//     final int acceptedCount =
//         bookingList.where((b) => b.status == 'accepted').length;
//
//     final int rejectedCount =
//         bookingList.where((b) => b.status == 'cancelled').length;
//
//     return DefaultTabController(
//       length: 3,
//       initialIndex: 0,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           /// ======================== Tab Bar ========================
//           /// Tab titles are dynamically updated based on server data
//           TabBar(
//             labelColor: const Color(0xff2563EB),
//             indicatorColor: const Color(0xff2563EB),
//             dividerColor: Colors.transparent,
//             indicatorSize: TabBarIndicatorSize.tab,
//             unselectedLabelColor: const Color(0xff888888),
//             labelStyle: TextStyle(
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w500,
//             ),
//             tabs: [
//               Tab(text: 'Pending $pendingCount'),
//               Tab(text: 'Accepted $acceptedCount'),
//               Tab(text: 'Rejected $rejectedCount'),
//             ],
//           ),
//
//           const SizedBox(height: 12),
//
//           /// ======================== Tab Views ========================
//           /// Filtered booking lists are passed to each tab screen
//           SizedBox(
//             height: 500.h, // Height adjusted for responsive layout
//             child: TabBarView(
//               children: [
//                 Pendingvalue(
//                   list: bookingList
//                       .where((b) => b.status == 'pending')
//                       .toList(),
//                 ),
//                 AcceptedValue(
//                   list: bookingList
//                       .where((b) => b.status == 'accepted')
//                       .toList(),
//                 ),
//                 RejectedValue(
//                   list: bookingList
//                       .where((b) => b.status == 'cancelled')
//                       .toList(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ======================== Imports ========================
import '../../../Services/model_class/bokkingmodelclass.dart';
import '../accepted_value.dart';
import '../pending_value.dart';
import '../rejected_value.dart';

class Bokingtabbar extends StatelessWidget {
  // ✅ লজিক আপডেট: এখন ৩টি আলাদা ফিল্টার করা লিস্ট গ্রহণ করবে
  // এর ফলে ডায়ালগ বক্সে প্রতিটি কার্ডের জন্য আলাদা ডাটা নিশ্চিত হবে।
  final List<BookingModel> pendingList;
  final List<BookingModel> acceptedList;
  final List<BookingModel> rejectedList;

  const Bokingtabbar({
    super.key,
    required this.pendingList,
    required this.acceptedList,
    required this.rejectedList,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ======================== Tab Bar ========================
          TabBar(
            labelColor: const Color(0xff2563EB),
            indicatorColor: const Color(0xff2563EB),
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: const Color(0xff888888),
            labelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              // সরাসরি লিস্টের লেন্থ ব্যবহার করে রিয়েল-টাইম কাউন্ট দেখানো হচ্ছে
              Tab(text: 'Pending ${pendingList.length}'),
              Tab(text: 'Accepted ${acceptedList.length}'),
              Tab(text: 'Rejected ${rejectedList.length}'),
            ],
          ),

          const SizedBox(height: 12),

          /// ======================== Tab Views ========================
          /// এখানে প্রতিটি ট্যাব তার জন্য নির্ধারিত আলাদা লিস্টটি পাচ্ছে
          SizedBox(
            height: 500.h,
            child: TabBarView(
              children: [
                // ✅ সরাসরি পেন্ডিং লিস্ট পাঠানো হচ্ছে
                Pendingvalue(list: pendingList),

                // ✅ সরাসরি একসেপ্টেড লিস্ট পাঠানো হচ্ছে
                AcceptedValue(list: acceptedList),

                // ✅ সরাসরি রিজেক্টেড লিস্ট পাঠানো হচ্ছে
                RejectedValue(list: rejectedList),
              ],
            ),
          ),
        ],
      ),
    );
  }
}