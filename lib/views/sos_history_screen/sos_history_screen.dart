import 'package:flutter/material.dart';
import 'package:hackathon_project/views/sos_history_screen/sos_list_builder.dart';
import 'package:hackathon_project/views/sos_history_screen/sos_tile_data.dart';

class SosHistoryScreen extends StatelessWidget {
  const SosHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sos History',
          style: theme.textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: SosListBuilder(),
      ),
    );
  }
}
