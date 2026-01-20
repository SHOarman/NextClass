class ClassFeatureResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<ClassFeature> results;

  ClassFeatureResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ClassFeatureResponse.fromJson(Map<String, dynamic> json) {
    return ClassFeatureResponse(
      count: json['count'] ?? 0,
      next: json['next'],
      previous: json['previous'],
      results: (json['results']['features'] as List)
          .map((i) => ClassFeature.fromJson(i))
          .toList(),
    );
  }
}

class ClassFeature {
  final int id;
  final String type;
  final String geometry;
  final ClassProperties properties;

  ClassFeature({
    required this.id,
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory ClassFeature.fromJson(Map<String, dynamic> json) {
    return ClassFeature(
      id: json['id'] ?? 0,
      type: json['type'] ?? '',
      geometry: json['geometry'] ?? '',
      properties: ClassProperties.fromJson(json['properties']),
    );
  }
}

class ClassProperties {
  final int tutor;
  final TutorDetails tutorDetails;
  final String title;
  final String description;
  final String subject;
  final String level;
  final String pricePerHour;
  final String currency;
  final String address;
  final String status;
  final String averageRating;
  final List<Schedule> schedules;
  final DateTime createdAt;

  ClassProperties({
    required this.tutor,
    required this.tutorDetails,
    required this.title,
    required this.description,
    required this.subject,
    required this.level,
    required this.pricePerHour,
    required this.currency,
    required this.address,
    required this.status,
    required this.averageRating,
    required this.schedules,
    required this.createdAt,
  });

  factory ClassProperties.fromJson(Map<String, dynamic> json) {
    return ClassProperties(
      tutor: json['tutor'] ?? 0,
      tutorDetails: TutorDetails.fromJson(json['tutor_details']),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      subject: json['subject'] ?? '',
      level: json['level'] ?? '',
      pricePerHour: json['price_per_hour'] ?? '0.00',
      currency: json['currency'] ?? 'SGD',
      address: json['address'] ?? '',
      status: json['status'] ?? 'pending',
      averageRating: json['average_rating'] ?? '0.0',
      schedules: (json['schedules'] as List)
          .map((i) => Schedule.fromJson(i))
          .toList(),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

class TutorDetails {
  final int id;
  final String username;
  final String email;
  final String? profilePicture;
  final bool isVerified;
  final String fullName;
  final TutorProfile? profile;

  TutorDetails({
    required this.id,
    required this.username,
    required this.email,
    this.profilePicture,
    required this.isVerified,
    required this.fullName,
    this.profile,
  });
  factory TutorDetails.fromJson(Map<String, dynamic> json) {
    return TutorDetails(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      profilePicture: json['profile_picture'],
      isVerified: json['is_verified'] ?? false,
      fullName: json['full_name'] ?? '',
      profile: json['profile'] != null
          ? TutorProfile.fromJson(json['profile'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "full_name": fullName,
    "profile_picture": profilePicture,
    "is_verified": isVerified,
    "profile": profile?.toJson(),
  };
}

class TutorProfile {
  final String bio;
  final int yearsOfExperience;
  final double averageRating;
  final int totalReviews;
  final String verificationStatus;

  TutorProfile({
    required this.bio,
    required this.yearsOfExperience,
    required this.averageRating,
    required this.totalReviews,
    required this.verificationStatus,
  });

  factory TutorProfile.fromJson(Map<String, dynamic> json) {
    return TutorProfile(
      bio: json['bio'] ?? '',
      yearsOfExperience: json['years_of_experience'] ?? 0,
      averageRating: (json['average_rating'] as num).toDouble(),
      totalReviews: json['total_reviews'] ?? 0,
      verificationStatus: json['verification_status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "bio": bio,
    "years_of_experience": yearsOfExperience,
    "average_rating": averageRating,
    "total_reviews": totalReviews,
    "verification_status": verificationStatus,
  };
}

class Schedule {
  final int id;
  final String dayOfWeek;
  final String? startTime;
  final String? endTime;

  Schedule({
    required this.id,
    required this.dayOfWeek,
    this.startTime,
    this.endTime,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      dayOfWeek: json['day_of_week'] ?? '',
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}
