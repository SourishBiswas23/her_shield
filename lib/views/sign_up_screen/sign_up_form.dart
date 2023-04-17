import 'package:flutter/material.dart';
import 'package:hackathon_project/views/sign_up_screen/signup_screen_email_address_field.dart';

import '../../app_theme.dart';
import 'name_field.dart';
import 'page_banner.dart';
import 'password_field.dart';
import 'phone_number_field.dart';
import 'sign_in_button.dart';
import 'sign_up_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController phoneNumberController,
    required TextEditingController passwordController,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _phoneNumberController = phoneNumberController,
        _nameController = nameController,
        _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _phoneNumberController;
  final TextEditingController _passwordController;
  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 50),
          const PageBanner(),
          const SizedBox(height: 100),
          Text(
            'Welcome to HerShield',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          Text(
            'Please Sign Up to continue',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 20),
          NameField(nameController: _nameController),
          const SizedBox(height: 20),
          SignupScreenEmailAddressField(
            emailAddressController: _emailController,
          ),
          const SizedBox(height: 20),
          PhoneNumberField(phoneNumberController: _phoneNumberController),
          const SizedBox(height: 20),
          PasswordField(passwordController: _passwordController),
          const SizedBox(height: 30),
          SignUpButton(
            formKey: _formKey,
            emailIdController: _emailController,
            passwordController: _passwordController,
            phoneNumberController: _phoneNumberController,
            userNameController: _nameController,
          ),
          const SizedBox(height: 10),
          const Text("Already have an account?"),
          const SizedBox(height: 10),
          const SignInButton(),
        ],
      ),
    );
  }
}
