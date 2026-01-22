// ১. মূল রেসপন্স মডেল (পুরো JSON অবজেক্টের জন্য)
class TutorSearchResponse {
  final int? count;
  final String? next;
  final String? previous;
  final List<TutorClassCard>? classList;

  TutorSearchResponse({this.count, this.next, this.previous, this.classList});

  factory TutorSearchResponse.fromJson(Map<String, dynamic> json) {
    return TutorSearchResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      // results['features'] থেকে ডাটা নিয়ে লিস্টে কনভার্ট করা হচ্ছে
      classList: json['results'] != null && json['results']['features'] != null
          ? List<TutorClassCard>.from(
              json['results']['features'].map(
                (x) => TutorClassCard.fromJson(x),
              ),
            )
          : [],
    );
  }
}

// ২. প্রতিটি ক্লাসের জন্য কার্ড বা ফিচার অবজেক্ট
class TutorClassCard {
  final int? id;
  final String? type;
  final String? geometry;
  final TutorClassDetails? details;

  TutorClassCard({this.id, this.type, this.geometry, this.details});

  factory TutorClassCard.fromJson(Map<String, dynamic> json) {
    return TutorClassCard(
      id: json['id'],
      type: json['type'],
      geometry: json['geometry'],
      details: json['properties'] != null
          ? TutorClassDetails.fromJson(json['properties'])
          : null,
    );
  }
}

// ৩. ক্লাসের আসল প্রপার্টি বা ডিটেইলস
class TutorClassDetails {
  final int? tutorId;
  final TutorUserInfo? tutorInfo;
  final String? title;
  final String? description;
  final String? classType;
  final String? subject;
  final String? level;
  final String? pricePerHour;
  final String? currency;
  final String? address;
  final String? status;
  final String? averageRating;
  final int? totalReviews;
  final List<ClassSchedule>? schedules;
  final int? bookingId;

  TutorClassDetails({
    this.tutorId,
    this.tutorInfo,
    this.title,
    this.description,
    this.classType,
    this.subject,
    this.level,
    this.pricePerHour,
    this.currency,
    this.address,
    this.status,
    this.averageRating,
    this.totalReviews,
    this.schedules,
    this.bookingId,
  });

  factory TutorClassDetails.fromJson(Map<String, dynamic> json) {
    return TutorClassDetails(
      tutorId: json['tutor'],
      tutorInfo: json['tutor_details'] != null
          ? TutorUserInfo.fromJson(json['tutor_details'])
          : null,
      title: json['title'],
      description: json['description'],
      classType: json['class_type'],
      subject: json['subject'],
      level: json['level'],
      pricePerHour: json['price_per_hour'],
      currency: json['currency'],
      address: json['address'],
      status: json['status'],
      averageRating: json['average_rating'],
      totalReviews: json['total_reviews'],
      bookingId: json['booking_id'],
      schedules: json['schedules'] != null
          ? List<ClassSchedule>.from(
              json['schedules'].map((x) => ClassSchedule.fromJson(x)),
            )
          : [],
    );
  }
}

// ৪. টিউটরের ব্যক্তিগত ইউজার তথ্য
class TutorUserInfo {
  final int? id;
  final String? fullName;
  final String? profilePicture;
  final TutorProfileDetails? profileBio;

  TutorUserInfo({this.id, this.fullName, this.profilePicture, this.profileBio});

  factory TutorUserInfo.fromJson(Map<String, dynamic> json) {
    return TutorUserInfo(
      id: json['id'],
      fullName: json['full_name'],
      profilePicture: json['profile_picture'],
      profileBio: json['profile'] != null
          ? TutorProfileDetails.fromJson(json['profile'])
          : null,
    );
  }
}

// ৫. টিউটরের প্রোফাইল ডিটেইলস (অভিজ্ঞতা, বায়ো ইত্যাদি)
class TutorProfileDetails {
  final String? bio;
  final int? yearsOfExperience;
  final double? rating;
  final int? totalReviews;

  TutorProfileDetails({
    this.bio,
    this.yearsOfExperience,
    this.rating,
    this.totalReviews,
  });

  factory TutorProfileDetails.fromJson(Map<String, dynamic> json) {
    return TutorProfileDetails(
      bio: json['bio'],
      yearsOfExperience: json['years_of_experience'],
      rating: json['average_rating']?.toDouble(),
      totalReviews: json['total_reviews'],
    );
  }
}

// ৬. ক্লাসের সময়সূচী বা শিডিউল
class ClassSchedule {
  final int? id;
  final String? day;
  final String? start;
  final String? end;
  final bool? recurring;

  ClassSchedule({this.id, this.day, this.start, this.end, this.recurring});

  factory ClassSchedule.fromJson(Map<String, dynamic> json) {
    return ClassSchedule(
      id: json['id'],
      day: json['day_of_week'],
      start: json['start_time'],
      end: json['end_time'],
      recurring: json['is_recurring'],
    );
  }
}
