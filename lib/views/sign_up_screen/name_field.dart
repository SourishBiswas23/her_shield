import 'package:flutter/material.dart';

import '../../app_theme.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(
        labelText: 'Enter your name',
        prefixIcon: Icon(Icons.person_outline),
      ),
      keyboardType: TextInputType.name,
      cursorColor: AppTheme.secondaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name cannot be empty';
        }
        return null;
      },
    );
  }
}
