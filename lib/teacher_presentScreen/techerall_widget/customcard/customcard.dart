import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//==================== CUSTOM CARD WIDGET ==============================
// A reusable card widget used to display:
// - Title & subtitle
// - Optional image (network or asset)
// - Status text with dynamic color
// - Optional rating display
// - Click actions for full card and status text
//=====================================================================

class CustomCardnew extends StatelessWidget {

  //==================== INPUT PROPERTIES ==============================
  final String title;                 // Main title text
  final String subtitle;              // Subtitle text
  final String? imagePath;            // Image URL or asset path
  final String? iconName;             // Status text (e.g. accepted, pending)
  final double? rating;               // Optional rating value
  final bool showRating;              // Flag to show/hide rating
  final VoidCallback? onTap;           // Callback for status tap
  final VoidCallback? fullscrenonTap;  // Callback for full card tap
  //===================================================================

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

  //==================== STATUS COLOR LOGIC ============================
  // Returns color based on status text
  // Text is converted to lowercase to avoid case-sensitivity issues
  Color getStatusColor(String? iconName) {
    switch (iconName?.toLowerCase()) {

      case 'accepted':
        return const Color(0xff1fc56a); // Green

      case 'pending':
      case 'pending - 20':
        return const Color(0xffd1a30e); // Yellow

      case 'rejected':
      case 'cancelled':
      case 'reject by you':
        return const Color(0xff991B1B); // Red

    // Default green for specific user-related labels
      case 'student name':
      case 'emily smith':
      case 'michael johnson':
      case 'james brown':
      case 'sarah williams':
        return const Color(0xff22C55E);

      default:
        return Colors.grey; // Fallback color
    }
  }
  //===================================================================

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //==================== FULL CARD TAP =============================
      onTap: () {
        if (fullscrenonTap != null) {
          fullscrenonTap!();
        }
      },
      //===============================================================

      child: Container(
        constraints: BoxConstraints(minHeight: 72.h),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: const Color(0xffF3F5F9),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //==================== IMAGE SECTION ========================
            if (imagePath != null) _buildImage(),
            //===========================================================

            SizedBox(width: 12.w),

            //==================== TEXT SECTION =========================
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            //===========================================================

            SizedBox(width: 12.w),

            //==================== TRAILING SECTION =====================
            _buildTrailing(),
            //===========================================================
          ],
        ),
      ),
    );
  }

  //==================== IMAGE BUILDER ================================
  // Handles both network and asset images
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
  //==================================================================

  //==================== IMAGE ERROR FALLBACK =========================
  Widget _errorIcon() {
    return Container(
      height: 56.h,
      width: 56.w,
      color: Colors.grey[200],
      child: Icon(
        Icons.image_not_supported,
        size: 30.sp,
        color: Colors.grey,
      ),
    );
  }
  //==================================================================

  //==================== TRAILING WIDGET ==============================
  // Shows status text and optional rating
  Widget _buildTrailing() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 100.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          //==================== STATUS TEXT ===========================
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
          //===========================================================

          //==================== RATING SECTION ========================
          if (showRating && rating != null) ...[
            SizedBox(height: 4.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star,
                    color: Colors.yellow[700], size: 14.sp),
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
          //===========================================================
        ],
      ),
    );
  }
//==================================================================
}
