import 'package:flutter/material.dart';

import '../../app_theme.dart';

class AddressField extends StatelessWidget {
  const AddressField({
    super.key,
    required this.addressController,
  });

  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: addressController,
      decoration: const InputDecoration(
        labelText: 'Enter your Address',
        prefixIcon: Icon(Icons.lock_outline),
      ),
      cursorColor: AppTheme.secondaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Address cannot be empty';
        }
        return null;
      },
    );
  }
}
