//======================= Booking API Response Model ========================
class BookingResponseModel {
  int? count;            // Total number of bookings
  String? next;          // Next page URL
  String? previous;      // Previous page URL
  List<BookingModel>? results; // List of booking objects

  BookingResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  // Convert JSON to BookingResponseModel
  factory BookingResponseModel.fromJson(Map<String, dynamic> json) {
    return BookingResponseModel(
      count: (json['count'] as num?)?.toInt() ?? 0,
      next: json['next']?.toString(),
      previous: json['previous']?.toString(),
      results: json['results'] != null
          ? (json['results'] as List)
          .map((x) => BookingModel.fromJson(x))
          .toList()
          : [],
    );
  }
}

//======================= Single Booking Model ========================
class BookingModel {
  int? id;                       // Booking ID
  int? parent;                   // Parent user ID
  UserAccountDetails? parentDetails; // Parent details object
  int? tutor;                    // Tutor user ID
  UserAccountDetails? tutorDetails;  // Tutor details object
  int? classListing;             // Class listing ID
  ClassDetails? classDetails;    // Class information
  String? bookingDate;           // Booking date
  String? startTime;             // Class start time
  String? endTime;               // Class end time
  int? numberOfStudents;         // Number of students

  //======================= Student Info (Card-wise) ========================
  String? studentName;           // Student name for this booking
  int? studentAge;               // Student age

  //======================= Booking Status & Price ========================
  String? status;                // pending / accepted / cancelled
  String? totalPrice;            // Total booking price
  String? currency;              // Currency (SGD, USD, etc.)
  String? parentNotes;           // Notes from parent
  String? createdAt;             // Booking creation time

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

  //======================= JSON to BookingModel ========================
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: (json['id'] as num?)?.toInt(),
      parent: (json['parent'] as num?)?.toInt(),

      // Parent details
      parentDetails: json['parent_details'] != null
          ? UserAccountDetails.fromJson(json['parent_details'])
          : null,

      tutor: (json['tutor'] as num?)?.toInt(),

      // Tutor details
      tutorDetails: json['tutor_details'] != null
          ? UserAccountDetails.fromJson(json['tutor_details'])
          : null,

      classListing: (json['class_listing'] as num?)?.toInt(),

      // Class information
      classDetails: json['class_details'] != null
          ? ClassDetails.fromJson(json['class_details'])
          : null,

      bookingDate: json['booking_date']?.toString(),
      startTime: json['start_time']?.toString(),
      endTime: json['end_time']?.toString(),
      numberOfStudents:
      (json['number_of_students'] as num?)?.toInt() ?? 1,

      //======================= Student Info Logic ========================
      // 1. Try from root JSON
      // 2. If not found, try inside parent_details
      // 3. If still not found, set default values
      studentName: json['student_name']?.toString() ??
          json['parent_details']?['student_name']?.toString() ??
          "Student",

      studentAge: (json['student_age'] as num?)?.toInt() ??
          (json['parent_details']?['student_age'] as num?)?.toInt() ??
          0,

      status: json['status']?.toString() ?? "pending",
      totalPrice: json['total_price']?.toString() ?? "0.00",
      currency: json['currency']?.toString() ?? "SGD",
      parentNotes: json['parent_notes']?.toString() ?? "",
      createdAt: json['created_at']?.toString(),
    );
  }
}

//======================= User Account Details ========================
class UserAccountDetails {
  int? id;                   // User ID
  String? fullName;          // Full name
  String? profilePicture;    // Profile image URL
  String? status;            // User status
  UserProfile? profile;      // Extra profile info

  UserAccountDetails({
    this.id,
    this.fullName,
    this.profilePicture,
    this.status,
    this.profile,
  });

  factory UserAccountDetails.fromJson(Map<String, dynamic> json) {
    return UserAccountDetails(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name']?.toString() ?? "N/A",
      profilePicture: json['profile_picture']?.toString(),
      status: json['status']?.toString(),
      profile: json['profile'] != null
          ? UserProfile.fromJson(json['profile'])
          : null,
    );
  }
}

//======================= User Profile ========================
class UserProfile {
  int? id;                // Profile ID
  String? bio;            // Short bio
  double? averageRating;  // User rating

  UserProfile({
    this.id,
    this.bio,
    this.averageRating,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: (json['id'] as num?)?.toInt(),
      bio: json['bio']?.toString() ?? "",
      averageRating:
      (json['average_rating'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

//======================= Class Details ========================
class ClassDetails {
  int? id;                         // Class ID
  ClassProperties? properties;     // Class properties

  ClassDetails({this.id, this.properties});

  factory ClassDetails.fromJson(Map<String, dynamic> json) {
    return ClassDetails(
      id: (json['id'] as num?)?.toInt(),
      properties: json['properties'] != null
          ? ClassProperties.fromJson(json['properties'])
          : null,
    );
  }
}

//======================= Class Properties ========================
class ClassProperties {
  String? subject;        // Subject name
  String? level;          // Class level
  String? pricePerHour;   // Price per hour
  String? address;        // Class address

  ClassProperties({
    this.subject,
    this.level,
    this.pricePerHour,
    this.address,
  });

  factory ClassProperties.fromJson(Map<String, dynamic> json) {
    return ClassProperties(
      subject: json['subject']?.toString() ?? "N/A",
      level: json['level']?.toString() ?? "N/A",
      pricePerHour: json['price_per_hour']?.toString() ?? "0.00",
      address: json['address']?.toString() ?? "No Address",
    );
  }
}
