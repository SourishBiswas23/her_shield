import 'package:flutter/material.dart';

import 'be_aware_screen_grid_builder.dart';

class BeAwareScreen extends StatelessWidget {
  const BeAwareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Be Aware',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: BeAwareScreenGridBuilder(
            // pageChangerBloc: pageChangerBloc,
            ),
      ),
    );
  }
}
