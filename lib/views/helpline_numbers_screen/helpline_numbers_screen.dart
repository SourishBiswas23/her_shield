import 'package:flutter/material.dart';
import 'package:hackathon_project/views/helpline_numbers_screen/helpline_numbers_data.dart';
import 'package:hackathon_project/views/helpline_numbers_screen/helpline_tile.dart';

class HelplineNumbersScreen extends StatelessWidget {
  const HelplineNumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Helpline Numbers'),
      ),
      body: ListView.builder(
        itemCount: helplineNumbersData.length,
        itemBuilder: (context, index) {
          return HelplineTile(data: helplineNumbersData[index]);
        },
      ),
    );
  }
}
