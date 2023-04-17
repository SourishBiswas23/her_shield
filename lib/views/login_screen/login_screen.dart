import 'package:flutter/material.dart';

import '../../app_theme.dart';
import 'half_shield_image.dart';
import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController phoneNumberController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.secondaryColor,
              AppTheme.primaryColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              halfShieldImage(screenWidth: size.width),
              LoginForm(
                passwordController: passwordController,
                emailIdController: phoneNumberController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
