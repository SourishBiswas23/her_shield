import 'package:flutter/material.dart';

import '../../app_theme.dart';
import 'password_field.dart';
import 'login_screen_email_address_field.dart';
import 'sign_in_button.dart';
import 'sign_up_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required TextEditingController passwordController,
    required TextEditingController emailIdController,
  })  : _emailIdController = emailIdController,
        _passwordController = passwordController;

  final TextEditingController _emailIdController;
  final TextEditingController _passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 200),
            Text(
              'Welcome to HerShield',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Please Sign in to continue',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            LoginScreenEmailAddressField(
              emailAddressController: widget._emailIdController,
            ),
            const SizedBox(height: 10),
            PasswordField(
              passwordController: widget._passwordController,
            ),
            const SizedBox(height: 30),
            SignInButton(
              formKey: _formKey,
              emailController: widget._emailIdController,
              passwordController: widget._passwordController,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              child: Text(
                'Forgot Password?',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text("Don't have an account?"),
            const SizedBox(height: 10),
            SignUpButton(theme: theme)
          ],
        ),
      ),
    );
  }
}
