import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_theme.dart';
import '../../controllers/auth_bloc/auth_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.userNameController,
    required this.emailIdController,
    required this.phoneNumberController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController userNameController;
  final TextEditingController emailIdController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          authBloc.add(RegisterUserEvent(
            userName: userNameController.text,
            emailId: emailIdController.text,
            phoneNumber: int.parse(phoneNumberController.text),
            password: passwordController.text,
          ));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: const Text(
          'Sign Up Now',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
