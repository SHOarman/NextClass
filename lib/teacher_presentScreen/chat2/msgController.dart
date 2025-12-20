import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:intl/intl.dart';

import 'msgmodel.dart';

class ChatController extends GetxController {
  late IO.Socket socket;
  TextEditingController msgController = TextEditingController();

  // Observable list of messages for the UI
  var messages = <MessageModel>[].obs;

  // Loading state
  var isConnecting = true.obs;

  @override
  void onInit() {
    super.onInit();
    connectToSocket();

    // Initial dummy data to match the design
    messages.addAll([
      MessageModel(message: "Hi, How are you?", senderId: "other", time: "08:12 am"),
    ]);
  }

  void connectToSocket() {
    // Replace with your real server IP (e.g., http://192.168.0.105:3000)
    // For now, even with a fake IP, the UI will work because of the dummy reply logic below.
    socket = IO.io('http://YOUR_SERVER_IP:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build()
    );

    socket.connect();

    socket.onConnect((_) {
      print('Connection established');
      isConnecting.value = false;
    });

    // Listen for incoming messages from server
    socket.on('receive_message', (data) {
      messages.add(MessageModel(
        message: data['message'],
        senderId: 'other',
        time: DateFormat('hh:mm a').format(DateTime.now()),
      ));
    });
  }

  void sendMessage() {
    String text = msgController.text.trim();
    if (text.isEmpty) return;

    // 1. Add message to local list (UI update)
    messages.add(MessageModel(
      message: text,
      senderId: 'me',
      time: DateFormat('hh:mm a').format(DateTime.now()),
    ));

    // 2. Emit message to server (This works if you have a real backend)
    socket.emit('send_message', {
      'message': text,
      'senderId': 'my_user_id',
    });

    msgController.clear();

    // 3. DUMMY REPLY LOGIC (Remove this block when using real backend)
    // This simulates receiving a reply after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      messages.add(MessageModel(
        message: "This is a dummy reply for: $text",
        senderId: 'other',
        time: DateFormat('hh:mm a').format(DateTime.now()),
      ));
    });
  }

  @override
  void onClose() {
    socket.dispose();
    msgController.dispose();
    super.onClose();
  }
}