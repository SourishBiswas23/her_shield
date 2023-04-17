import 'package:flutter/material.dart';
import 'package:hackathon_project/routes.dart';

class DisplayAlertDialot {
  void showPermissionPermanentlyDeniedDialog(String permissionName) {
    showDialog(
      context: AppNavigator.scaffoldMessengerKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: const Text('Permission Denied'),
          content: const Text(
            'Please grant the required permissions from the app settings.',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            )
          ],
        );
      },
    );
  }
}
