import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/data/models/report_as_witness_model.dart';
import 'package:hackathon_project/utils/data_base_services.dart';

import '../../app_theme.dart';
import '../../controllers/report_bloc/report_bloc.dart';

class ReportAsWitnessButton extends StatelessWidget {
  const ReportAsWitnessButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.designationController,
    required this.contactNoController,
    required this.aadhaarController,
    required this.organisationNameController,
    required this.organisationPhoneController,
    required this.organisationEmailController,
    required this.organisationHeadController,
    required this.organisationStateController,
    required this.organisationDistrictController,
    required this.organisationAddressController,
    required this.offendersNameController,
    required this.offendersDesignationController,
    required this.offendersWorkingRelationshipController,
    required this.victimNameController,
    required this.victimPhoneController,
    required this.victimEmailController,
    required this.victimDesignationController,
    required this.victimWorkingRelationshipController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController designationController;
  final TextEditingController contactNoController;
  final TextEditingController aadhaarController;
  final TextEditingController organisationNameController;
  final TextEditingController organisationPhoneController;
  final TextEditingController organisationEmailController;
  final TextEditingController organisationHeadController;
  final TextEditingController organisationStateController;
  final TextEditingController organisationDistrictController;
  final TextEditingController organisationAddressController;
  final TextEditingController offendersNameController;
  final TextEditingController offendersDesignationController;
  final TextEditingController offendersWorkingRelationshipController;
  final TextEditingController victimNameController;
  final TextEditingController victimPhoneController;
  final TextEditingController victimEmailController;
  final TextEditingController victimDesignationController;
  final TextEditingController victimWorkingRelationshipController;

  @override
  Widget build(BuildContext context) {
    final ReportBloc reportBloc = context.read<ReportBloc>();
    final DataBaseServices dataBaseServices = DataBaseServices();
    return GestureDetector(
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          final userId = await dataBaseServices.getUserId();

          final reportAsWitnessModel = ReportAsWitnessModel(
            userId: userId,
            userName: nameController.text,
            userPhoneNumber: phoneController.text,
            userEmail: emailController.text,
            contactNumber: contactNoController.text,
            userDesignation: designationController.text,
            userAdhaarNumber: aadhaarController.text,
            organisationName: organisationNameController.text,
            organisationPhone: organisationPhoneController.text,
            organisationEmail: organisationEmailController.text,
            organisationHead: organisationHeadController.text,
            organisationState: organisationStateController.text,
            organisationDistrict: organisationDistrictController.text,
            organisationAddress: organisationAddressController.text,
            offendersName: offendersNameController.text,
            offendersDesignation: offendersDesignationController.text,
            offendersWorkingRelationship:
                offendersWorkingRelationshipController.text,
            victimDesignation: victimDesignationController.text,
            victimEmail: victimEmailController.text,
            victimName: victimNameController.text,
            victimPhoneNumber: victimPhoneController.text,
            victimWorkingRelationship: victimWorkingRelationshipController.text,
          );
          reportBloc.add(ReportAsWitnessEvent(
            ReportAsWitnessModel: reportAsWitnessModel,
          ));
        }
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
          'Report as Witness',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
