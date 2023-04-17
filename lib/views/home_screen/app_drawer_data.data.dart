import 'package:flutter/material.dart';
import 'package:hackathon_project/app_theme.dart';
import 'package:hackathon_project/routes.dart';
import 'package:hackathon_project/utils/data_base_services.dart';

final nameController = TextEditingController();
final phoneNumberController = TextEditingController();

final DataBaseServices _dataBaseServices = DataBaseServices();
final List<Map<String, dynamic>> appDrawerData = [
  {
    'title': 'About Us',
    'icons': Icons.info_outline,
    'callback': (BuildContext context) {
      AppNavigator.pop();
    }
  },
  {
    'title': 'Emergency Contacts',
    'icons': Icons.mail_outline,
    'callback': (BuildContext context) {
      AppNavigator.pop();
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return AlertDialog(
      //       title: const Text(
      //         'Enter contacts',
      //       ),
      //       content: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           TextField(
      //             controller: nameController,
      //             decoration: const InputDecoration(
      //               hintText: 'Enter name',
      //             ),
      //           ),
      //           const SizedBox(height: 5),
      //           TextField(
      //             controller: phoneNumberController,
      //             decoration: const InputDecoration(
      //               hintText: 'Enter phone number',
      //             ),
      //           ),
      //         ],
      //       ),
      //       actions: [
      //         ElevatedButton(
      //           onPressed: () async {
      //             AppNavigator.pop();
      //             AppNavigator.push(route: Routes.loadingScreen);
      //             await _dataBaseServices.deleteUser();
      //             await _dataBaseServices.deleteActivePin();
      //             AppNavigator.pop();
      //             AppNavigator.push(route: Routes.loginScreen);
      //           },
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: AppTheme.primaryColor,
      //           ),
      //           child: const Text('Add'),
      //         ),
      //         ElevatedButton(
      //           onPressed: () {
      //             AppNavigator.pop();
      //           },
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: AppTheme.secondaryColor,
      //           ),
      //           child: const Text('Cancel'),
      //         )
      //       ],
      //     );
      //   },
      // );
    }
  },
  {
    'title': 'Profile',
    'icons': Icons.person_3_outlined,
    'callback': (BuildContext context) {
      AppNavigator.pop();
    }
  },
  {
    'title': 'Log Out',
    'icons': Icons.logout_outlined,
    'callback': (BuildContext context) {
      AppNavigator.pop();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Do you really want to Log Out?',
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  AppNavigator.pop();
                  AppNavigator.push(route: Routes.loadingScreen);
                  await _dataBaseServices.deleteUser();
                  await _dataBaseServices.deleteActivePin();
                  AppNavigator.pop();
                  AppNavigator.push(route: Routes.loginScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                ),
                child: const Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  AppNavigator.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.secondaryColor,
                ),
                child: const Text('No'),
              )
            ],
          );
        },
      );
    }
  },
];
