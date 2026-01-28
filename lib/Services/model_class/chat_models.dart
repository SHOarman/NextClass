//==================== MESSAGES LIST MODEL ====================
class ChatMessageResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<ChatMessageModel> results;

  ChatMessageResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) {
    return ChatMessageResponse(
      count: json['count'] ?? 0,
      next: json['next'],
      previous: json['previous'],
      results:
          (json['results'] as List?)
              ?.map((e) => ChatMessageModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

//==================== SINGLE MESSAGE MODEL ====================
class ChatMessageModel {
  final int id;
  final int conversation;
  final int sender;
  final String content;
  final String messageType;
  bool isRead; // Modified to be non-final for local updates
  final DateTime createdAt;
  final SenderDetails senderDetails;

  ChatMessageModel({
    required this.id,
    required this.conversation,
    required this.sender,
    required this.content,
    required this.messageType,
    required this.isRead,
    required this.createdAt,
    required this.senderDetails,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'] ?? 0,
      conversation: json['conversation'] ?? 0,
      sender: json['sender'] ?? 0,
      content: json['content'] ?? "",
      messageType: json['message_type'] ?? "text",
      isRead: json['is_read'] ?? false,
      createdAt: DateTime.parse(
        json['created_at'] ?? DateTime.now().toString(),
      ),
      senderDetails: SenderDetails.fromJson(json['sender_details'] ?? {}),
    );
  }
}

//==================== SENDER DETAILS MODEL ====================
class SenderDetails {
  final int id;
  final String fullName;
  final String profilePicture;
  final String userType;
  final String status;

  SenderDetails({
    required this.id,
    required this.fullName,
    required this.profilePicture,
    required this.userType,
    required this.status,
  });

  factory SenderDetails.fromJson(Map<String, dynamic> json) {
    return SenderDetails(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? "Unknown",
      profilePicture: json['profile_picture'] ?? "",
      userType: json['user_type'] ?? "",
      status: json['status'] ?? "offline",
    );
  }
}

class ChatConversationModel {
  final int id;
  final String lastMessage;
  final int unreadCount;
  final DateTime updatedAt;
  final OtherUser otherUser;

  ChatConversationModel({
    required this.id,
    required this.lastMessage,
    required this.unreadCount,
    required this.updatedAt,
    required this.otherUser,
  });

  factory ChatConversationModel.fromJson(
    Map<String, dynamic> json, {
    int? currentUserId,
  }) {
    var participants = json['participants'] as List? ?? [];
    Map<String, dynamic>? targetUserJson;

    if (currentUserId != null && participants.isNotEmpty) {
      try {
        targetUserJson = participants.firstWhere(
          (p) => p['id'] != currentUserId,
        );
      } catch (e) {
        targetUserJson = participants.isNotEmpty ? participants[0] : null;
      }
    } else {
      targetUserJson = participants.isNotEmpty ? participants[0] : null;
    }

    OtherUser defaultUser = OtherUser(
      id: 0,
      fullName: "Unknown User",
      profilePicture: "",
      status: "offline",
    );

    String messageContent = "No message yet";
    if (json['last_message'] != null) {
      if (json['last_message'] is Map) {
        messageContent = json['last_message']['content'] ?? "No message yet";
      } else if (json['last_message'] is String) {
        messageContent = json['last_message'];
      }
    }

    return ChatConversationModel(
      id: json['id'] ?? 0,
      lastMessage: messageContent,
      unreadCount: json['unread_count'] ?? 0,
      updatedAt: DateTime.parse(
        json['updated_at'] ?? DateTime.now().toString(),
      ),
      otherUser: targetUserJson != null
          ? OtherUser.fromJson(targetUserJson)
          : defaultUser,
    );
  }
}

class OtherUser {
  final int id;
  final String fullName;
  final String profilePicture;
  final String status;

  OtherUser({
    required this.id,
    required this.fullName,
    required this.profilePicture,
    required this.status,
  });

  factory OtherUser.fromJson(Map<String, dynamic> json) {
    return OtherUser(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? "Unknown",
      profilePicture: json['profile_picture'] ?? "",
      status: json['status'] ?? "offline",
    );
  }
}
