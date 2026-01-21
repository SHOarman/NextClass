import 'package:first_project/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NavButton extends StatefulWidget {
  const NavButton({super.key, this.selectIndex});
  final int? selectIndex;

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  int myindex = 0;

  @override
  void initState() {
    myindex = widget.selectIndex ?? 0;
    super.initState();
  }

  // --- Change made here: Replaced Get.toNamed with Get.offNamed ---
  void _navigateToScreen(int index) {
    // Get.offNamed replaces the current screen on the stack with the new one.
    // This prevents history buildup when switching between main navigation screens.
    if (index == 0) Get.offNamed(AppRoute.homedetels);
    if (index == 1) Get.offNamed(AppRoute.bokkingdetels);
    if (index == 2) Get.offNamed(AppRoute.chartdetels);
    if (index == 3) Get.offNamed(AppRoute.myProfiledetels);
  }
  // -----------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    List<String> titles = ["Home", "Bookings", "chat", "Profile"];

    // Normal / inactive icons
    List<String> inactiveIcons = [
      'assets/icon/home.svg',
      'assets/icon/boking.svg',
      'assets/icon/chat.svg',
      'assets/icon/myprofile.svg',
    ];

    // Active / colorful icons
    List<String> activeIcons = [
      'assets/icon/active home.svg',
      'assets/icon/activebokking.svg',
      'assets/icon/activemsg.svg',
      'assets/icon/active propile.svg',
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
