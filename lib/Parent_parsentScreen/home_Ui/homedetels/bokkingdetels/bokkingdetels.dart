

import 'package:flutter/material.dart';

import '../../../widget/naev_button/neab_Button.dart';
import '../../../widget/tab_manubar/tab_manubar.dart';

class Bokkingdetels extends StatelessWidget {
  const Bokkingdetels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Nev_Button(SelectIndex: 1),


      body: TapBar()

    );
  }
}








