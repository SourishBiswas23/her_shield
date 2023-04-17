import 'package:flutter/material.dart';

import '../../app_theme.dart';
import 'false_sos_button.dart';
import 'full_shield_image.dart';
import 'im_safe_button.dart';

class SosTriggeredScreen extends StatefulWidget {
  const SosTriggeredScreen({super.key});

  @override
  State<SosTriggeredScreen> createState() => _SosTriggeredScreenState();
}

class _SosTriggeredScreenState extends State<SosTriggeredScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                fullShieldImage(screenWidth: size.width),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: double.infinity),
                      const SizedBox(height: 150),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [Colors.red.shade200, Colors.red.shade400],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.notifications_active_outlined,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'SOS is Triggered',
                        style: theme.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Functioning under High SOS mode',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Your Circles are notified, Nearby Help centres are coming to rescue you',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'ETA: 5 min',
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 30),
                      const FalseSosButton(),
                      const ImSafeButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
