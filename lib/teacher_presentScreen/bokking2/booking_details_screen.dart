import 'package:first_project/Parent_parsentScreen/widget/back_slash/back_slash.dart';
import 'package:first_project/Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart'
    show SimpleCard;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';

//========================= Controllers =========================
import '../../Services/Controller_view/booking_teacher_list_controller.dart';

//========================= Models ==============================
import '../../Services/model_class/bokkingmodelclass.dart';

//========================= Widgets =============================
import 'bokkingWidget/tuition_details.dart';
import 'bokkingWidget/bokingtabbar.dart';

class BokingDetelsscreen extends StatefulWidget {
  const BokingDetelsscreen({super.key});

  @override
  State<BokingDetelsscreen> createState() => _BokingDetelsscreenState();
}

class _BokingDetelsscreenState extends State<BokingDetelsscreen> {
  //========================= Text Controller ===================
  late final TextEditingController nameController;

  //========================= Main GetX Controller ===============
  final Bookingtecherlistcontroller controller = Get.put(
    Bookingtecherlistcontroller(),
  );

  //========================= Local Variables ====================
  int? classId;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();

    // Get class id from navigation arguments
    final List<BookingModel> argumentsList =
        Get.arguments as List<BookingModel>;

    if (argumentsList.isNotEmpty) {
      classId = argumentsList.first.classListing;
    }

    // Listen search input changes
    nameController.addListener(() {
      setState(() {
        searchQuery = nameController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        //========================= Get Live Bookings ===============
        List<BookingModel> liveBookings = [];

        if (classId != null &&
            controller.groupedBookings.containsKey(classId)) {
          liveBookings = controller.groupedBookings[classId]!;
        }

        //========================= Search Filter ==================
        final filteredBookings = liveBookings.where((booking) {
          final studentName = (booking.studentName ?? '').toLowerCase();
          final parentName = (booking.parentDetails?.fullName ?? '')
              .toLowerCase();

          return studentName.contains(searchQuery) ||
              parentName.contains(searchQuery);
        }).toList();

        //========================= Empty State ====================
        if (liveBookings.isEmpty && !controller.isLoading.value) {
          return const Center(
            child: Text('No bookings available for this class'),
          );
        }

        //========================= Class Info =====================
        final firstBooking = liveBookings.isNotEmpty
            ? liveBookings.first
            : null;
        final properties = firstBooking?.classDetails?.properties;

        //========================= Status Wise Lists ===============
        final pendingList = filteredBookings
            .where((b) => (b.status ?? '').toLowerCase().trim() == 'pending')
            .toList();

        final acceptedList = filteredBookings.where((b) {
          final s = (b.status ?? '').toLowerCase().trim();
          return s == 'accepted' || s == 'confirmed' || s == 'approved';
        }).toList();

        final rejectedList = filteredBookings.where((b) {
          final s = (b.status ?? '').toLowerCase().trim();
          return s == 'cancelled' || s == 'rejected';
        }).toList();

        //========================= UI =============================
        return RefreshIndicator(
          onRefresh: () => controller.fetchMyBookings(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 60.h),

                  // Back button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BackSlashButton(onTap: () => Get.back()),
                  ),

                  SizedBox(height: 40.h),

                  // Search field
                  SimpleCard(
                    controller: nameController,
                    hintText: 'Search by name',
                    prefixicon: true,
                  ),

                  SizedBox(height: 20.h),

                  // Tuition details card
                  Tuitiondetails(
                    title: 'Tuition details',
                    title1: 'Class ${properties?.level ?? 'N/A'}',
                    title2: properties?.subject ?? 'N/A',
                    title3: '\$${properties?.pricePerHour ?? '0.00'}',
                    title4: 'Group class',
                  ),

                  SizedBox(height: 32.h),

                  // Tabs with filtered booking lists
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
      }),
    );
  }
}
