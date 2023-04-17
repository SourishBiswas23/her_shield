part of 'chat_bot_bloc.dart';

@immutable
abstract class ChatBotState {
  final List<Map<String, dynamic>> messages = [];
  final isBotTyping = false;
}

class ChatBotInitial extends ChatBotState {
  @override
  final List<Map<String, dynamic>> messages = [];
  @override
  final isBotTyping = false;
}

class ChatBotConversations extends ChatBotState {
  ChatBotConversations({required this.messages, required this.isBotTyping});
  @override
  final List<Map<String, dynamic>> messages;
  @override
  final isBotTyping;
}
