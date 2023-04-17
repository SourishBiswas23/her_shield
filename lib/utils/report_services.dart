import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_project/data/models/report_as_victim_model.dart';

import '../data/models/report_as_witness_model.dart';
import '../routes.dart';

class ReportServices {
  final dio = Dio(BaseOptions(
    baseUrl:
        'https://hershield-backend-production.up.railway.app/api/complaint',
  ));
  final allMessagesEndpoint = '/user';
  final reportAsVictimEndPoint = '/register';
  final reportAsWitnessEndPoint = '/register/witness';

  Future<void> getAllReports() async {
    try {
      final response = await dio.get(allMessagesEndpoint);
      print(response.data);
    } on DioError catch (e) {
      AppNavigator.showSnackBar(
        snackBar: SnackBar(
          content: Text(
            e.message.toString(),
          ),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              AppNavigator.scaffoldMessengerKey.currentState
                  ?.removeCurrentSnackBar();
            },
          ),
        ),
      );
    }
    return null;
  }

  Future<bool> reportAsVictim({
    required ReportAsVictimModel reportAsVictimModel,
  }) async {
    try {
      final reportAsVictimData = {
        'userId': reportAsVictimModel.userId,
        'name': reportAsVictimModel.userName,
        'phone': reportAsVictimModel.userPhoneNumber,
        'email': reportAsVictimModel.userEmail,
        'designation': reportAsVictimModel.userDesignation,
        'contactno': reportAsVictimModel.contactNumber,
        'adhaar': reportAsVictimModel.userAdhaarNumber,
        'organisationname': reportAsVictimModel.organisationName,
        'organisationemail': reportAsVictimModel.organisationEmail,
        'organisationphone': reportAsVictimModel.organisationPhone,
        'organisationhead': reportAsVictimModel.organisationHead,
        'organisationstate': reportAsVictimModel.organisationState,
        'organisationdistrict': reportAsVictimModel.organisationDistrict,
        'organisationaddress': reportAsVictimModel.organisationAddress,
        'offendersname': reportAsVictimModel.offendersName,
        'offendersdesignation': reportAsVictimModel.offendersDesignation,
        'offendersworkingrelationship':
            reportAsVictimModel.offendersWorkingRelationship,
      };
      final response = await dio.post(
        reportAsVictimEndPoint,
        data: reportAsVictimData,
      );
      return response.data['status'];
    } on DioError catch (e) {
      AppNavigator.showSnackBar(
        snackBar: SnackBar(
          content: Text(
            e.message.toString(),
          ),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              AppNavigator.scaffoldMessengerKey.currentState
                  ?.removeCurrentSnackBar();
            },
          ),
        ),
      );
    }
    return false;
  }

  Future<bool> reportAsWitness({
    required ReportAsWitnessModel reportAsWitness,
  }) async {
    try {
      final reportAsWitnessData = {
        'userId': reportAsWitness.userId,
        'name': reportAsWitness.userName,
        'phone': reportAsWitness.userPhoneNumber,
        'email': reportAsWitness.userEmail,
        'designation': reportAsWitness.userDesignation,
        'contactno': reportAsWitness.contactNumber,
        'adhaar': reportAsWitness.userAdhaarNumber,
        'organisationname': reportAsWitness.organisationName,
        'organisationemail': reportAsWitness.organisationEmail,
        'organisationphone': reportAsWitness.organisationPhone,
        'organisationhead': reportAsWitness.organisationHead,
        'organisationstate': reportAsWitness.organisationState,
        'organisationdistrict': reportAsWitness.organisationDistrict,
        'organisationaddress': reportAsWitness.organisationAddress,
        'offendersname': reportAsWitness.offendersName,
        'offendersdesignation': reportAsWitness.offendersDesignation,
        'offendersworkingrelationship':
            reportAsWitness.offendersWorkingRelationship,
        'victimname': reportAsWitness.victimName,
        'victimphone': reportAsWitness.victimPhoneNumber,
        'victimemail': reportAsWitness.victimEmail,
        'victimdesignation': reportAsWitness.victimDesignation,
        'victimworkingrelationship': reportAsWitness.victimWorkingRelationship,
      };
      final response = await dio.post(
        reportAsWitnessEndPoint,
        data: reportAsWitnessData,
      );
      print(response.data);
      return response.data['status'];
    } on DioError catch (e) {
      AppNavigator.showSnackBar(
        snackBar: SnackBar(
          content: Text(
            e.message.toString(),
          ),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              AppNavigator.scaffoldMessengerKey.currentState
                  ?.removeCurrentSnackBar();
            },
          ),
        ),
      );
    }
    return false;
  }
}
