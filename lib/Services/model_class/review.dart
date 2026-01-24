class ReviewModel {
  final int? count;
  final String? next;
  final String? previous;
  final List<ReviewResult>? results;

  ReviewModel({this.count, this.next, this.previous, this.results});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'] != null
          ? List<ReviewResult>.from(json['results'].map((x) => ReviewResult.fromJson(x)))
          : null,
    );
  }
}

class ReviewResult {
  final int? id;
  final int? booking;
  final int? parent;
  final ParentDetails? parentDetails;
  final int? tutor;
  final int? classListing;
  final int? rating;
  final String? title;
  final String? comment;
  final int? communicationRating;
  final int? teachingQualityRating;
  final int? valueForMoneyRating;
  final String? tutorResponse;
  final String? createdAt;

  ReviewResult({
    this.id,
    this.booking,
    this.parent,
    this.parentDetails,
    this.tutor,
    this.classListing,
    this.rating,
    this.title,
    this.comment,
    this.communicationRating,
    this.teachingQualityRating,
    this.valueForMoneyRating,
    this.tutorResponse,
    this.createdAt,
  });

  factory ReviewResult.fromJson(Map<String, dynamic> json) {
    return ReviewResult(
      id: json['id'],
      booking: json['booking'],
      parent: json['parent'],
      parentDetails: json['parent_details'] != null
          ? ParentDetails.fromJson(json['parent_details'])
          : null,
      tutor: json['tutor'],
      classListing: json['class_listing'],
      rating: json['rating'],
      title: json['title'],
      comment: json['comment'],
      communicationRating: json['communication_rating'],
      teachingQualityRating: json['teaching_quality_rating'],
      valueForMoneyRating: json['value_for_money_rating'],
      tutorResponse: json['tutor_response'],
      createdAt: json['created_at'],
    );
  }
}

class ParentDetails {
  final int? id;
  final String? username;
  final String? email;
  final String? profilePicture;
  final String? fullName;

  ParentDetails({
    this.id,
    this.username,
    this.email,
    this.profilePicture,
    this.fullName,
  });

  factory ParentDetails.fromJson(Map<String, dynamic> json) {
    return ParentDetails(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profilePicture: json['profile_picture'],
      fullName: json['full_name'],
    );
  }
}