import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'done_button.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key});

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  late final TextEditingController _pinConroller;

  @override
  void initState() {
    _pinConroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pinConroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
                width: double.infinity,
              ),
              const Text(
                'False SOS',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Enter PIN to stop the triggered SOS',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 50),
              Pinput(
                length: 6,
                controller: _pinConroller,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              const SizedBox(height: 50),
              DoneButton(pinConroller: _pinConroller)
            ],
          ),
        ),
      ),
    );
  }
}
