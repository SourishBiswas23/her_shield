import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

import '../../app_theme.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
  });

  final Map<String, dynamic> message;

  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: message['sentByUser'] ? Alignment.topRight : Alignment.topLeft,
      clipper: ChatBubbleClipper6(
        type: message['sentByUser']
            ? BubbleType.sendBubble
            : BubbleType.receiverBubble,
      ),
      backGroundColor: message['sentByUser']
          ? AppTheme.primaryColor.withOpacity(0.5)
          : Colors.grey.shade100,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          message['text'],
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: message['sentByUser'] ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
