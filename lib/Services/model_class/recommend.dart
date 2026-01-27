class RecommendedClassResponse {
  final List<RecommendedClass>? results;

  RecommendedClassResponse({this.results});

  factory RecommendedClassResponse.fromJson(Map<String, dynamic> json) {
    // results -> features লিস্টটি রিড করা হচ্ছে
    var featuresList = json['results']?['features'] as List?;
    return RecommendedClassResponse(
      results: featuresList != null
          ? featuresList.map((i) => RecommendedClass.fromJson(i)).toList()
          : [],
    );
  }
}

class RecommendedClass {
  final int? id;
  final String? tutorName;
  final String? profilePicture;
  final ClassProperties? properties;

  RecommendedClass({
    this.id,
    this.tutorName,
    this.profilePicture,
    this.properties,
  });

  factory RecommendedClass.fromJson(Map<String, dynamic> json) {
    var propsJson = json['properties'];
    var tutorDetails = propsJson?['tutor_details'];

    return RecommendedClass(
      id: json['id'],
      tutorName: tutorDetails?['full_name'] ?? "No Name",
      profilePicture: tutorDetails?['profile_picture'] ?? "",
      properties: propsJson != null
          ? ClassProperties.fromJson(propsJson)
          : null,
    );
  }
}

class ClassProperties {
  final String? subject;
  final String? level;
  final String? pricePerHour;

  ClassProperties({this.subject, this.level, this.pricePerHour});

  factory ClassProperties.fromJson(Map<String, dynamic> json) {
    return ClassProperties(
      subject: json['subject'] ?? "N/A",
      level: json['level'] ?? "N/A",
      pricePerHour: json['price_per_hour'] ?? "0",
    );
  }
}
