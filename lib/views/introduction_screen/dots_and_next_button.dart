import 'package:flutter/material.dart';

import 'dots.dart';
import 'next_button.dart';

class DotsAndNextButton extends StatelessWidget {
  const DotsAndNextButton({
    super.key,
    required PageController controller,
    required List<Widget> pages,
  })  : _controller = controller,
        _pages = pages;

  final PageController _controller;
  final List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        Dots(controller: _controller, pageCount: _pages.length),
        const SizedBox(height: 20),
        NextButton(controller: _controller, lastPageIndex: _pages.length - 1),
      ],
    );
  }
}
