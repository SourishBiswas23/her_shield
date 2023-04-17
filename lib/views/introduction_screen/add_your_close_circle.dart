import 'package:flutter/material.dart';

import '../../app_theme.dart';

class AddYourCloseCircle extends StatelessWidget {
  const AddYourCloseCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Add Your Close Circle',
          style: theme.headlineMedium,
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [
                    AppTheme.secondaryColor,
                    AppTheme.primaryColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: const [
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    'Be Fearless, Be a Fighter',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Add your close circle numbers in the app to send alert in case of emergency',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/images/add_your_close_circle.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        )
      ],
    );
  }
}
