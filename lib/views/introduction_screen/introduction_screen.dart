import 'package:flutter/material.dart';
import 'package:hackathon_project/app_theme.dart';

import 'add_your_close_circle.dart';
import 'dots_and_next_button.dart';
import 'sos_feature.dart';
import 'track_safe_zones.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final List<Widget> _pages = [
    const TrackSafeZones(),
    const AddYourCloseCircle(),
    const SosFeature(),
  ];

  late final PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () => _controller.animateToPage(
                  _pages.length - 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(color: AppTheme.textColor2, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: PageView.builder(
          itemBuilder: (context, index) {
            return _pages[index];
          },
          itemCount: _pages.length,
          controller: _controller,
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DotsAndNextButton(
          controller: _controller,
          pages: _pages,
        ),
      ),
    );
  }
}
