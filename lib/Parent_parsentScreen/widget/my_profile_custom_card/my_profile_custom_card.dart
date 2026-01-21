import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyProfileButton extends StatefulWidget {
  final String icon;
  final String title;
  final Function ontap;

  const MyProfileButton({
    super.key,
    required this.icon,
    required this.title,
    required this.ontap,
  });

  @override
  State<MyProfileButton> createState() => _MyProfileButtonState();
}

class _MyProfileButtonState extends State<MyProfileButton> {
  bool isTapped = false;

  void handleTap() {
    setState(() {
      isTapped = true;
    });

    widget.ontap();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isTapped = true;
        });
        widget.ontap();
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            isTapped = false;
          });
        });
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: isTapped ? Border.all(color: Colors.blue) : null,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 24,
              spreadRadius: 0,
              color: Color(0xffF3F5F9),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: SvgPicture.asset(
                widget.icon,
                colorFilter: ColorFilter.mode(
                  Color(0xff888888),
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: 5),
            Text(widget.title, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
