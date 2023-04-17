import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class AuthServices {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://hershield-backend-production.up.railway.app/api/auth',
  ));
  final registerEndpoint = '/register';
  final loginEndpoint = '/login';

  Future<bool> registerUser({
    required String userName,
    required String emailId,
    required int phoneNumber,
    required String password,
  }) async {
    try {
      final registerArguments = {
        'name': userName,
        'email': emailId,
        'password': password,
        'contactno': phoneNumber,
      };
      final response = await dio.post(
        registerEndpoint,
        data: registerArguments,
      );

      return response.data['result'] as bool;
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
      return false;
    }
  }

  Future<dynamic> loginUser({
    required String emailId,
    required String password,
  }) async {
    try {
      final loginArguments = {
        'email': emailId,
        'password': password,
      };
      final response = await dio.post(
        loginEndpoint,
        data: loginArguments,
      );

      return response.data;
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
  }
}
