import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:hackathon_project/controllers/chat_bot_bloc/chat_bot_bloc.dart';
import 'package:hackathon_project/routes.dart';

class SakhiChatBot {
  SakhiChatBot({required ChatBotBloc chatBotBloc, required Function scrollPage})
      : _scrollPage = scrollPage,
        _chatBotBloc = chatBotBloc;
  final Function _scrollPage;
  final ChatBotBloc _chatBotBloc;
  final dio = Dio();
  Future<String> bot(String promp) async {
    final Map<String, dynamic> options = {
      "method": "POST",
      "url": "https://openai80.p.rapidapi.com/chat/completions",
      "headers": {
        "content-type": "application/json",
        "X-RapidAPI-Key": "6dbc83ebc3msh5413e151fb92f3bp114e8fjsnc8a3d1c5484a",
        "X-RapidAPI-Host": "openai80.p.rapidapi.com",
      },
      "data":
          '{"model":"gpt-3.5-turbo","messages":[{"role":"user","content":"$promp"}]}',
    };

    late final response;
    try {
      final response = await dio.request(
        options['url'],
        data: options['data'],
        options: Options(
          method: options['method'],
          headers: options['headers'],
        ),
      );
      final data = response.data;
      return data['choices'][0]['message']['content'];
    } on DioError catch (e) {
      AppNavigator.showSnackBar(
        snackBar: SnackBar(
          content: Text(
            e.message.toString(),
          ),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              AppNavigator.scaffoldMessengerKey.currentState
                  ?.removeCurrentSnackBar();
            },
          ),
        ),
      );
    }
    return 'An Error Occured';
  }

  Future<void> updateMessagesList(
      String message, List<String> promptList) async {
    promptList.add(message);
  }

  Future<String> createPrompt(String message, List<String> promptList) async {
    final promptMessage = 'Human:$message';
    await updateMessagesList(promptMessage, promptList);
    final promp = promptList.join(' ');
    return promp;
  }

  Future<String> getBotResponse(String message, List<String> promptList) async {
    final promp = await createPrompt(message, promptList);
    final botresponse = await bot(promp);
    return botresponse;
  }

  void convertStateMessagesToPromptList({required List<String> promptList}) {
    for (var i = 3; i < _chatBotBloc.state.messages.length; i = i + 2) {
      final prompt =
          '${_chatBotBloc.state.messages[i - 2]['text']} Human:${_chatBotBloc.state.messages[i - 1]['text']}';
      promptList.add(prompt);
    }
  }

  Future<void> chatBotStart({required String prompt}) async {
    late final List<String> promptList;
    final state = _chatBotBloc.state;
    if (state is ChatBotInitial) {
      promptList = [
        'You are a female bot and from now on you will act as a legal advisor only in short Human:$prompt'
      ];
    } else {
      promptList = [
        'You are a female bot and from now on you will act as a legal advisor only in short Human:${state.messages.first['text']}'
      ];
      convertStateMessagesToPromptList(promptList: promptList);
    }
    await Future.delayed(const Duration(milliseconds: 100));
    _scrollPage();
    final response = await getBotResponse(prompt, promptList);
    _chatBotBloc.add(ChatBotResponse(message: response));
    await Future.delayed(const Duration(milliseconds: 100));
    _scrollPage();
  }
}
