import 'package:first_project/teacher_presentScreen/cleses/activepage.dart';
import 'package:first_project/teacher_presentScreen/cleses/inactivepage.dart';
import 'package:flutter/material.dart';

class Classestab extends StatelessWidget {
  final Function(int) onTabChange;

  const Classestab({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          final TabController controller = DefaultTabController.of(context);

          controller.addListener(() {
            if (!controller.indexIsChanging) {
              onTabChange(controller.index);
            }
          });

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TabBar(
                labelColor: Color(0xff2563EB),
                indicatorColor: Color(0xff2563EB),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'Active'),
                  Tab(text: 'Inactive'),
                ],
              ),
              const SizedBox(height: 12),
              const Expanded(
                child: TabBarView(children: [Activepage(), Inactivepage()]),
              ),
            ],
          );
        },
      ),
    );
  }
}

// import 'package:first_project/teacher_presentScreen/cleses/inactivepage.dart';
// import 'package:flutter/material.dart';
//
// import 'activepage.dart';
//
//
// class Classestab extends StatelessWidget {
//   const Classestab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       initialIndex: 0,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// TAB BAR
//           const TabBar(
//             labelColor: Color(0xff2563EB),
//             indicatorColor: Color(0xff2563EB),
//             dividerColor: Colors.transparent,
//             indicatorSize: TabBarIndicatorSize.tab,
//
//             tabs: [
//               Tab(text: 'Active'),
//               Tab(text: 'Inactive'),
//
//             ],
//           ),
//
//           const SizedBox(height: 12),
//
//           /// TAB VIEW (IMPORTANT: give height)
//
//            Expanded(
//              child: TabBarView(
//                 children: [
//
//                   Activepage(),
//                  Inactivepage()
//
//                 ],
//               ),
//            ),
//
//         ],
//       ),
//     );
//   }
// }
