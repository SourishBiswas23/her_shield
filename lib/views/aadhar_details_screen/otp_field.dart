import 'package:flutter/material.dart';

import '../../app_theme.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    required TextEditingController otpController,
  }) : _otpController = otpController;

  final TextEditingController _otpController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _otpController,
      cursorColor: AppTheme.secondaryColor,
      decoration: const InputDecoration(
        labelText: 'Enter your OTP ',
        prefixIcon: Icon(Icons.lock_outline),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid password';
        }
        return null;
      },
      obscureText: true,
    );
  }
}
