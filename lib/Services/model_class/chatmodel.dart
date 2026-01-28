// class ChatMessage {
//   final int id;
//   final int conversation;
//   final int senderId;
//   final String content;
//   final bool isRead;
//   final String createdAt;
//
//   ChatMessage({
//     required this.id,
//     required this.conversation,
//     required this.senderId,
//     required this.content,
//     required this.isRead,
//     required this.createdAt,
//   });
//
//   factory ChatMessage.fromJson(Map<String, dynamic> json) {
//     return ChatMessage(
//       id: json['id'] ?? 0,
//       conversation: json['conversation'] ?? 0,
//       senderId: json['sender'] ?? 0,
//       content: json['content'] ?? '',
//       isRead: json['is_read'] ?? false,
//       createdAt: json['created_at'] ?? '',
//     );
//   }
// }
