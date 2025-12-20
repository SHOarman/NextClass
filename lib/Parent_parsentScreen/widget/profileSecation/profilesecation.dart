import 'package:flutter/material.dart';

class Profilesecation extends StatelessWidget {
  const Profilesecation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                //===================================
              },
              child: Image.asset(
                'assets/backround/Rectangle 5040.png',
                height: 45,
                width: 45,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Hans',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff121212),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Los Angles, Street 2/A, USA',
                    style: TextStyle(color: Color(0xff2B2B2B), fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
