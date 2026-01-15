import 'package:first_project/teacher_presentScreen/cleses/classes_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../techerall_widget/nav_button/nav_button.dart';

class Cleses extends StatefulWidget {
  const Cleses({super.key});

  @override
  State<Cleses> createState() => _ClesesState();
}

class _ClesesState extends State<Cleses> {
  int currentTabIndex = 0; // 0 = Active, 1 = Inactive

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavButton2(selectIndex: 2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),

            /// 🔹 TITLE
            Text(
              currentTabIndex == 0 ? 'Listings' : 'List of Classes',
              style: const TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 12.h),

            /// 🔹 SUBTITLE
            Text(
              currentTabIndex == 0
                  ? 'You can manage your listings here'
                  : 'You can manage your all classes from here',
              style: const TextStyle(
                color: Color(0xff888888),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: 40.h),

            /// 🔹 TAB VIEW
            Expanded(
              child: Classestab(
                onTabChange: (index) {
                  setState(() {
                    currentTabIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:first_project/teacher_presentScreen/cleses/classes_tab.dart';
// import 'package:first_project/teacher_presentScreen/techerall_widget/nav_button/nav_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class Cleses extends StatelessWidget {
//   const Cleses({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: NavButton2(selectIndex: 2),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 100.h),
//             Text(
//               'Listings',
//               style: TextStyle(
//                 color: Color(0xff2B2B2B),
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: 12.h),
//             Text(
//               'You can manage your listings here',
//               style: TextStyle(
//                 color: Color(0xff888888),
//                 fontSize: 12,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             SizedBox(height: 40.h),
//
//             Expanded(child: Classestab()),
//           ],
//         ),
//       ),
//     );
//   }
// }
