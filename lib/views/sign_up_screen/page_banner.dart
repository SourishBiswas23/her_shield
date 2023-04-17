import 'package:flutter/material.dart';

class PageBanner extends StatelessWidget {
  const PageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: Image.asset(
            'assets/icons/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HerShield',
              style: theme.textTheme.headlineLarge,
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
