import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardnew extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imagePath;
  final String? iconName;
  final double? rating; // optional rating
  final bool showRating;
  final VoidCallback? onTap;
  final VoidCallback? fullscrenonTap;

  const CustomCardnew({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconName,
    this.imagePath,
    this.rating,
    this.showRating = false,
    this.onTap,
    this.fullscrenonTap,
  });

  Color getStatusColor(String? iconName) {
    switch (iconName) {
      case 'accepted':
        return const Color(0xff1fc56a);
      case 'Pending':
        return const Color(0xffd1a30e);
      case 'reject by you':
        return const Color(0xff991B1B);
      case 'Group Class':
        return const Color(0xff1fc56a);
      case 'Individual Class':
        return const Color(0xff1fc56a);
      case 'Pending - 20':
        return const Color(0xff22C55E);
      case 'Student name':
        return const Color(0xff22C55E);
      case 'Emily Smith':
        return const Color(0xff22C55E);
      case 'Michael Johnson':
        return const Color(0xff22C55E);

      case 'James Brown':
        return const Color(0xff22C55E);
      case 'Sarah Williams':
        return const Color(0xff22C55E);

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (fullscrenonTap != null) {
          fullscrenonTap!();
        }
      },
      child: Container(
        height: 72,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: const Color(0xffF3F5F9),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: Image.asset(
                  imagePath!,
                  height: 56.h,
                  width: 56.w,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            IconButton(
              onPressed: onTap,
              icon: Text(
                iconName ?? '', // Ensure no null error when iconName is null
                style: TextStyle(
                  color: getStatusColor(iconName),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Star Rating
            if (showRating && rating != null) ...[
              SizedBox(width: 8.w),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[700], size: 18.sp),
                  SizedBox(width: 4.w),
                  Text(
                    rating!.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
