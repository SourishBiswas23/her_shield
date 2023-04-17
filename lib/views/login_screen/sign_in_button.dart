import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/controllers/auth_bloc/auth_bloc.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          authBloc.add(LoginUserEvent(
            emailId: emailController.text,
            password: passwordController.text,
          ));
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text(
        'Sign In Now',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
