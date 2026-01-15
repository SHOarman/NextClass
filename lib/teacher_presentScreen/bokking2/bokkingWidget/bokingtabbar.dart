import 'package:flutter/material.dart';

import '../accepted_value.dart';
import '../pending_value.dart';
import '../rejected_value.dart';

class Bokingtabbar extends StatelessWidget {
  const Bokingtabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TAB BAR
          const TabBar(
            labelColor: Color(0xff2563EB),
            indicatorColor: Color(0xff2563EB),
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'Pending 20'),
              Tab(text: 'accepted 30'),
              Tab(text: 'rejected 5'),
            ],
          ),

          const SizedBox(height: 12),

          /// TAB VIEW (IMPORTANT: give height)
          SizedBox(
            height: 400,
            child: const TabBarView(
              children: [
                Pendingvalue(),
                AcceptedValue(),
                RejectedValue(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
