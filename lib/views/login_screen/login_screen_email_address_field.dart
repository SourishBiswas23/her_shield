import 'package:flutter/material.dart';

import '../../app_theme.dart';

class LoginScreenEmailAddressField extends StatelessWidget {
  const LoginScreenEmailAddressField({
    super.key,
    required TextEditingController emailAddressController,
  }) : _emailAddressController = emailAddressController;

  final TextEditingController _emailAddressController;
  static const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  @override
  Widget build(BuildContext context) {
    final regExp = RegExp(pattern);
    return Padding(
      padding: const EdgeInsets.only(right: 60),
      child: TextFormField(
        controller: _emailAddressController,
        decoration: const InputDecoration(
          labelText: 'Enter your Email Id',
          prefixIcon: Icon(Icons.email_outlined),
        ),
        keyboardType: TextInputType.emailAddress,
        cursorColor: AppTheme.secondaryColor,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter Your Email Address';
          }
          if (!regExp.hasMatch(value)) {
            return 'Please Enter A Valid Email Address';
          }
          return null;
        },
      ),
    );
  }
}
