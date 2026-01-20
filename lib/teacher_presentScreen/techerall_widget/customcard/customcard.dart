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
        // height: 72, // Remove fixed height to allow expansion if needed
        constraints: BoxConstraints(minHeight: 72.h),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: const Color(0xffF3F5F9),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imagePath != null) _buildImage(),
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            _buildTrailing(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    final cleanPath = imagePath!.trim();
    final isNetwork =
        cleanPath.startsWith('http') || cleanPath.startsWith('https');

    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: isNetwork
          ? Image.network(
              cleanPath,
              height: 56.h,
              width: 56.w,
              fit: BoxFit.cover,
              gaplessPlayback: true, // Smoother loading
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
              errorBuilder: (context, error, stackTrace) => _errorIcon(),
            )
          : Image.asset(
              cleanPath,
              height: 56.h,
              width: 56.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _errorIcon(),
            ),
    );
  }

  Widget _errorIcon() {
    return Container(
      height: 56.h,
      width: 56.w,
      color: Colors.grey[200],
      child: Icon(Icons.image_not_supported, size: 30.sp, color: Colors.grey),
    );
  }

  Widget _buildTrailing() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 100.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (iconName != null && iconName!.isNotEmpty)
            InkWell(
              onTap: onTap,
              child: Text(
                iconName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: getStatusColor(iconName),
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ),
          if (showRating && rating != null) ...[
            SizedBox(height: 4.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.yellow[700], size: 14.sp),
                SizedBox(width: 2.w),
                Text(
                  rating!.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
