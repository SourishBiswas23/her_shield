import 'package:flutter/material.dart';
import 'package:hackathon_project/views/aadhar_details_screen/address_field.dart';

import 'name_field.dart';
import 'page_banner.dart';
import 'otp_field.dart';
import 'phone_number_field.dart';
import 'verify_button.dart';

class AadharDetailsForm extends StatelessWidget {
  const AadharDetailsForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController phoneNumberController,
    required TextEditingController passwordController,
    required TextEditingController addressController,
  })  : _passwordController = passwordController,
        _phoneNumberController = phoneNumberController,
        _aadharNumberController = nameController,
        _addressController = addressController,
        _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _aadharNumberController;
  final TextEditingController _phoneNumberController;
  final TextEditingController _passwordController;
  final TextEditingController _addressController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 50),
          const PageBanner(),
          const SizedBox(height: 50),
          Text(
            'Add your Aadhar Details',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/aadhar_card.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          AadharNumberField(aadharNumberController: _aadharNumberController),
          const SizedBox(height: 20),
          PhoneNumberField(phoneNumberController: _phoneNumberController),
          const SizedBox(height: 20),
          OtpField(otpController: _passwordController),
          const SizedBox(height: 20),
          AddressField(addressController: _addressController),
          const SizedBox(height: 30),
          VerifyButton(formKey: _formKey),
        ],
      ),
    );
  }
}
