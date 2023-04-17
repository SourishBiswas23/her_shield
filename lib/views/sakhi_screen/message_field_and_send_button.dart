import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/chat_bot_bloc/chat_bot_bloc.dart';
import 'sakhi_chatbot.dart';

class MessageFieldAndSendButton extends StatelessWidget {
  const MessageFieldAndSendButton({
    super.key,
    required this.messageController,
    required this.scrollPage,
  });

  final TextEditingController messageController;
  final Function scrollPage;

  @override
  Widget build(BuildContext context) {
    final ChatBotBloc chatBotBloc = BlocProvider.of<ChatBotBloc>(context);
    final SakhiChatBot sakhiChatBot = SakhiChatBot(
      chatBotBloc: chatBotBloc,
      scrollPage: scrollPage,
    );
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              maxLines: 10,
              minLines: 1,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                hintText: 'Type your message',
                fillColor: Colors.grey.shade100,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final messageText = messageController.text;
              chatBotBloc.add(UserQuestionToChatbot(message: messageText));
              messageController.clear();
              await sakhiChatBot.chatBotStart(prompt: messageText);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.all(0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.send),
            ),
          )
        ],
      ),
    );
  }
}
