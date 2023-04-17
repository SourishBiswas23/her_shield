import 'package:flutter/material.dart';

import '../../app_theme.dart';
import 'grant_permission_button.dart';
import 'list_of_permissions.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_rounded,
        ),
        actions: const [
          Center(
            child: Text(
              'Deny Permission',
              style: TextStyle(
                color: AppTheme.textColor2,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'We would like to take your permission just for your safety',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              ...permissionListBuilder(
                permissionList: iconLabelPair,
                theme: theme,
              ),
              const GrantPermissionButton(),
            ],
          ),
        ),
      ),
    );
  }
}
