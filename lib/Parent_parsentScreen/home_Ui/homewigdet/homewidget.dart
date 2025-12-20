import 'package:flutter/material.dart';


class HomeImgeView extends StatelessWidget {
  const HomeImgeView({super.key, required this.title, required this.img});
  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          Positioned(
            left: 20,
            bottom: 50,
            child: Container(
              child: Text(
                title,
                style: TextStyle(color: Colors.white10),


              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 10,
            child: Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/backround/'),maxRadius: 13,),
                SizedBox(width: 6,),
                Text(
                'nrwww',
                    style: TextStyle(color: Colors.white10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}