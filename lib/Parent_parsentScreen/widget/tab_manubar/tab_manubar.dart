import 'package:first_project/Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/accpect/accpectd.dart';
import 'package:first_project/Parent_parsentScreen/home_Ui/homedetels/bokkingdetels/completed/completed.dart';
import 'package:flutter/material.dart';

import '../../home_Ui/homedetels/bokkingdetels/requested/rejected.dart';

class TapBar extends StatefulWidget {
  const TapBar({super.key});

  @override
  State<TapBar> createState() => TapBarState();
}

class TapBarState extends State<TapBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Track your bookings',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          bottom: TabBar(
            labelColor: Color(0xff2563EB),
            indicatorColor: Color(0xff2563EB),
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'accepted'),
              Tab(text: 'Completed'),
              Tab(text: 'rejected'),
            ],
          ),
        ),
        body: TabBarView(children: [Accpectd(), Completed(), Rejected()]),
      ),
    );
  }
}
