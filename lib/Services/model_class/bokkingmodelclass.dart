class BookingResponseModel {
  int? count;
  String? next;
  String? previous;
  List<BookingModel>? results;

  BookingResponseModel({this.count, this.next, this.previous, this.results});

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) {
    return BookingResponseModel(
      count: (json['count'] as num?)?.toInt() ?? 0,
      next: json['next']?.toString(),
      previous: json['previous']?.toString(),
      results: json['results'] != null
          ? List<BookingModel>.from(
          json['results'].map((x) => BookingModel.fromJson(x)))
          : [],
    );
  }
}

class BookingModel {
  int? id;
  int? parent;
  UserAccountDetails? parentDetails;
  int? tutor;
  UserAccountDetails? tutorDetails;
  int? classListing;
  ClassDetails? classDetails;
  String? bookingDate;
  String? startTime;
  String? endTime;
  int? numberOfStudents;

  String? studentName;
  int? studentAge;

  String? status;
  String? totalPrice;
  String? currency;
  String? parentNotes;
  String? createdAt;

  BookingModel({
    this.id,
    this.parent,
    this.parentDetails,
    this.tutor,
    this.tutorDetails,
    this.classListing,
    this.classDetails,
    this.bookingDate,
    this.startTime,
    this.endTime,
    this.numberOfStudents,
    this.studentName,
    this.studentAge,
    this.status,
    this.totalPrice,
    this.currency,
    this.parentNotes,
    this.createdAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: (json['id'] as num?)?.toInt(),
      parent: (json['parent'] as num?)?.toInt(),
      parentDetails: json['parent_details'] != null
          ? UserAccountDetails.fromJson(json['parent_details']) : null,
      tutor: (json['tutor'] as num?)?.toInt(),
      tutorDetails: json['tutor_details'] != null
          ? UserAccountDetails.fromJson(json['tutor_details']) : null,
      classListing: (json['class_listing'] as num?)?.toInt(),
      classDetails: json['class_details'] != null
          ? ClassDetails.fromJson(json['class_details']) : null,
      bookingDate: json['booking_date']?.toString(),
      startTime: json['start_time']?.toString(),
      endTime: json['end_time']?.toString(),
      numberOfStudents: (json['number_of_students'] as num?)?.toInt() ?? 1,

      // JSON থেকে সরাসরি ডাটা ম্যাপিং
      studentName: json['student_name']?.toString() ?? "N/A",
      studentAge: (json['student_age'] as num?)?.toInt(),

      status: json['status']?.toString() ?? "pending",
      totalPrice: json['total_price']?.toString() ?? "0.00",
      currency: json['currency']?.toString() ?? "SGD",
      parentNotes: json['parent_notes']?.toString() ?? "",
      createdAt: json['created_at']?.toString(),
    );
  }
}

class UserAccountDetails {
  int? id;
  String? fullName;
  String? profilePicture;
  String? status;

  // অনেক সময় parent_details এর ভেতরেও স্টুডেন্ট ডাটা থাকে
  String? studentName;
  int? studentAge;

  UserProfile? profile;

  UserAccountDetails({
    this.id,
    this.fullName,
    this.profilePicture,
    this.status,
    this.studentName,
    this.studentAge,
    this.profile,
  });

  factory UserAccountDetails.fromJson(Map<String, dynamic> json) {
    return UserAccountDetails(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name']?.toString() ?? "N/A",
      profilePicture: json['profile_picture']?.toString(),
      status: json['status']?.toString(),

      // parent_details এর ভেতর থেকে ম্যাপিং
      studentName: json['student_name']?.toString(),
      studentAge: (json['student_age'] as num?)?.toInt(),

      profile: json['profile'] != null ? UserProfile.fromJson(json['profile']) : null,
    );
  }
}

class UserProfile {
  int? id;
  String? bio;
  double? averageRating;

  UserProfile({this.id, this.bio, this.averageRating});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: (json['id'] as num?)?.toInt(),
      bio: json['bio']?.toString() ?? "",
      averageRating: (json['average_rating'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class ClassDetails {
  int? id;
  ClassProperties? properties;

  ClassDetails({this.id, this.properties});

  factory ClassDetails.fromJson(Map<String, dynamic> json) {
    return ClassDetails(
      id: (json['id'] as num?)?.toInt(),
      properties: json['properties'] != null
          ? ClassProperties.fromJson(json['properties']) : null,
    );
  }
}

class ClassProperties {
  String? subject;
  String? level;
  String? pricePerHour;
  String? address;

  ClassProperties({this.subject, this.level, this.pricePerHour, this.address});

  factory ClassProperties.fromJson(Map<String, dynamic> json) {
    return ClassProperties(
      subject: json['subject']?.toString() ?? "N/A",
      level: json['level']?.toString() ?? "N/A",
      pricePerHour: json['price_per_hour']?.toString() ?? "0.00",
      address: json['address']?.toString() ?? "No Address",
    );
  }
}