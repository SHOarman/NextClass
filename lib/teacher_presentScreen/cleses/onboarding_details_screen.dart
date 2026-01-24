import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Parent_parsentScreen/widget/back_slash/back_slash.dart';
import '../../Parent_parsentScreen/widget/custom_textfield/custom_textfield.dart';
import '../../Services/Controller_view/mark_as_complete_controller.dart';
import '../../Services/Controller_view/booking_teacher_list_controller.dart';
import '../../Services/model_class/bokkingmodelclass.dart';
import '../../core/route/route.dart';
import '../../unity/app_colors/app_gradient.dart';
import '../bokking2/bokkingWidget/tuition_details.dart';
import '../techerall_widget/customcard/customcard.dart';
import '../techerall_widget/markasinactive/markasinactive.dart';
import '../techerall_widget/padding_information_model/padding_information_model.dart';

class Onlodingdetelsscareen extends StatelessWidget {
  const Onlodingdetelsscareen({super.key});

  @override
  Widget build(BuildContext context) {
    //================= Receive class data from previous screen ========================
    final dynamic classItem = Get.arguments;
    final props = classItem.properties;
    final int classId = classItem.id;

    //================= Initialize booking controller ========================
    final Bookingtecherlistcontroller controller =
        Get.isRegistered<Bookingtecherlistcontroller>()
        ? Get.find<Bookingtecherlistcontroller>()
        : Get.put(Bookingtecherlistcontroller());

    //================= Search text controller ========================
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),

              //================= Top row: Back button and inactive button ========================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackSlashButton(onTap: () => Get.back()),
                  Markasinactive(
                    text: 'Mark as inactive',
                    ontap: () => Get.toNamed(
                      AppRoute.inacriveongoingdetelsscreen,
                      arguments: classItem,

                    ),
                  ),
                ],
              ),

              SizedBox(height: 34.h),

              //================= Search field with real-time filtering ========================
              SimpleCard(
                controller: nameController,
                hintText: 'Search by name',
                prefixicon: true,
                onChanged: (value) => controller.updateSearchQuery(value),
              ),

              SizedBox(height: 24.h),

              //================= Tuition details section ========================
              Tuitiondetails(
                title: 'Tuition details',
                title2: props?.subject ?? "N/A",
                title3: "\$${props?.pricePerHour ?? '0.00'}",
                title4: (props?.isGroupClass ?? false)
                    ? "Group class"
                    : "Individual",
                title1: "Class ${props?.level ?? 'N/A'}",
              ),

              SizedBox(height: 32.h),

              //================= Enrolled student list section ========================
              Obx(() {
                //================= Filter accepted or confirmed students ========================
                final allInClass = (controller.groupedBookings[classId] ?? [])
                    .where((b) {
                      final s = (b.status ?? "").toLowerCase().trim();
                      return s == "confirmed" || s == "accepted";
                    })
                    .toList();

                //================= Apply search filter ========================
                final acceptedStudents = allInClass.where((student) {
                  final sName = (student.studentName ?? "").toLowerCase();
                  final pName = (student.parentDetails?.fullName ?? "")
                      .toLowerCase();
                  final query = controller.searchQuery.value;
                  return sName.contains(query) || pName.contains(query);
                }).toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //================= Booking count row ========================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booking by',
                          style: TextStyle(
                            color: Appgradient.textColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${acceptedStudents.length}',
                          style: TextStyle(
                            color: const Color(0xff2563EB),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.h),
                    const Text(
                      'Accept new student requests in the Bookings Section',
                      style: TextStyle(color: Color(0xff888888), fontSize: 12),
                    ),

                    SizedBox(height: 24.h),

                    //================= Student list display ========================
                    acceptedStudents.isEmpty
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 40.h),
                              child: const Text(
                                "No enrolled students found.",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: acceptedStudents.length,
                            itemBuilder: (context, index) {
                              final booking = acceptedStudents[index];

                              return Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: CustomCardnew(
                                  title:
                                      booking.parentDetails?.fullName ??
                                      "Parent name",
                                  subtitle: "Class ${props?.level ?? ''}",
                                  iconName:
                                      booking.studentName ?? "Student name",
                                  imagePath:
                                      booking.parentDetails?.profilePicture ??
                                      'assets/backround/Rectangle 5050 (5).png',
                                  fullscrenonTap: () {
                                    _showStudentInfoModal(context, booking);
                                  },
                                ),
                              );
                            },
                          ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  //================= Student info modal and mark as complete logic ========================
  void _showStudentInfoModal(BuildContext context, BookingModel booking) {
    final MarkAsCompleteController completeController = Get.put(
      MarkAsCompleteController(),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        content: Obx(
          () => Rejecationpaddinginpormationmodel(
            bookingData: booking,
            buttonname1: 'Mark as complete',
            buttonname2: 'Close',
            isLoading: completeController.isLoading.value,
            ontap1: completeController.isLoading.value
                ? () {}
                : () => completeController.completeBooking(booking.id!),
            ontap2: completeController.isLoading.value
                ? () {}
                : () => Get.back(),
          ),
        ),
      ),
    );
  }

  //================= Mark as inactive dialog ========================
}
