// // চ্যাট লিস্টের জন্য মডেল
// class ChatConversation {
//   final int id;
//   final String otherUserName;
//   final String otherUserProfile;
//   final String lastMessage;
//   final bool isRead;
//   final DateTime timestamp;
//
//   ChatConversation({
//     required this.id,
//     required this.otherUserName,
//     required this.otherUserProfile,
//     required this.lastMessage,
//     required this.isRead,
//     required this.timestamp,
//   });
//
//   factory ChatConversation.fromJson(Map<String, dynamic> json) {
//     return ChatConversation(
//       id: json['id'],
//       otherUserName: json['other_user_name'] ?? 'Unknown',
//       otherUserProfile: json['other_user_profile'] ?? '',
//       lastMessage: json['last_message'] ?? '',
//       isRead: json['is_read'] ?? false,
//       timestamp: DateTime.parse(json['timestamp']),
//     );
//   }
// }
//
// // ইনবক্স মেসেজের জন্য মডেল
// class ChatMessage {
//   final int id;
//   final int senderId;
//   final String content;
//   final bool isSeen;
//   final DateTime timestamp;
//
//   ChatMessage({
//     required this.id,
//     required this.senderId,
//     required this.content,
//     required this.isSeen,
//     required this.timestamp,
//   });
//
//   factory ChatMessage.fromJson(Map<String, dynamic> json) {
//     return ChatMessage(
//       id: json['id'],
//       senderId: json['sender'],
//       content: json['content'],
//       isSeen: json['is_read'] ?? false,
//       timestamp: DateTime.parse(json['timestamp']),
//     );
//   }
// }