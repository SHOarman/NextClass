import 'dart:convert';

ListingResponse listingResponseFromJson(String str) => ListingResponse.fromJson(json.decode(str));

String listingResponseToJson(ListingResponse data) => json.encode(data.toJson());

class ListingResponse {
  int? count;
  String? next;
  String? previous;
  ListingResults? results;

  ListingResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ListingResponse.fromJson(Map<String, dynamic> json) => ListingResponse(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: json["results"] != null ? ListingResults.fromJson(json["results"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": results?.toJson(),
  };
}

class ListingResults {
  String? type;
  List<ListingFeature>? features;

  ListingResults({
    this.type,
    this.features,
  });

  factory ListingResults.fromJson(Map<String, dynamic> json) => ListingResults(
    type: json["type"],
    features: json["features"] != null
        ? List<ListingFeature>.from(json["features"].map((x) => ListingFeature.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x.toJson())),
  };
}

class ListingFeature {
  int? id;
  String? type;
  String? geometry;
  ListingProperties? properties;

  ListingFeature({
    this.id,
    this.type,
    this.geometry,
    this.properties,
  });

  factory ListingFeature.fromJson(Map<String, dynamic> json) => ListingFeature(
    id: json["id"],
    type: json["type"],
    geometry: json["geometry"],
    properties: json["properties"] != null ? ListingProperties.fromJson(json["properties"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "geometry": geometry,
    "properties": properties?.toJson(),
  };
}

class ListingProperties {
  int? tutorId;
  TutorDetails? tutorDetails;
  String? title;
  String? description;
  String? classType;
  String? subject;
  int? minAge;
  int? maxAge;
  String? level;
  double? pricePerHour;
  String? currency;
  String? address;
  String? postalCode;
  String? venueName;
  int? durationMinutes;
  int? maxStudents;
  int? minStudents;
  bool? isGroupClass;
  String? featuredImage;
  String? status;
  int? totalBookings;
  double? averageRating;
  int? totalReviews;
  String? createdAt;
  List<Schedule>? schedules;

  ListingProperties({
    this.tutorId,
    this.tutorDetails,
    this.title,
    this.description,
    this.classType,
    this.subject,
    this.minAge,
    this.maxAge,
    this.level,
    this.pricePerHour,
    this.currency,
    this.address,
    this.postalCode,
    this.venueName,
    this.durationMinutes,
    this.maxStudents,
    this.minStudents,
    this.isGroupClass,
    this.featuredImage,
    this.status,
    this.totalBookings,
    this.averageRating,
    this.totalReviews,
    this.createdAt,
    this.schedules,
  });

  factory ListingProperties.fromJson(Map<String, dynamic> json) => ListingProperties(
    tutorId: json["tutor"],
    tutorDetails: json["tutor_details"] != null ? TutorDetails.fromJson(json["tutor_details"]) : null,
    title: json["title"],
    description: json["description"],
    classType: json["class_type"],
    subject: json["subject"],
    minAge: json["min_age"],
    maxAge: json["max_age"],
    level: json["level"],
    pricePerHour: json["price_per_hour"] != null ? double.tryParse(json["price_per_hour"].toString()) : 0.0,
    currency: json["currency"],
    address: json["address"],
    postalCode: json["postal_code"],
    venueName: json["venue_name"],
    durationMinutes: json["duration_minutes"],
    maxStudents: json["max_students"],
    minStudents: json["min_students"],
    isGroupClass: json["is_group_class"],
    featuredImage: json["featured_image"],
    status: json["status"],
    totalBookings: json["total_bookings"],
    averageRating: json["average_rating"] != null ? double.tryParse(json["average_rating"].toString()) : 0.0,
    totalReviews: json["total_reviews"],
    createdAt: json["created_at"],
    schedules: json["schedules"] != null
        ? List<Schedule>.from(json["schedules"].map((x) => Schedule.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "tutor": tutorId,
    "tutor_details": tutorDetails?.toJson(),
    "title": title,
    "description": description,
    "class_type": classType,
    "subject": subject,
    "min_age": minAge,
    "max_age": maxAge,
    "level": level,
    "price_per_hour": pricePerHour?.toStringAsFixed(2),
    "currency": currency,
    "address": address,
    "postal_code": postalCode,
    "venue_name": venueName,
    "duration_minutes": durationMinutes,
    "max_students": maxStudents,
    "min_students": minStudents,
    "is_group_class": isGroupClass,
    "featured_image": featuredImage,
    "status": status,
    "total_bookings": totalBookings,
    "average_rating": averageRating?.toStringAsFixed(2),
    "total_reviews": totalReviews,
    "created_at": createdAt,
    "schedules": schedules == null ? [] : List<dynamic>.from(schedules!.map((x) => x.toJson())),
  };
}

class TutorDetails {
  int? id;
  String? username;
  String? email;
  String? fullName;
  String? profilePicture;
  bool? isVerified;

  TutorDetails({
    this.id,
    this.username,
    this.email,
    this.fullName,
    this.profilePicture,
    this.isVerified,
  });

  factory TutorDetails.fromJson(Map<String, dynamic> json) => TutorDetails(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    fullName: json["full_name"],
    profilePicture: json["profile_picture"],
    isVerified: json["is_verified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "full_name": fullName,
    "profile_picture": profilePicture,
    "is_verified": isVerified,
  };
}

class Schedule {
  int? id;
  String? dayOfWeek;
  String? startTime;
  String? endTime;
  bool? isRecurring;

  Schedule({
    this.id,
    this.dayOfWeek,
    this.startTime,
    this.endTime,
    this.isRecurring,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    id: json["id"],
    dayOfWeek: json["day_of_week"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    isRecurring: json["is_recurring"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "day_of_week": dayOfWeek,
    "start_time": startTime,
    "end_time": endTime,
    "is_recurring": isRecurring,
  };
}