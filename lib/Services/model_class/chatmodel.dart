<<<<<<< HEAD
=======
// import 'dart:convert';
//
// import 'model_class.dart';
//
// NearbyResponse nearbyResponseFromJson(String str) => NearbyResponse.fromJson(json.decode(str));
//
// String nearbyResponseToJson(NearbyResponse data) => json.encode(data.toJson());
//
// class NearbyResponse {
//   int? count;
//   double? radiusKm;
//   CenterLocation? center;
//   List<ListingFeature>? results;
//
//   NearbyResponse({
//     this.count,
//     this.radiusKm,
//     this.center,
//     this.results,
//   });
//
//   factory NearbyResponse.fromJson(Map<String, dynamic> json) {
//     return NearbyResponse(
//       count: json["count"],
//       // সেইফলি ডাবলে কনভার্ট করা (String বা Int যাই আসুক)
//       radiusKm: json["radius_km"] != null
//           ? double.tryParse(json["radius_km"].toString())
//           : 0.0,
//       center: json["center"] != null
//           ? CenterLocation.fromJson(json["center"])
//           : null,
//       // results কে সরাসরি ListingFeature এর লিস্ট হিসেবে ম্যাপ করা হচ্ছে
//       results: json["results"] != null
//           ? List<ListingFeature>.from(json["results"].map((x) => ListingFeature.fromJson(x)))
//           : [],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "count": count,
//     "radius_km": radiusKm,
//     "center": center?.toJson(),
//     "results": results != null
//         ? List<dynamic>.from(results!.map((x) => x.toJson()))
//         : [],
//   };
// }
//
// class CenterLocation {
//   double? lat;
//   double? lng;
//
//   CenterLocation({
//     this.lat,
//     this.lng,
//   });
//
//   factory CenterLocation.fromJson(Map<String, dynamic> json) {
//     return CenterLocation(
//       lat: json["lat"] != null ? double.tryParse(json["lat"].toString()) : 0.0,
//       lng: json["lng"] != null ? double.tryParse(json["lng"].toString()) : 0.0,
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "lat": lat,
//     "lng": lng,
//   };
// }

>>>>>>> origin/main
class ChatMessage {
  final int id;
  final int conversation;
  final int senderId;
  final String content;
  final bool isRead;
  final String createdAt;

  ChatMessage({
    required this.id,
    required this.conversation,
    required this.senderId,
    required this.content,
    required this.isRead,
    required this.createdAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] ?? 0,
      conversation: json['conversation'] ?? 0,
      senderId: json['sender'] ?? 0,
      content: json['content'] ?? '',
      isRead: json['is_read'] ?? false,
      createdAt: json['created_at'] ?? '',
    );
  }
}