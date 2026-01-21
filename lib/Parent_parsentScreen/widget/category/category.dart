import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenCategories extends StatelessWidget {
  const HomeScreenCategories({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'title': 'Mathematics',
      'color': Color(0xFF6AA760),
      'image': 'assets/icon/math.svg',
    },
    {
      'title': 'English',
      'color': Color(0xFFE94D8E),
      'image': 'assets/icon/sc.svg',
    },
    {
      'title': 'Science',
      'color': Color(0xFFF19E3A),
      'image': 'assets/icon/science.svg',
    },
    {
      'title': 'Social Studies',
      'color': Color(0xFF2962FF),
      'image': 'assets/icon/sc.svg',
    },
    {
      'title': 'Arts',
      'color': Color(0xFF8A2BE2),
      'image': 'assets/icon/sc.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60, // height of horizontal list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];

          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: item['color'].withOpacity(0.08),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: item['color'].withOpacity(0.4)),
                ),
                child: Center(
                  child: Text(
                    item['title'],
                    style: TextStyle(
                      color: item['color'],
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 15,
                  child: SvgPicture.asset(item['image']))
            ],

          );
        },
      ),
    );
  }
}
