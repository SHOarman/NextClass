import 'dart:convert';

class ChatConversationModel {
  final int id;
  final List<Participant> participants;
  final int? classListing;
  final String lastMessageContent;
  final int unreadCount;
  final DateTime createdAt; // ✅ DateTime
  final DateTime updatedAt; // ✅ DateTime, latest message sort এর জন্য

  ChatConversationModel({
    required this.id,
    required this.participants,
    this.classListing,
    required this.lastMessageContent,
    required this.unreadCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChatConversationModel.fromJson(Map<String, dynamic> json) {
    // last_message হ্যান্ডেল করা
    var lastMsgData = json['last_message'];
    String content = "No message yet";
    DateTime updated = DateTime.now();

    if (lastMsgData != null) {
      if (lastMsgData is Map<String, dynamic>) {
        content = lastMsgData['content']?.toString() ?? "No message yet";
        updated = lastMsgData['updated_at'] != null
            ? DateTime.tryParse(lastMsgData['updated_at']) ?? DateTime.now()
            : DateTime.now();
      } else if (lastMsgData is String) {
        content = lastMsgData;
      }
    }

    return ChatConversationModel(
      id: json['id'] ?? 0,
      participants: (json['participants'] as List?)
          ?.map((p) => Participant.fromJson(p))
          .toList() ??
          [],
      classListing: json['class_listing'],
      lastMessageContent: content,
      unreadCount: json['unread_count'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: updated,
    );
  }

  String get otherUserName {
    if (participants.isEmpty) return "Unknown User";
    try {
      var other = participants.firstWhere(
            (p) => p.userType == "tutor",
        orElse: () => participants.first,
      );
      return other.fullName;
    } catch (_) {
      return "Unknown User";
    }
  }

  String get otherUserProfile {
    if (participants.isEmpty) return "";
    try {
      var other = participants.firstWhere(
            (p) => p.userType == "tutor",
        orElse: () => participants.first,
      );
      return other.profilePicture ?? "";
    } catch (_) {
      return "";
    }
  }
}

class Participant {
  final int id;
  final String username;
  final String userType;
  final String? profilePicture;
  final String fullName;

  Participant({
    required this.id,
    required this.username,
    required this.userType,
    this.profilePicture,
    required this.fullName,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      userType: json['user_type'] ?? '',
      profilePicture: json['profile_picture'],
      fullName: json['full_name'] ?? 'Unknown',
    );
  }
}

class ChatMessageModel {
  final int id;
  final int senderId;
  final String content;
  final bool isRead;
  final DateTime timestamp;

  ChatMessageModel({
    required this.id,
    required this.senderId,
    required this.content,
    required this.isRead,
    required this.timestamp,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'] ?? 0,
      senderId: json['sender'] ?? 0,
      content: json['content'] ?? '',
      isRead: json['is_read'] ?? false,
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
    );
  }
}
