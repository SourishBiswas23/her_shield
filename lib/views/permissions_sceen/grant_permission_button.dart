import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/controllers/permissions_bloc/permissions_bloc.dart';

import '../../app_theme.dart';

class GrantPermissionButton extends StatelessWidget {
  const GrantPermissionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PermissionsBloc permissionsBloc = context.read<PermissionsBloc>();
    return GestureDetector(
      onTap: () async {
        permissionsBloc.add(
          GrantAllPermissionsEvent(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: const Text(
          'Grant Permission',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
