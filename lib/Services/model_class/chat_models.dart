class ChatMessage {
  final int id;
  final int conversationId;
  final int senderId;
  final String content;
  final bool isRead;
  final DateTime createdAt;
  final bool isMe; // Helper to determine if I sent it

  ChatMessage({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.content,
    required this.isRead,
    required this.createdAt,
    this.isMe = false,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json, {int? myUserId}) {
    int sender = json['sender'] ?? 0;
    return ChatMessage(
      id: json['id'] ?? 0,
      conversationId: json['conversation'] ?? 0,
      senderId: sender,
      content:
          json['content'] ??
          json['message'] ??
          '', // API and Socket might use different keys
      isRead: json['is_read'] ?? false,
      createdAt: DateTime.parse(
        json['created_at'] ??
            json['timestamp'] ??
            DateTime.now().toIso8601String(),
      ),
      isMe: myUserId != null ? (sender == myUserId) : false,
    );
  }
}

class ConversationModel {
  final int id;
  final OtherUser otherUser;
  final String lastMessage; // Can be empty
  final DateTime updatedAt;
  final int unreadCount;

  ConversationModel({
    required this.id,
    required this.otherUser,
    required this.lastMessage,
    required this.updatedAt,
    this.unreadCount = 0,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    // If 'other_user' is not present, try to find a user object that is not 'me' or just pick the 'receiver' if present.
    // Or if the API calls it something else like 'receiver' or 'sender' object.

    var userData = json['other_user'];
    userData ??= (json['receiver'] is Map
        ? json['receiver']
        : (json['sender'] is Map ? json['sender'] : {}));

    return ConversationModel(
      id: json['id'] ?? 0,
      otherUser: OtherUser.fromJson(userData ?? {}),
      lastMessage: json['last_message'] ?? '',
      updatedAt: DateTime.parse(
        json['updated_at'] ?? DateTime.now().toIso8601String(),
      ),
      unreadCount: json['unread_count'] ?? 0,
    );
  }
}

class OtherUser {
  final int id;
  final String name;
  final String? profilePicture;

  OtherUser({required this.id, required this.name, this.profilePicture});

  factory OtherUser.fromJson(Map<String, dynamic> json) {
    return OtherUser(
      id: json['id'] ?? 0,
      name:
          json['full_name'] ??
          json['username'] ??
          'Unknown', // Adjust based on actual API
      profilePicture: json['profile_picture'],
    );
  }
}
