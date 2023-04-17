import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/controllers/page_changer_bloc/page_changer_bloc.dart';

import '../../app_theme.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final PageChangerBloc pageChangerBloc = context.read<PageChangerBloc>();
    return GestureDetector(
      onTap: () {
        pageChangerBloc.add(LoadSignUpScreenEvent());
      },
      child: Text(
        'Sign Up now',
        style: theme.textTheme.bodyLarge?.copyWith(
          color: AppTheme.primaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
