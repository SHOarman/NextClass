


import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importing GetX for navigation

import '../../../../core/route/route.dart';

class Recommendedclasses extends StatefulWidget {
  const Recommendedclasses({
    super.key,
    required this.selectindex,
    required this.imagepath,
    required this.tutorielname,
    required this.Subjectname,
    required this.classname,
    required this.amount,
  });

  final int selectindex;
  final String imagepath;
  final String tutorielname;
  final String Subjectname;
  final String classname;
  final String amount;

  @override
  State<Recommendedclasses> createState() => _RecommendedclassesState();
}

class _RecommendedclassesState extends State<Recommendedclasses> {
  bool isFavorite = false;

  // Method to handle navigation based on the selected index
  void _navigateToDetailPage() {
    switch (widget.selectindex) {
      case 0:
        Get.toNamed(AppRoute.recommendedPageDetesTecher0);
        break;
      case 1:
        Get.toNamed(AppRoute.recommendedPageDetesTecher1);
        break;
      case 2:
        Get.toNamed(AppRoute.recommendedPageDetesTecher2);
        break;
      case 3:
        Get.toNamed(AppRoute.recommendedPageDetesTecher3);
        break;
      default:
      // Handle error or default navigation
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image + Favorite Button
          Stack(
            children: [
              GestureDetector(
                onTap: _navigateToDetailPage,
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.imagepath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              /// Favorite Button
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  splashRadius: 20,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          /// Texts
          Text(
            widget.tutorielname,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),

          Text(widget.Subjectname),
          const SizedBox(height: 4),

          Text(widget.classname),
          const SizedBox(height: 6),

          Text(
            widget.amount,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff2563EB),
            ),
          ),
        ],
      ),
    );
  }
}

//==========================exploerclassess=================================================

class Exploerclasses extends StatefulWidget {
  const Exploerclasses({
    super.key,
    required this.selectindex,
    required this.imagepath,
    required this.tutorielname,
    required this.Subjectname,
    required this.classname,
    required this.amount,
  });

  final int selectindex;
  final String imagepath;
  final String tutorielname;
  final String Subjectname;
  final String classname;
  final String amount;

  @override
  State<Exploerclasses> createState() => _ExploerclassesState();
}

class _ExploerclassesState extends State<Exploerclasses> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      switch (widget.selectindex) {

                      }
                    });
                  },
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(widget.imagepath, fit: BoxFit.cover),
                    ),
                  ),
                ),

                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            Text(widget.tutorielname),
            Text(widget.Subjectname),
            Text(widget.classname),
            Text(
              widget.amount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff2563EB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//=====================loveRecatedclasseds==================================================







class LoveRecatedclasseds extends StatefulWidget {
  const LoveRecatedclasseds({
    super.key,
    required this.selectindex,
    required this.imagepath,
    required this.tutorielname,
    required this.Subjectname,
    required this.classname,
    required this.amount,
  });

  final int selectindex;
  final String imagepath;
  final String tutorielname;
  final String Subjectname;
  final String classname;
  final String amount;

  @override

  State<LoveRecatedclasseds> createState() => _LoveRecatedclassedsState();
}


class _LoveRecatedclassedsState extends State<LoveRecatedclasseds> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {

                    print("Index clicked: ${widget.selectindex}");
                  },
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(widget.imagepath, fit: BoxFit.cover),
                    ),
                  ),
                ),

                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red, // কালার ফিক্স করা হয়েছে
                    ),
                    onPressed: () {
                      // ✅ setState এর জন্য addPostFrameCallback দরকার নেই, সরাসরি দিন
                      setState(() {

                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            Text(widget.tutorielname),
            Text(widget.Subjectname),
            Text(widget.classname),
            Text(
              widget.amount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff2563EB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//===============================mathmaticlass================================================




class Mathmaticlass extends StatefulWidget {
  const Mathmaticlass({
    super.key,
    required this.selectindex,
    required this.imagepath,
    required this.tutorielname,
    required this.Subjectname,
    required this.classname,
    required this.amount,
  });

  final int selectindex;
  final String imagepath;
  final String tutorielname;
  final String Subjectname;
  final String classname;
  final String amount;

  @override
  // ভুল ছিল: State<LoveRecatedclasseds>
  // সঠিক: State<Mathmaticlass>
  State<Mathmaticlass> createState() => _Mathmaticlass();
}

class _Mathmaticlass extends State<Mathmaticlass> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    print("Index clicked: ${widget.selectindex}");
                  },
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(widget.imagepath, fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // বাটন কাজ করার জন্য setState যোগ করা হলো
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(widget.tutorielname),
            Text(widget.Subjectname),
            Text(widget.classname),
            Text(
              widget.amount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff2563EB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
