import 'package:flutter/material.dart';

class TipOfTheDayScreen extends StatelessWidget {
  const TipOfTheDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Did you know? SCSC was formed in the year 2006 as a joint body by the IT Industry and the Police Department',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
