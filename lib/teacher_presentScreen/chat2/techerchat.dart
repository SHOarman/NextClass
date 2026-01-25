import 'package:first_project/teacher_presentScreen/techerall_widget/nav_button/nav_button.dart';
import 'package:flutter/material.dart';

class Techerchat extends StatelessWidget {
  const Techerchat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Padding(
        padding: const EdgeInsets.only(right: 150),
        child: Text("Chat with parent"),
      )),

      bottomNavigationBar: NavButton2(selectIndex: 3,),
      body: Column(
        children: [
          

        ],
      ),
    );
  }
}
