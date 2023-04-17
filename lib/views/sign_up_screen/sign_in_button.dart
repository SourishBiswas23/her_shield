import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/controllers/page_changer_bloc/page_changer_bloc.dart';

import '../../app_theme.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final PageChangerBloc pageChangerBloc = context.read<PageChangerBloc>();
    return GestureDetector(
      onTap: () {
        pageChangerBloc.add(LoadLoginScreenEvent());
      },
      child: Text(
        'Sign in now',
        style: theme.textTheme.bodyLarge?.copyWith(
          color: AppTheme.primaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
