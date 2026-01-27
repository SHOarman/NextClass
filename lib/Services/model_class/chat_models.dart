// --- ১. চ্যাট মেসেজ মডেল (মেসেজ ডিটেইলস স্ক্রিনের জন্য) ---
class ChatMessageModel {
  final int id;
  final int conversation;
  final int sender;
  final SenderDetails senderDetails;
  final String messageType;
  final String content;
  final bool isRead;
  final DateTime createdAt;

  ChatMessageModel({
    required this.id,
    required this.conversation,
    required this.sender,
    required this.senderDetails,
    required this.messageType,
    required this.content,
    required this.isRead,
    required this.createdAt,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'] ?? 0,
      conversation: json['conversation'] ?? 0,
      sender: json['sender'] ?? 0,
      senderDetails: SenderDetails.fromJson(json['sender_details'] ?? {}),
      messageType: json['message_type'] ?? 'text',
      content: json['content'] ?? '',
      isRead: json['is_read'] ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at']).toLocal()
          : DateTime.now(),
    );
  }
}

// --- ২. সেন্ডার ডিটেইলস মডেল (ইউজার প্রোফাইলের জন্য) ---
class SenderDetails {
  final int id;
  final String username;
  final String profilePicture;
  final String fullName;
  final String status;

  SenderDetails({
    required this.id,
    required this.username,
    required this.profilePicture,
    required this.fullName,
    required this.status,
  });

  factory SenderDetails.fromJson(Map<String, dynamic> json) {
    return SenderDetails(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      profilePicture: json['profile_picture'] ?? '',
      fullName:
          json['full_name']?.toString() ??
          json['username']?.toString() ??
          ((json['first_name'] != null || json['last_name'] != null)
              ? "${json['first_name'] ?? ''} ${json['last_name'] ?? ''}".trim()
              : 'Unknown'),
      status: json['status'] ?? 'inactive',
    );
  }
}

// --- ৩. চ্যাট কনভারসেশন মডেল (ইনবক্স লিস্ট স্ক্রিনের জন্য) ---
class ChatConversationModel {
  final int id;
  final SenderDetails otherUser;
  final String lastMessage;
  final int unreadCount;
  final DateTime updatedAt;

  ChatConversationModel({
    required this.id,
    required this.otherUser,
    required this.lastMessage,
    required this.unreadCount,
    required this.updatedAt,
  });

  factory ChatConversationModel.fromJson(Map<String, dynamic> json) {
    // API থেকে আসা লাস্ট মেসেজ ডাটা হ্যান্ডেল করা
    var lastMsgData = json['last_message'];
    String content = "";

    if (lastMsgData is Map) {
      content = lastMsgData['content'] ?? "";
    } else {
      content = json['content'] ?? "";
    }

    return ChatConversationModel(
      id: json['id'] ?? 0,
      otherUser: SenderDetails.fromJson(
        json['sender_details'] ?? json['other_user'] ?? {},
      ),
      lastMessage: content.isEmpty ? "No messages yet" : content,
      unreadCount: json['unread_count'] ?? 0,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at']).toLocal()
          : DateTime.now(),
    );
  }

  // UI-তে ব্যবহারের জন্য হেল্পার গেটার্স
  String get otherUserName => otherUser.fullName;
  String get otherUserProfile => otherUser.profilePicture;
  bool get isOnline => otherUser.status == "active";
}
