import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/init_bloc/init_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final InitBloc initBloc = context.read<InitBloc>();
    initBloc.add(InitializeApp());
    Timer(const Duration(seconds: 3), () {
      initBloc.add(SplashScreenLoaded());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 100,
              width: 100,
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
                  style: theme.textTheme.headlineLarge,
                ),
                Text(
                  'Stay Safe, Stay Informed, Stay Connected',
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
