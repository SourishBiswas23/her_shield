part of 'chat_bot_bloc.dart';

@immutable
abstract class ChatBotEvent {}

class UserQuestionToChatbot extends ChatBotEvent {
  UserQuestionToChatbot({required this.message});
  final String message;
}

class ChatBotResponse extends ChatBotEvent {
  ChatBotResponse({required this.message});
  final String message;
}
