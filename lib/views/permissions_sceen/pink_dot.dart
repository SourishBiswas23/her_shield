import 'package:flutter/material.dart';

import '../../app_theme.dart';

class PinkDot extends StatelessWidget {
  const PinkDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.primaryColor,
      ),
    );
  }
}
