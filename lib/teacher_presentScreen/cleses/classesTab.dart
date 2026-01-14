import 'package:first_project/teacher_presentScreen/cleses/activepage.dart';
import 'package:first_project/teacher_presentScreen/cleses/inactivepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Classestab extends StatefulWidget {
  final Function(int) onTabChange;

  const Classestab({super.key, required this.onTabChange});

  @override
  State<Classestab> createState() => _ClassestabState();
}

class _ClassestabState extends State<Classestab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 1. Initialize the TabController
    _tabController = TabController(length: 2, vsync: this);

    // 2. Add Listener (To notify parent when tab changes)
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        widget.onTabChange(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    // 3. Clean up memory
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Tab Bar Design (Custom Look)
        Container(
          height: 45.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // Background color of the TabBar
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Material(
            // Material widget prevents "No Material widget" error
            color: Colors.transparent,
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Colors.black, // Color for the Active/Selected Tab
                borderRadius: BorderRadius.circular(25.r),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: "Active"),
                Tab(text: "Inactive"),
              ],
              onTap: (index) {
                // Update immediately on tap
                widget.onTabChange(index);
              },
            ),
          ),
        ),

        SizedBox(height: 20.h),

        // 🔹 Tab View Sections (The Pages)
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              Activepage(),
              InactivePage(),
            ],
          ),
        ),
      ],
    );
  }
}