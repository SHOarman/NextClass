import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NavButton2 extends StatefulWidget {
  const NavButton2({super.key, this.selectIndex});
  final int? selectIndex;

  @override
  State<NavButton2> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton2> {
  int myindex = 0;

  @override
  void initState() {
    myindex = widget.selectIndex ?? 0;
    super.initState();
  }

  // --- Change made here: Replaced Get.toNamed with Get.offNamed ---
  void _navigateToScreen(int index) {
    print(index);
    if (index == 0) {
      Get.offNamed(AppRoute.home2);
    }
    if (index == 1) {
      Get.offNamed(AppRoute.bokking2);
    }
    if (index == 2) {
      Get.offNamed(AppRoute.classes);
    } else if (index == 3) {
       Get.toNamed(AppRoute.techerchat);

    }
    if (index == 4) {
      Get.offNamed(AppRoute.myprofile2);
    }
  }
  // -----------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    List<String> titles = ["Home", "Bookings", "Classes", "chat"];

    // Normal / inactive icons
    List<String> inactiveIcons = [
      'assets/icon/home.svg',
      'assets/icon/boking.svg',
      'assets/icon/classes onactive.svg',
      'assets/icon/chat.svg',
    ];

    // Active / colorful icons
    List<String> activeIcons = [
      'assets/icon/active home.svg',
      'assets/icon/activebokking.svg',
      'assets/icon/classesactive.svg',
      'assets/icon/activemsg.svg',
    ];

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 24,
            color: Color(0x26000000),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(titles.length, (index) {
          bool selected = myindex == index;

          return GestureDetector(
            onTap: () {
              setState(() => myindex = index);
              _navigateToScreen(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  selected ? activeIcons[index] : inactiveIcons[index],
                  height: 24,
                ),
                SizedBox(height: 4),
                Text(
                  titles[index],
                  style: TextStyle(
                    color: selected ? Color(0xFF2563EB) : Color(0xFF888888),
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
