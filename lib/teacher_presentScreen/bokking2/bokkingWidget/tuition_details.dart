import 'package:flutter/cupertino.dart';

class Tuitiondetails extends StatelessWidget {
  final String title;
  final String title1;
  final String title2;
  final String title3;
  final String title4;



  const Tuitiondetails({super.key, required this.title, required this.title2, required this.title3, required this.title4, required this.title1,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,

      decoration: BoxDecoration(
        color: Color(0xffF3F5F9),
        borderRadius: BorderRadius.circular(6)
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff2B2B2B),
              ),
            ),
          ),

          Positioned(
            top: 46,
            left: 10,
            child: Text(
              title1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff888888),
              ),
            ),
          ),
          Positioned(
            top: 72,
            left: 10,
            child: Text(
              title2,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff888888),
              ),
            ),
          ),

          Positioned(
            top: 46,
           right: 10,
            child: Text(
              title3,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff2563EB),

              ),
            ),
          ),
          Positioned(
            top: 72,
            right: 10,
            child: Text(
              title4,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff888888),
              ),
            ),
          ),
        ],
      ),


    );
  }
}
