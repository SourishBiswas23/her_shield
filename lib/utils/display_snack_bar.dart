import 'package:flutter/material.dart';
import 'package:hackathon_project/routes.dart';

class DisplaySnackBar {
  void displaySnackBar({required String message}) {
    AppNavigator.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            AppNavigator.scaffoldMessengerKey.currentState
                ?.removeCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
