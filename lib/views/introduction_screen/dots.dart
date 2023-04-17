import 'package:flutter/material.dart';

import '../../app_theme.dart';

class Dots extends StatefulWidget {
  const Dots({
    super.key,
    required PageController controller,
    required int pageCount,
  })  : _controller = controller,
        _pageCount = pageCount;

  final PageController _controller;
  final int _pageCount;

  @override
  State<Dots> createState() => _DotsState();
}

class _DotsState extends State<Dots> {
  @override
  void initState() {
    widget._controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _generateDots(
        pageCount: widget._pageCount,
        controller: widget._controller,
      ),
    );
  }
}

List<Widget> _generateDots({
  required int pageCount,
  required PageController controller,
}) {
  final List<Widget> dots = [];
  for (var i = 0; i < pageCount; i++) {
    bool isSelectedIndex = ((controller.page ?? 0) + 0.5).toInt() == i;
    dots.add(
      InkWell(
        onTap: () => controller.animateToPage(
          i,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 55,
          width: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelectedIndex ? AppTheme.primaryColor : Colors.white,
            border: !isSelectedIndex
                ? Border.all(
                    color: Colors.black,
                    width: 1.0,
                  )
                : null,
          ),
        ),
      ),
    );
  }
  return dots;
}
