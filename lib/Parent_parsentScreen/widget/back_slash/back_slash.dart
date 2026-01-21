import 'package:flutter/material.dart';

class BackSlashButton extends StatelessWidget {
  final VoidCallback onTap;

  const BackSlashButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios, // backslash style icon
            color: Colors.blue,
            size: 22,
          ),
          SizedBox(width: 6),
          Text(
            "Back",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}


//===================LoveReacteds


class LoveReacteds extends StatelessWidget {
  final VoidCallback onTap;

  const LoveReacteds({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios, // backslash style icon
            color: Colors.blue,
            size: 22,
          ),
          SizedBox(width: 6),
          Text(
            "Favorite tutor",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}



//========================Mathematic==========================================

class Mathematic extends StatelessWidget {
  final VoidCallback onTap;

  const Mathematic({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios, // backslash style icon
            color: Colors.blue,
            size: 22,
          ),
          SizedBox(width: 6),
          Text(
            "Mathematics",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
