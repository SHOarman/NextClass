import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Services/model_class/usershow_model.dart';
import '../../../../core/route/route.dart';

class Recommendedclasses extends StatefulWidget {
  const Recommendedclasses({super.key, required this.classData, this.distance});

  final ClassFeature classData;
  final String? distance;

  @override
  State<Recommendedclasses> createState() => _RecommendedclassesState();
}

class _RecommendedclassesState extends State<Recommendedclasses> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final properties = widget.classData.properties;
    final tutorDetails = properties.tutorDetails;

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoute.recommendedTeacherDetails,
          arguments: widget.classData,
        );
      },
      child: Container(
       // width: 1.sw,
       // height: 360.h, // হাইট কিছুটা অ্যাডজাস্ট করা হয়েছে
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            16.r,
          ), // বর্ডার রেডিয়াস ১৬ স্ট্যান্ডার্ড
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // কন্টেন্ট বাম দিক থেকে শুরু হবে
          children: [
            // ======================= ১. ইমেজ সেকশন =======================
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: "tutor_${widget.classData.id}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.r),
                      ),
                      child: _buildImage(tutorDetails.profilePicture),
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: GestureDetector(
                      onTap: () => setState(() => isFavorite = !isFavorite),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withValues(alpha: 0.9),
                        radius: 15.r,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ======================= ২. ডিটেইলস সেকশন =======================
            Expanded(
              flex: 8, // টেক্সট সেকশনের জন্য ফ্ল্যাক্স অ্যাডজাস্টমেন্ট
              child: Padding(
                padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // টিউটরের নাম
                    Text(
                      tutorDetails.fullName,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff1F2937), // Dark grey
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 6.h), // নামের নিচে গ্যাপ
                    // সাবজেক্টের নাম
                    Text(
                      properties.subject,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff2563EB), // Primary Blue
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 4.h), // সাবজেক্টের নিচে ছোট গ্যাপ
                    // ক্লাসের নাম (Level)
                    Text(
                      "Class: ${properties.level}",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xff6B7280), // Muted text color
                      ),
                    ),

                SizedBox(height: 8.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${properties.pricePerHour}/monthly",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff2563EB),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String? url) {
    if (url == null || url.isEmpty || !url.startsWith('http')) {
      return Container(
        color: const Color(0xffF3F4F6),
        child: Icon(Icons.person, size: 50.sp, color: Colors.grey[400]),
      );
    }
    return Image.network(
      url,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        color: const Color(0xffF3F4F6),
        child: Icon(Icons.broken_image, size: 50.sp, color: Colors.grey[400]),
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
    required this.subjectName,
    required this.classname,
    required this.amount,
  });

  final int selectindex;
  final String imagepath;
  final String tutorielname;
  final String subjectName;
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
                      switch (widget.selectindex) {}
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
            Text(widget.subjectName),
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

//=====================LoveReactedClasses==================================================

class LoveReactedClasses extends StatefulWidget {
  const LoveReactedClasses({
    super.key,
    required this.selectindex,
    required this.imagepath,
    required this.tutorielname,
    required this.subjectName,
    required this.classname,
    required this.amount,
  });

  final int selectindex;
  final String imagepath;
  final String tutorielname;
  final String subjectName;
  final String classname;
  final String amount;

  @override
  State<LoveReactedClasses> createState() => _LoveReactedClassesState();
}

class _LoveReactedClassesState extends State<LoveReactedClasses> {
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
                    // print("Index clicked: ${widget.selectindex}");
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
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            Text(widget.tutorielname),
            Text(widget.subjectName),
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

//===============================MathematicClass================================================

class MathematicClass extends StatefulWidget {
  const MathematicClass({
    super.key,
    required this.selectindex,
    required this.imagepath,
    required this.tutorielname,
    required this.subjectName,
    required this.classname,
    required this.amount,
    this.fullData, // অপশনাল: পুরো মডেল ডাটা পাস করার জন্য
  });

  final int selectindex;
  final String imagepath;
  final String tutorielname;
  final String subjectName;
  final String classname;
  final String amount;
  final dynamic fullData;

  @override
  State<MathematicClass> createState() => _MathematicClassState();
}

class _MathematicClassState extends State<MathematicClass> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        // ✅ ক্লিক করলে ডিটেইলস স্ক্রিনে যাবে এবং ডাটা পাস করবে
        Get.toNamed(
          AppRoute.homedetels,
          arguments: {
            "index": widget.selectindex,
            "name": widget.tutorielname,
            "subject": widget.subjectName,
            "image": widget.imagepath,
            "price": widget.amount,
          },
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 11,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: widget.imagepath.startsWith('http')
                          ? Image.network(
                              widget.imagepath,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.person, size: 50),
                            )
                          : Image.asset(
                              widget.imagepath.isEmpty
                                  ? 'assets/image/default.png'
                                  : widget.imagepath,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    top: -8,
                    right: -8,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
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
              const SizedBox(height: 6),
              Text(
                widget.tutorielname,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                widget.subjectName,
                maxLines: 1,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(widget.classname, style: const TextStyle(fontSize: 12)),
              const Spacer(),
              Text(
                widget.amount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff2563EB),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
