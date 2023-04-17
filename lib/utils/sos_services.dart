import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../routes.dart';

class SosServices {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://hershield-backend-production.up.railway.app/api/auth',
  ));
  final sosEndPoint = '/sos';
  final activePinEndPoint = '/activePin';
  final falseSosEndPoint = '/falsesos';

  Future<String?> createSos({
    required LatLng currentLocation,
    required String userId,
  }) async {
    try {
      final createSosArguments = {
        'latitude': (currentLocation.latitude).toString(),
        'longitude': (currentLocation.longitude).toString(),
        'userId': userId.toString(),
      };
      final response = await dio.post(
        sosEndPoint,
        data: createSosArguments,
      );
      return response.data['sos']['_id'];
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

  Future<bool> registerPin({
    required String activePin,
    required String userId,
  }) async {
    try {
      final registerArguments = {
        'userId': userId.toString(),
        'activepin': activePin,
      };
      final response = await dio.post(
        activePinEndPoint,
        data: registerArguments,
      );
      print(response.data);
      return response.data['status'] as bool;
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

  Future<bool> falseSos({
    required String activePin,
    required String userId,
    required String sosId,
  }) async {
    try {
      final falseSosArguments = {
        'userId': userId.toString(),
        'activepin': activePin.toString(),
        'sosId': sosId.toString(),
      };
      final response = await dio.post(
        falseSosEndPoint,
        data: falseSosArguments,
      );
      print(response.data);
      return response.data['status'] as bool;
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
