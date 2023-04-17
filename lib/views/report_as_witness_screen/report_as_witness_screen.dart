import 'package:flutter/material.dart';

import '../../app_theme.dart';
import 'report_as_witness_button.dart';

class ReportAsWitnessScreen extends StatefulWidget {
  const ReportAsWitnessScreen({super.key});

  @override
  State<ReportAsWitnessScreen> createState() => _ReportAsWitnessScreenState();
}

class _ReportAsWitnessScreenState extends State<ReportAsWitnessScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _designationController;
  late final TextEditingController _contactNoController;
  late final TextEditingController _aadhaarController;
  late final TextEditingController _victimNameController;
  late final TextEditingController _victimPhoneController;
  late final TextEditingController _victimEmailController;
  late final TextEditingController _victimDesignationController;
  late final TextEditingController _victimWorkingRelationshipController;
  late final TextEditingController _organisationNameController;
  late final TextEditingController _organisationPhoneController;
  late final TextEditingController _organisationEmailController;
  late final TextEditingController _organisationHeadController;
  late final TextEditingController _organisationStateController;
  late final TextEditingController _organisationDistrictController;
  late final TextEditingController _organisationAddressController;
  late final TextEditingController _offendersNameController;
  late final TextEditingController _offendersDesignationController;
  late final TextEditingController _offendersWorkingRelationshipController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _designationController = TextEditingController();
    _contactNoController = TextEditingController();
    _aadhaarController = TextEditingController();
    _victimNameController = TextEditingController();
    _victimPhoneController = TextEditingController();
    _victimEmailController = TextEditingController();
    _victimDesignationController = TextEditingController();
    _victimWorkingRelationshipController = TextEditingController();
    _organisationNameController = TextEditingController();
    _organisationPhoneController = TextEditingController();
    _organisationEmailController = TextEditingController();
    _organisationHeadController = TextEditingController();
    _organisationStateController = TextEditingController();
    _organisationDistrictController = TextEditingController();
    _organisationAddressController = TextEditingController();
    _offendersNameController = TextEditingController();
    _offendersDesignationController = TextEditingController();
    _offendersWorkingRelationshipController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _designationController.dispose();
    _contactNoController.dispose();
    _aadhaarController.dispose();
    _victimNameController.dispose();
    _victimPhoneController.dispose();
    _victimEmailController.dispose();
    _victimDesignationController.dispose();
    _victimWorkingRelationshipController.dispose();
    _organisationNameController.dispose();
    _organisationPhoneController.dispose();
    _organisationEmailController.dispose();
    _organisationHeadController.dispose();
    _organisationStateController.dispose();
    _organisationDistrictController.dispose();
    _organisationAddressController.dispose();
    _offendersNameController.dispose();
    _offendersDesignationController.dispose();
    _offendersWorkingRelationshipController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report as Witness",
          style: theme.textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Enter your name",
                    prefixIcon: Icon(Icons.person_3_outlined),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: "Enter your Phone Number",
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone Number cannot be empty";
                    }
                    if (value.length != 10) {
                      return "Please enter a valid phone number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Enter your Email Id",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email cannot be empty";
                    }
                    final emailRegex =
                        RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                    if (!emailRegex.hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _designationController,
                  decoration: const InputDecoration(
                    labelText: "Enter your Designation",
                    prefixIcon: Icon(Icons.work_outline),
                  ),
                  maxLines: null,
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Designation cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _contactNoController,
                  decoration: const InputDecoration(
                    labelText: "Enter your Contact Number",
                    prefixIcon: Icon(Icons.call_outlined),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone Number cannot be empty";
                    }
                    if (value.length != 10) {
                      return "Please enter a valid phone number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _aadhaarController,
                  decoration: const InputDecoration(
                    labelText: "Enter your Aadhar Number",
                    prefixIcon: Icon(Icons.credit_card_outlined),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Aadhar Number cannot be empty";
                    }
                    if (value.length != 12) {
                      return "Please enter a valid Aadhar Number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _victimNameController,
                  decoration: const InputDecoration(
                    labelText: "Enter the Victim's name",
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Victim's Name cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _victimPhoneController,
                  decoration: const InputDecoration(
                    labelText: "Enter the Victim's phone number",
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Victim's phone number cannot be empty";
                    }
                    if (value.length != 10) {
                      return "Please enter a valid phone number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _victimEmailController,
                  decoration: const InputDecoration(
                    labelText: "Enter Victim's Email Id",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Victim's Email Id cannot be empty";
                    }
                    final emailRegex =
                        RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                    if (!emailRegex.hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _victimDesignationController,
                  decoration: const InputDecoration(
                    labelText: "Enter Victim's Designation",
                    prefixIcon: Icon(Icons.work_outline),
                  ),
                  maxLines: null,
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Victim's Designation cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _victimWorkingRelationshipController,
                  decoration: const InputDecoration(
                    labelText: "Enter Victims's working relationship",
                    prefixIcon: Icon(Icons.group_work_outlined),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Victims's working relationship cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _organisationNameController,
                  decoration: const InputDecoration(
                    labelText: "Enter Organisation's Name",
                    prefixIcon: Icon(Icons.business_outlined),
                  ),
                  keyboardType: TextInputType.name,
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Organisation's Name be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _organisationPhoneController,
                  decoration: const InputDecoration(
                    labelText: "Enter Organisation's Phone Number",
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Organisation's Phone Number cannot be empty";
                    }
                    if (value.length != 10) {
                      return "Please enter a valid phone number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _organisationEmailController,
                  decoration: const InputDecoration(
                    labelText: "Enter Organisation's Email Id",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Organisation's Email Id cannot be empty";
                    }
                    final emailRegex =
                        RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                    if (!emailRegex.hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _organisationHeadController,
                  decoration: const InputDecoration(
                    labelText: "Enter name of Organisation's head",
                    prefixIcon: Icon(Icons.account_balance_outlined),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _organisationStateController,
                  decoration: const InputDecoration(
                    labelText: "Enter Organisation's State",
                    prefixIcon: Icon(Icons.location_city_outlined),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Organisation's State name cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _organisationDistrictController,
                  decoration: const InputDecoration(
                    labelText: "Enter Organisation's District",
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Organisation's District name cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _organisationAddressController,
                  decoration: const InputDecoration(
                    labelText: "Enter Organisation's Address",
                    prefixIcon: Icon(Icons.room_outlined),
                  ),
                  keyboardType: TextInputType.streetAddress,
                  maxLines: null,
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Organisation's Address cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _offendersNameController,
                  decoration: const InputDecoration(
                    labelText: "Enter Offender's Name",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  keyboardType: TextInputType.name,
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Offender's Name cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _offendersDesignationController,
                  decoration: const InputDecoration(
                    labelText: "Enter Offender's Designation",
                    prefixIcon: Icon(Icons.work_outline),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Offender's Designation cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _offendersWorkingRelationshipController,
                  decoration: const InputDecoration(
                    labelText: "Enter Offender's working relationship",
                    prefixIcon: Icon(Icons.group_work_outlined),
                  ),
                  cursorColor: AppTheme.secondaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Offender's working relationship cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ReportAsWitnessButton(
                  formKey: _formKey,
                  aadhaarController: _aadhaarController,
                  contactNoController: _contactNoController,
                  designationController: _designationController,
                  emailController: _emailController,
                  nameController: _nameController,
                  offendersDesignationController:
                      _offendersDesignationController,
                  offendersNameController: _offendersNameController,
                  offendersWorkingRelationshipController:
                      _offendersWorkingRelationshipController,
                  organisationAddressController: _organisationAddressController,
                  organisationDistrictController:
                      _organisationDistrictController,
                  organisationEmailController: _organisationEmailController,
                  organisationHeadController: _organisationHeadController,
                  organisationNameController: _organisationNameController,
                  organisationPhoneController: _organisationPhoneController,
                  organisationStateController: _organisationAddressController,
                  phoneController: _phoneController,
                  victimDesignationController: _victimDesignationController,
                  victimEmailController: _victimEmailController,
                  victimNameController: _victimNameController,
                  victimPhoneController: _victimPhoneController,
                  victimWorkingRelationshipController:
                      _victimWorkingRelationshipController,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
