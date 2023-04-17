import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_bot_event.dart';
part 'chat_bot_state.dart';

class ChatBotBloc extends Bloc<ChatBotEvent, ChatBotState> {
  ChatBotBloc() : super(ChatBotInitial()) {
    on<UserQuestionToChatbot>((event, emit) {
      emit(
        ChatBotConversations(
          messages: [
            ...state.messages,
            {'text': event.message, 'sentByUser': true}
          ],
          isBotTyping: true,
        ),
      );
    });
    on<ChatBotResponse>((event, emit) {
      emit(
        ChatBotConversations(
          messages: [
            ...state.messages,
            {'text': event.message, 'sentByUser': false}
          ],
          isBotTyping: false,
        ),
      );
    });
  }
}
