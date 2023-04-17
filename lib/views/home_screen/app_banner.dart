import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(width: 5),
        SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(
            'assets/icons/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HerShield',
              style: theme.textTheme.headlineMedium,
            ),
            Text(
              'Stay Safe, Stay Informed, Stay Connected',
              style: theme.textTheme.headlineSmall,
            ),
          ],
        )
      ],
    );
  }
}
