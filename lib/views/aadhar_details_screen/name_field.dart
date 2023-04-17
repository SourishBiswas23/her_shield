import 'package:flutter/material.dart';

import '../../app_theme.dart';

class AadharNumberField extends StatelessWidget {
  const AadharNumberField({
    super.key,
    required this.aadharNumberController,
  });

  final TextEditingController aadharNumberController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: aadharNumberController,
      decoration: const InputDecoration(
        labelText: 'Enter your 12 digit Aadhar number',
        prefixIcon: Icon(Icons.email_outlined),
      ),
      keyboardType: TextInputType.number,
      cursorColor: AppTheme.secondaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name cannot be empty';
        }
        if (value.length != 12) {
          return 'Please enter a valid Aadhar Number';
        }
        return null;
      },
    );
  }
}
