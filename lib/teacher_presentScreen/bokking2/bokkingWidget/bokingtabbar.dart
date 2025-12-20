import 'package:flutter/material.dart';

import '../Acceptedvalue.dart';
import '../Pendingvalue.dart';
import '../Rejectedvalue.dart';

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
              Tab(text: 'Accepted 30'),
              Tab(text: 'Rejected 5'),
            ],
          ),

          const SizedBox(height: 12),

          /// TAB VIEW (IMPORTANT: give height)
          SizedBox(
            height: 400,
            child: const TabBarView(
              children: [
                Pendingvalue(),
                Acceptedvalue(),
                Rejectedvalue(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
