import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/app_theme.dart';

import '../../controllers/chat_bot_bloc/chat_bot_bloc.dart';
import 'message_bubble.dart';
import 'message_field_and_send_button.dart';

class SakhiScreen extends StatefulWidget {
  const SakhiScreen({super.key});

  @override
  State<SakhiScreen> createState() => _SakhiScreenState();
}

class _SakhiScreenState extends State<SakhiScreen> {
  late final TextEditingController messageController;
  late final ScrollController scrollController;

  @override
  void initState() {
    messageController = TextEditingController();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _scrollPage() {
    setState(() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: BlocBuilder<ChatBotBloc, ChatBotState>(
          builder: (context, state) {
            return AppBar(
              title: const Text(
                'Sakhi (ChatBot)',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                state.isBotTyping
                    ? const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        child: Text(
                          'Typing...',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBotBloc, ChatBotState>(
              builder: (context, state) {
                return ListView.builder(
                  controller: scrollController,
                  itemCount: state.messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = state.messages[index];
                    return MessageBubble(message: message);
                  },
                );
              },
            ),
          ),
          MessageFieldAndSendButton(
            messageController: messageController,
            scrollPage: _scrollPage,
          ),
        ],
      ),
    );
  }
}





// List<Map<String, dynamic>> _messages = [
//   {
//     'text':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida blandit lectus, sed mollis magna rhoncus sed. Fusce laoreet a nunc sed euismod. Suspendisse eu urna eget mi consectetur vestibulum. Nulla nec nulla ac nulla euismod ullamcorper. Sed sodales a urna ut suscipit. Cras euismod, augue id vulputate auctor, augue urna sodales ex',
//     'sentByUser': true
//   },
//   {
//     'text':
//         ' Donec id lectus vitae purus tincidunt pharetra vitae sed nibh. Sed ut lectus euismod, fermentum elit non, scelerisque orci. Sed varius elit non ex tristique, sit amet mollis eros dapibus. Sed ut velit ullamcorper, lacinia ex quis, pulvinar turpis. Vivamus euismod tellus et ex finibus, vel placerat tellus euismod.',
//     'sentByUser': false
//   },
//   {
//     'text':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida blandit lectus, sed mollis magna rhoncus sed. Fusce laoreet a nunc sed euismod. Suspendisse eu urna eget mi consectetur vestibulum. Nulla nec nulla ac nulla euismod ullamcorper. Sed sodales a urna ut suscipit. Cras euismod, augue id vulputate auctor, augue urna sodales ex',
//     'sentByUser': true
//   },
//   {
//     'text':
//         ' Donec id lectus vitae purus tincidunt pharetra vitae sed nibh. Sed ut lectus euismod, fermentum elit non, scelerisque orci. Sed varius elit non ex tristique, sit amet mollis eros dapibus. Sed ut velit ullamcorper, lacinia ex quis, pulvinar turpis. Vivamus euismod tellus et ex finibus, vel placerat tellus euismod.',
//     'sentByUser': false
//   },
//   {
//     'text':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida blandit lectus, sed mollis magna rhoncus sed. Fusce laoreet a nunc sed euismod. Suspendisse eu urna eget mi consectetur vestibulum. Nulla nec nulla ac nulla euismod ullamcorper. Sed sodales a urna ut suscipit. Cras euismod, augue id vulputate auctor, augue urna sodales ex',
//     'sentByUser': true
//   },
//   {
//     'text':
//         ' Donec id lectus vitae purus tincidunt pharetra vitae sed nibh. Sed ut lectus euismod, fermentum elit non, scelerisque orci. Sed varius elit non ex tristique, sit amet mollis eros dapibus. Sed ut velit ullamcorper, lacinia ex quis, pulvinar turpis. Vivamus euismod tellus et ex finibus, vel placerat tellus euismod.',
//     'sentByUser': false
//   },
//   {
//     'text':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida blandit lectus, sed mollis magna rhoncus sed. Fusce laoreet a nunc sed euismod. Suspendisse eu urna eget mi consectetur vestibulum. Nulla nec nulla ac nulla euismod ullamcorper. Sed sodales a urna ut suscipit. Cras euismod, augue id vulputate auctor, augue urna sodales ex',
//     'sentByUser': true
//   },
//   {
//     'text':
//         ' Donec id lectus vitae purus tincidunt pharetra vitae sed nibh. Sed ut lectus euismod, fermentum elit non, scelerisque orci. Sed varius elit non ex tristique, sit amet mollis eros dapibus. Sed ut velit ullamcorper, lacinia ex quis, pulvinar turpis. Vivamus euismod tellus et ex finibus, vel placerat tellus euismod.',
//     'sentByUser': false
//   },
//   {
//     'text':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida blandit lectus, sed mollis magna rhoncus sed. Fusce laoreet a nunc sed euismod. Suspendisse eu urna eget mi consectetur vestibulum. Nulla nec nulla ac nulla euismod ullamcorper. Sed sodales a urna ut suscipit. Cras euismod, augue id vulputate auctor, augue urna sodales ex',
//     'sentByUser': true
//   },
//   {
//     'text':
//         ' Donec id lectus vitae purus tincidunt pharetra vitae sed nibh. Sed ut lectus euismod, fermentum elit non, scelerisque orci. Sed varius elit non ex tristique, sit amet mollis eros dapibus. Sed ut velit ullamcorper, lacinia ex quis, pulvinar turpis. Vivamus euismod tellus et ex finibus, vel placerat tellus euismod.',
//     'sentByUser': false
//   },
//   {
//     'text':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida blandit lectus, sed mollis magna rhoncus sed. Fusce laoreet a nunc sed euismod. Suspendisse eu urna eget mi consectetur vestibulum. Nulla nec nulla ac nulla euismod ullamcorper. Sed sodales a urna ut suscipit. Cras euismod, augue id vulputate auctor, augue urna sodales ex',
//     'sentByUser': true
//   },
//   {
//     'text':
//         ' Donec id lectus vitae purus tincidunt pharetra vitae sed nibh. Sed ut lectus euismod, fermentum elit non, scelerisque orci. Sed varius elit non ex tristique, sit amet mollis eros dapibus. Sed ut velit ullamcorper, lacinia ex quis, pulvinar turpis. Vivamus euismod tellus et ex finibus, vel placerat tellus euismod.',
//     'sentByUser': false
//   },
//   {
//     'text':
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida blandit lectus, sed mollis magna rhoncus sed. Fusce laoreet a nunc sed euismod. Suspendisse eu urna eget mi consectetur vestibulum. Nulla nec nulla ac nulla euismod ullamcorper. Sed sodales a urna ut suscipit. Cras euismod, augue id vulputate auctor, augue urna sodales ex',
//     'sentByUser': true
//   },
//   {
//     'text':
//         ' Donec id lectus vitae purus tincidunt pharetra vitae sed nibh. Sed ut lectus euismod, fermentum elit non, scelerisque orci. Sed varius elit non ex tristique, sit amet mollis eros dapibus. Sed ut velit ullamcorper, lacinia ex quis, pulvinar turpis. Vivamus euismod tellus et ex finibus, vel placerat tellus euismod.',
//     'sentByUser': false
//   },
// ];
