import 'package:flutter/material.dart';

import '../../app_theme.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required TextEditingController phoneNumberController,
  }) : _phoneNumberController = phoneNumberController;

  final TextEditingController _phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _phoneNumberController,
      decoration: const InputDecoration(
        labelText: 'Enter your phone number',
        prefixIcon: Icon(Icons.phone_outlined),
      ),
      keyboardType: TextInputType.number,
      cursorColor: AppTheme.secondaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone number cannot be empty';
        } else if (value.length != 10) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
    );
  }
}
