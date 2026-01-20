// // Services/model_class/usershow_model.dart
// class TutorDetails {
//   final int id;
//   final String fullName;
//   final String email;
//   final String? profilePicture;
//   final bool isVerified;
//   final TutorProfile? profile;
//
//   TutorDetails({
//     required this.id,
//     required this.fullName,
//     required this.email,
//     this.profilePicture,
//     required this.isVerified,
//     this.profile,
//   });
//
//   factory TutorDetails.fromJson(Map<String, dynamic> json) {
//     return TutorDetails(
//       id: json['id'] ?? 0,
//       fullName: json['full_name'] ?? json['username'] ?? "Unknown",
//       email: json['email'] ?? "",
//       profilePicture: json['profile_picture'],
//       isVerified: json['is_verified'] ?? false,
//       profile: json['profile'] != null ? TutorProfile.fromJson(json['profile']) : null,
//     );
//   }
// }
//
// class TutorProfile {
//   final String? bio;
//   final String? verificationStatus;
//
//   TutorProfile({this.bio, this.verificationStatus});
//
//   factory TutorProfile.fromJson(Map<String, dynamic> json) {
//     return TutorProfile(
//       bio: json['bio'],
//       verificationStatus: json['verification_status'],
//     );
//   }
// }
//
// // Services/model_class/chatmodel.dart
// class ChatMessage {
//   final int id;
//   final int senderId;
//   final String content;
//   final String createdAt;
//
//   ChatMessage({required this.id, required this.senderId, required this.content, required this.createdAt});
//
//   factory ChatMessage.fromJson(Map<String, dynamic> json) {
//     return ChatMessage(
//       id: json['id'] ?? 0,
//       senderId: json['sender'] ?? 0,
//       content: json['content'] ?? "",
//       createdAt: json['created_at'] ?? "",
//     );
//   }
// }





class ChatMessage {
  final String senderId;
  final String content;
  final String type; // সার্ভারের 'type' হ্যান্ডেল করতে
  final DateTime timestamp;

  ChatMessage({required this.senderId, required this.content, required this.timestamp, this.type = "chat_message"});

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      senderId: (json['sender_id'] ?? "").toString(),
      content: json['message'] ?? json['content'] ?? "", // Postman এ 'message' কি ব্যবহার হয়েছে
      type: json['type'] ?? "chat_message",
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
    );
  }
}