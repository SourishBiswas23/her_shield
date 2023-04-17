import 'package:flutter/material.dart';

import '../../app_theme.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 60),
      child: TextFormField(
        controller: _passwordController,
        cursorColor: AppTheme.secondaryColor,
        decoration: const InputDecoration(
          labelText: 'Enter your password',
          prefixIcon: Icon(Icons.lock_outline),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a valid password';
          }
          return null;
        },
        obscureText: true,
      ),
    );
  }
}
