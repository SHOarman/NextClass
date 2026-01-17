// // import 'dart:convert';
// //
// // // JSON String থেকে মডেলে রূপান্তর করার ফাংশন
// // TutorClassResponse tutorClassResponseFromJson(String str) =>
// //     TutorClassResponse.fromJson(json.decode(str));
// //
// // String tutorClassResponseToJson(TutorClassResponse data) =>
// //     json.encode(data.toJson());
// //
// // class TutorClassResponse {
// //   final int? count;
// //   final String? next;
// //   final String? previous;
// //   final List<TutorClass>? results;
// //
// //   TutorClassResponse({
// //     this.count,
// //     this.next,
// //     this.previous,
// //     this.results,
// //   });
// //
// //   factory TutorClassResponse.fromJson(Map<String, dynamic> json) => TutorClassResponse(
// //     count: json["count"],
// //     next: json["next"],
// //     previous: json["previous"],
// //     results: json["results"] != null
// //         ? List<TutorClass>.from(json["results"].map((x) => TutorClass.fromJson(x)))
// //         : [],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "count": count,
// //     "next": next,
// //     "previous": previous,
// //     "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
// //   };
// // }
// //
// // class TutorClass {
// //   final int? classId;
// //   final String? classListing;
// //   final String? tutorName;
// //   final int? tutorId;
// //   final String? pricePerHour;
// //   final String? level;
// //   final String? subject;
// //   final dynamic bookingDate;
// //   final String? description;
// //   final dynamic numberOfStudents;
// //   final String? verifyStatus;
// //   final int? approvedById;
// //   final String? approvedByName;
// //   final DateTime? approvedAt;
// //   final double? latitude;
// //   final double? longitude;
// //   final DateTime? createdAt;
// //   final DateTime? updatedAt;
// //
// //   // দূরত্বের হিসেব রাখার জন্য লোকাল ভেরিয়েবল (ঐচ্ছিক)
// //   double? distanceFromUser;
// //
// //   TutorClass({
// //     this.classId,
// //     this.classListing,
// //     this.tutorName,
// //     this.tutorId,
// //     this.pricePerHour,
// //     this.level,
// //     this.subject,
// //     this.bookingDate,
// //     this.description,
// //     this.numberOfStudents,
// //     this.verifyStatus,
// //     this.approvedById,
// //     this.approvedByName,
// //     this.approvedAt,
// //     this.latitude,
// //     this.longitude,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.distanceFromUser,
// //   });
// //
// //   factory TutorClass.fromJson(Map<String, dynamic> json) => TutorClass(
// //     classId: json["class_id"],
// //     classListing: json["class_listing"],
// //     tutorName: json["tutor_name"],
// //     tutorId: json["tutor_id"],
// //     pricePerHour: json["price_per_hour"],
// //     level: json["level"],
// //     subject: json["subject"],
// //     bookingDate: json["booking_date"],
// //     description: json["description"],
// //     numberOfStudents: json["number_of_students"],
// //     verifyStatus: json["verify_status"],
// //     approvedById: json["approved_by_id"],
// //     approvedByName: json["approved_by_name"],
// //     approvedAt: json["approved_at"] == null ? null : DateTime.parse(json["approved_at"]),
// //     latitude: json["latitude"]?.toDouble(),
// //     longitude: json["longitude"]?.toDouble(),
// //     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
// //     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "class_id": classId,
// //     "class_listing": classListing,
// //     "tutor_name": tutorName,
// //     "tutor_id": tutorId,
// //     "price_per_hour": pricePerHour,
// //     "level": level,
// //     "subject": subject,
// //     "booking_date": bookingDate,
// //     "description": description,
// //     "number_of_students": numberOfStudents,
// //     "verify_status": verifyStatus,
// //     "approved_by_id": approvedById,
// //     "approved_by_name": approvedByName,
// //     "approved_at": approvedAt?.toIso8601String(),
// //     "latitude": latitude,
// //     "longitude": longitude,
// //     "createdAt": createdAt?.toIso8601String(),
// //     "updatedAt": updatedAt?.toIso8601String(),
// //   };
// // }
//
//
//
//
//
// import 'dart:convert';
//
// // JSON String থেকে মডেলে রূপান্তর করার ফাংশন
// NearbyClassResponse nearbyClassResponseFromJson(String str) => NearbyClassResponse.fromJson(json.decode(str));
//
// String nearbyClassResponseToJson(NearbyClassResponse data) => json.encode(data.toJson());
//
// class NearbyClassResponse {
//   int? count;
//   String? next;
//   String? previous;
//   List<NearbyClassModel>? results;
//
//   NearbyClassResponse({
//     this.count,
//     this.next,
//     this.previous,
//     this.results,
//   });
//
//   factory NearbyClassResponse.fromJson(Map<String, dynamic> json) {
//     return NearbyClassResponse(
//       count: json["count"],
//       next: json["next"],
//       previous: json["previous"],
//       // ✅ results যদি List হয়, তবেই ম্যাপ করবে
//       results: json["results"] != null && json["results"] is List
//           ? List<NearbyClassModel>.from(json["results"].map((x) => NearbyClassModel.fromJson(x)))
//           : [],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "count": count,
//     "next": next,
//     "previous": previous,
//     "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
//   };
// }
//
// class NearbyClassModel {
//   int? id;
//   String? type;
//   String? geometry;
//   NearbyClassProperties? properties;
//
//   NearbyClassModel({
//     this.id,
//     this.type,
//     this.geometry,
//     this.properties,
//   });
//
//   // ==========================================
//   // 🔥 Location Logic (অপরিবর্তিত রাখা হয়েছে)
//   // ==========================================
//
//   // Geometry "POINT (90.412 23.810)" থেকে Latitude বের করা
//   double get lat {
//     if (geometry == null || !geometry!.contains("POINT")) return 0.0;
//     try {
//       var clean = geometry!.replaceAll("POINT (", "").replaceAll(")", "");
//       var coords = clean.split(" ");
//       return double.tryParse(coords[1]) ?? 0.0;
//     } catch (e) {
//       return 0.0;
//     }
//   }
//
//   // Geometry থেকে Longitude বের করা
//   double get lng {
//     if (geometry == null || !geometry!.contains("POINT")) return 0.0;
//     try {
//       var clean = geometry!.replaceAll("POINT (", "").replaceAll(")", "");
//       var coords = clean.split(" ");
//       return double.tryParse(coords[0]) ?? 0.0;
//     } catch (e) {
//       return 0.0;
//     }
//   }
//
//   factory NearbyClassModel.fromJson(Map<String, dynamic> json) => NearbyClassModel(
//     id: json["id"],
//     type: json["type"],
//     geometry: json["geometry"],
//     properties: json["properties"] != null ? NearbyClassProperties.fromJson(json["properties"]) : null,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "type": type,
//     "geometry": geometry,
//     "properties": properties?.toJson(),
//   };
// }
//
// class NearbyClassProperties {
//   int? tutorId;
//   NearbyTutorDetails? tutorDetails;
//   String? title;
//   String? description;
//   String? subject;
//   double? pricePerHour;
//   String? level;
//   double? averageRating;
//   String? status;
//   String? createdAt;
//
//   NearbyClassProperties({
//     this.tutorId,
//     this.tutorDetails,
//     this.title,
//     this.description,
//     this.subject,
//     this.pricePerHour,
//     this.level,
//     this.averageRating,
//     this.status,
//     this.createdAt,
//   });
//
//   factory NearbyClassProperties.fromJson(Map<String, dynamic> json) => NearbyClassProperties(
//     tutorId: json["tutor"],
//     tutorDetails: json["tutor_details"] != null ? NearbyTutorDetails.fromJson(json["tutor_details"]) : null,
//     title: json["title"],
//     description: json["description"],
//     subject: json["subject"],
//     // ✅ Safe Parsing
//     pricePerHour: json["price_per_hour"] != null ? double.tryParse(json["price_per_hour"].toString()) : 0.0,
//     level: json["level"],
//     averageRating: json["average_rating"] != null ? double.tryParse(json["average_rating"].toString()) : 0.0,
//     status: json["status"],
//     createdAt: json["created_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "tutor": tutorId,
//     "tutor_details": tutorDetails?.toJson(),
//     "title": title,
//     "description": description,
//     "subject": subject,
//     "price_per_hour": pricePerHour,
//     "level": level,
//     "average_rating": averageRating,
//     "status": status,
//     "created_at": createdAt,
//   };
// }
//
// class NearbyTutorDetails {
//   int? id;
//   String? fullName;
//   String? profilePicture;
//
//   NearbyTutorDetails({
//     this.id,
//     this.fullName,
//     this.profilePicture,
//   });
//
//   factory NearbyTutorDetails.fromJson(Map<String, dynamic> json) => NearbyTutorDetails(
//     id: json["id"],
//     fullName: json["full_name"],
//     profilePicture: json["profile_picture"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "full_name": fullName,
//     "profile_picture": profilePicture,
//   };
// }



import 'dart:convert';

TutorClassResponse tutorClassResponseFromJson(String str) => TutorClassResponse.fromJson(json.decode(str));

class TutorClassResponse {
  int? count;
  List<TutorModel>? results;

  TutorClassResponse({this.count, this.results});

  factory TutorClassResponse.fromJson(Map<String, dynamic> json) {
    return TutorClassResponse(
      count: json["count"],
      results: json["results"] != null
          ? List<TutorModel>.from(json["results"].map((x) => TutorModel.fromJson(x)))
          : [],
    );
  }
}

class TutorModel {
  int? classId;
  String? classListing;
  String? tutorName;
  int? tutorId;
  String? pricePerHour;
  String? subject;
  String? verifyStatus;
  double? latitude;
  double? longitude;
  String? description;
  // ইমেজ ফিল্ড আপনার JSON এ নেই, তাই আপাতত ডিফল্ট রাখব বা নাল হ্যান্ডেল করব
  String? profilePicture;

  TutorModel({
    this.classId,
    this.classListing,
    this.tutorName,
    this.tutorId,
    this.pricePerHour,
    this.subject,
    this.verifyStatus,
    this.latitude,
    this.longitude,
    this.description,
    this.profilePicture,
  });

  factory TutorModel.fromJson(Map<String, dynamic> json) => TutorModel(
    classId: json["class_id"],
    classListing: json["class_listing"],
    tutorName: json["tutor_name"],
    tutorId: json["tutor_id"],
    // Price String হিসেবে আসছে, তাই সরাসরি String রাখছি
    pricePerHour: json["price_per_hour"],
    subject: json["subject"],
    verifyStatus: json["verify_status"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    description: json["description"],
    // JSON এ ইমেজ নেই, তাই আপাতত নাল
    profilePicture: null,
  );
}