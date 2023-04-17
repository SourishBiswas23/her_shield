import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_project/data/models/report_history_model.dart';
import 'package:hackathon_project/data/models/sos_history_model.dart';

import '../routes.dart';

class HistoryServices {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://hershield-backend-production.up.railway.app/api',
  ));
  final reportHistoryEndpoint = '/complaint/user';
  final sosHistoryEndpoint = '/auth/soshistory';

  Future<List<ReportHistoryModel>> getReportHistory({
    required String userId,
  }) async {
    try {
      final createSosArguments = {
        'userId': userId.toString(),
      };
      final response = await dio.get(
        reportHistoryEndpoint,
        data: createSosArguments,
      );
      final complaintList = response.data['complaint'][0]['complaints'];
      final List<ReportHistoryModel> historyList = [];
      for (var element in (complaintList as List)) {
        final ReportHistoryModel model = ReportHistoryModel(
          createdAt: element['createdAt'],
          status: 'Active',
          userName: element['name'],
        );
        historyList.add(model);
      }
      return historyList;
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
    return [];
  }

  Future<List<SosHistoryModel>> getSosHistory({
    required String userId,
  }) async {
    try {
      final createSosArguments = {
        'userId': userId.toString(),
      };
      final response = await dio.get(
        sosHistoryEndpoint,
        data: createSosArguments,
      );
      final complaintList = response.data['user']['SOS'];
      final List<SosHistoryModel> historyList = [];
      for (var element in (complaintList as List)) {
        final SosHistoryModel model = SosHistoryModel(
          createdAt: element['createdAt'],
          status: element['status'],
          userName: response.data['user']['name'],
        );
        historyList.add(model);
      }
      return historyList;
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
    return [];
  }
}
