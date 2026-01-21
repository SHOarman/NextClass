import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'chat_controller_teacher.dart';
import '../../../../Services/model_class/chat_models.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final ChatController controller = Get.put(ChatController());
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int conversationId = 0;
  String name = "Unknown";
  String image = "";

  @override
  void initState() {
    super.initState();
    bool idFound = false;

    debugPrint("ChatScreen: Arguments: ${Get.arguments}");

    if (Get.arguments != null && Get.arguments is List) {
      final args = Get.arguments as List;
      if (args.length >= 3) {
        if (args[0] is int) {
          conversationId = args[0];
        } else {
          debugPrint("ChatScreen Error: Arg[0] is not int: ${args[0]}");
        }
        name = args[1]?.toString() ?? "Unknown";
        image = args[2]?.toString() ?? "";
        idFound = true;
      }
    }

    // Fallback if arguments missing but controller has state
    if (!idFound && controller.currentConversationId.value != 0) {
      conversationId = controller.currentConversationId.value;
      idFound = true;
    }

    if (idFound && conversationId != 0) {
      // If controller isn't already set to this ID, enter the room
      if (controller.currentConversationId.value != conversationId) {
        controller.enterChatRoom(conversationId);
      } else {
        // If controller IS set, but socket might be disconnected, ensure connection
        controller.connectSocket(conversationId);
      }
    } else {
      debugPrint("ChatScreen Error: Conversation ID is 0 or Missing");
      // Optional: Get.back() or show error
    }
  }

  @override
  void dispose() {
    textController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // Light gray background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue, size: 20.sp),
          onPressed: () => Get.back(),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundImage: image.isNotEmpty
                  ? NetworkImage(image)
                  : const AssetImage("assets/backround/teacher.png")
                        as ImageProvider,
              backgroundColor: Colors.grey.shade200,
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  "Online", // This can be dynamic later
                  style: TextStyle(color: Colors.green, fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.messages.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.all(16.w),
                reverse: true, // Show newest at bottom
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  // Determine alignment
                  bool isMe = msg.isMe;
                  // Fallback if isMe isn't set perfectly (check senderId)
                  if (!isMe && controller.myUserId != null) {
                    isMe = msg.senderId == controller.myUserId;
                  }

                  return _buildMessageBubble(msg, isMe);
                },
              );
            }),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage msg, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        constraints: BoxConstraints(maxWidth: 0.75.sw), // 75% width
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF2563EB) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomLeft: isMe ? Radius.circular(12.r) : Radius.zero,
            bottomRight: isMe ? Radius.zero : Radius.circular(12.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              msg.content,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              _formatTime(msg.createdAt),
              style: TextStyle(
                color: isMe
                    ? Colors.white.withValues(alpha: 0.7)
                    : Colors.grey.shade500,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: "Type a message...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () {
              if (textController.text.trim().isNotEmpty) {
                controller.sendMessage(textController.text);
                textController.clear();
              }
            },
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: const Color(0xFF2563EB),
              child: const Icon(Icons.send, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    return "${time.hour}:${time.minute.toString().padLeft(2, '0')}";
  }
}
