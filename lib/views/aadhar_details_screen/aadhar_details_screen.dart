import 'package:flutter/material.dart';

import 'aadhar_details_form.dart';

class AadharDetailsScreen extends StatefulWidget {
  const AadharDetailsScreen({super.key});

  @override
  State<AadharDetailsScreen> createState() => _AadharDetailsScreenState();
}

class _AadharDetailsScreenState extends State<AadharDetailsScreen> {
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AadharDetailsForm(
            formKey: _formKey,
            nameController: _nameController,
            phoneNumberController: _phoneNumberController,
            passwordController: _passwordController,
            addressController: _addressController,
          ),
        ),
      ),
    );
  }
}
