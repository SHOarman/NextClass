

import 'package:flutter/material.dart';

import '../../../widget/nav_button/nav_button.dart';
import '../../../widget/tab_manubar/tab_manubar.dart';

class Bokkingdetels extends StatelessWidget {
  const Bokkingdetels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: NavButton(selectIndex: 1),


      body: TapBar()

    );
  }
}








