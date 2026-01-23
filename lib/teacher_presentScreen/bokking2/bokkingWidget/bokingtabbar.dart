import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ======================== Imports ========================
import '../../../Services/model_class/bokkingmodelclass.dart';
import '../accepted_value.dart';
import '../pending_value.dart';
import '../rejected_value.dart';

//========================= Booking Tab Bar =========================
class Bokingtabbar extends StatelessWidget {
  // Filtered booking lists from controller
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
              Tab(text: 'Pending ${pendingList.length}'),
              Tab(text: 'Accepted ${acceptedList.length}'),
              Tab(text: 'Rejected ${rejectedList.length}'),
            ],
          ),

          const SizedBox(height: 12),

          /// ======================== Tab Views ========================
          SizedBox(
            height: 500.h, // Tab content height
            child: TabBarView(
              children: [
                // 1. Pending Requests Tab
                Pendingvalue(list: pendingList),

                // 2. Accepted Requests Tab
                AcceptedValue(list: acceptedList),

                // 3. Rejected Requests Tab
                RejectedValue(list: rejectedList),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
