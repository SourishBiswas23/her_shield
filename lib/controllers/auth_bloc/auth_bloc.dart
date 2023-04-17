import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_project/data/models/user_model.dart';
import 'package:hackathon_project/routes.dart';
import 'package:hackathon_project/utils/auth_services.dart';
import 'package:hackathon_project/utils/data_base_services.dart';
import 'package:hackathon_project/utils/sos_services.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      AppNavigator.push(route: Routes.loadingScreen);
      final registeredSuccessfully = await _authServices.registerUser(
        userName: event.userName,
        emailId: event.emailId,
        phoneNumber: event.phoneNumber,
        password: event.password,
      );
      AppNavigator.pop();
      if (registeredSuccessfully) {
        AppNavigator.pushReplace(route: Routes.loginScreen);
      }
    });
    on<LoginUserEvent>((event, emit) async {
      AppNavigator.push(route: Routes.loadingScreen);
      final loginResponse = await _authServices.loginUser(
        emailId: event.emailId,
        password: event.password,
      );
      AppNavigator.pop();
      if (loginResponse != null) {
        final wasUserSuccessfullyLoggedIn = loginResponse['status'];
        if (wasUserSuccessfullyLoggedIn) {
          AppNavigator.pushReplace(route: Routes.enterPinScreen);
          final user = UserModel(
            userId: loginResponse['user']['_id'],
            userName: loginResponse['user']['name'],
            userEmailId: loginResponse['user']['email'],
            userContactNo: loginResponse['user']['contactno'],
          );
          _dataBaseServices.saveUser(user: user);
        } else {
          AppNavigator.showSnackBar(
            snackBar: SnackBar(
              content: Text(
                loginResponse['message'].toString(),
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
    });
    on<SaveActivePin>((event, emit) async {
      AppNavigator.push(route: Routes.loadingScreen);
      final userId = await _dataBaseServices.getUserId();
      final wasPinRegistered = await _sosServices.registerPin(
        activePin: event.activePin,
        userId: userId,
      );
      if (wasPinRegistered == true) {
        await _dataBaseServices.saveActivePin(activePin: event.activePin);
        AppNavigator.pop();
        AppNavigator.pushReplace(route: Routes.homeScreen);
      }
    });
  }
  final AuthServices _authServices = AuthServices();
  final DataBaseServices _dataBaseServices = DataBaseServices();
  final SosServices _sosServices = SosServices();
}
