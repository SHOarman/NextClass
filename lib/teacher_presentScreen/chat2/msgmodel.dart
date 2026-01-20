// // msgmodel.dart
//
// class ChatMessage {
//   final int? conversationId;
//   final String senderId;
//   final String content;
//   final DateTime timestamp;
//
//   ChatMessage({
//     required this.senderId,
//     required this.content,
//     required this.timestamp,
//     this.conversationId
//   });
//
//   factory ChatMessage.fromJson(Map<String, dynamic> json) {
//     return ChatMessage(
//       conversationId: json['conversation'] ?? json['conversation_id'],
//       senderId: (json['sender'] ?? json['sender_id']).toString(),
//       content: json['content'] ?? "",
//       timestamp: DateTime.parse(
//           json['timestamp'] ?? json['created_at'] ?? DateTime.now().toIso8601String()
//       ),
//     );
//   }
// }
//
// class ConversationModel {
//   final int id;
//   final Map<String, dynamic> otherUser;
//   final String? lastMessage;
//   final String updatedAt;
//   final int? unreadCount;
//
//   ConversationModel({
//     required this.id,
//     required this.otherUser,
//     this.lastMessage,
//     required this.updatedAt,
//     this.unreadCount,
//   });
//
//   factory ConversationModel.fromJson(Map<String, dynamic> json) {
//     return ConversationModel(
//       // 'id' সাধারণত মেইন কনভারসেশন আইডি হিসেবে কাজ করে
//       id: json['id'] ?? 0,
//       otherUser: json['other_user'] ?? {},
//       lastMessage: json['last_message']?['content'] ?? json['last_message_content'],
//       updatedAt: json['updated_at'] ?? DateTime.now().toIso8601String(),
//       unreadCount: json['unread_count'] ?? 0,
//     );
//   }
// }