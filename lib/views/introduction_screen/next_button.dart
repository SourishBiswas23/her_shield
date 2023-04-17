import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_theme.dart';
import '../../controllers/page_changer_bloc/page_changer_bloc.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required PageController controller,
    required int lastPageIndex,
  })  : _lastPageIndex = lastPageIndex,
        _controller = controller;

  final PageController _controller;
  final int _lastPageIndex;

  @override
  Widget build(BuildContext context) {
    final PageChangerBloc pageChangerBloc = context.read<PageChangerBloc>();
    return GestureDetector(
      onTap: () {
        if (_controller.page == _lastPageIndex) {
          pageChangerBloc.add(
            IntroductionScreenLoadedEvent(),
          );
        } else {
          _controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              AppTheme.secondaryColor,
              AppTheme.primaryColor,
            ],
          ),
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
