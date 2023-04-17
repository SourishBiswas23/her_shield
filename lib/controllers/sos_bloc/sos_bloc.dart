import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_project/routes.dart';
import 'package:hackathon_project/utils/data_base_services.dart';
import 'package:hackathon_project/utils/location_services.dart';
import 'package:hackathon_project/utils/sos_services.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart'
    as permissionHandler;
import 'package:flutter_sms/flutter_sms.dart';

part 'sos_event.dart';
part 'sos_state.dart';

class SosBloc extends Bloc<SosEvent, SosState> {
  SosBloc() : super(SosInitial()) {
    on<LoadSosScreenEvent>((event, emit) async {
      AppNavigator.pushReplace(route: Routes.loadingScreen);
      final currentLocation = await _locationServices.getCurrentLocation();
      await _sendMessage(
        message:
            'https://maps.google.com/?q=${currentLocation.latitude},${currentLocation.longitude}',
        recipients: [
          '+917052176412',
          '+919336178527',
        ],
      );
      final userId = await _dataBaseServices.getUserId();
      final String? sosId = await _sosServices.createSos(
        currentLocation: currentLocation,
        userId: userId,
      );
      if (sosId != null) {
        AppNavigator.pushReplace(route: Routes.sosTriggeredScreen);
        emit(SosTriggeredState(sosId: sosId));
      } else {
        AppNavigator.pop();
      }
    });
    on<LoadEnterPinScreenForVerification>((event, emit) async {
      AppNavigator.pushReplace(route: Routes.enterPinScreen);
    });
    on<VerifyPinForFalseSos>((event, emit) async {
      AppNavigator.pushReplace(route: Routes.loadingScreen);
      final userId = await _dataBaseServices.getUserId();
      final bool isFalseSos = await _sosServices.falseSos(
        activePin: event.activePin,
        userId: userId,
        sosId: (state as SosTriggeredState).sosId,
      );
      if (isFalseSos) {
        AppNavigator.pushReplace(route: Routes.homeScreen);
      } else {
        AppNavigator.pushReplace(route: Routes.enterPinScreen);
        AppNavigator.showSnackBar(
          snackBar: SnackBar(
            content: const Text('The entered pin is incorrect'),
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
    });
  }
  final LocationServices _locationServices = LocationServices();
  final SosServices _sosServices = SosServices();
  final DataBaseServices _dataBaseServices = DataBaseServices();
}

Future<void> _sendMessage({
  required String message,
  required List<String> recipients,
}) async {
  String messageSent = '';
  final status = await permissionHandler.Permission.sms.status;
  print(status);
  print(messageSent);
  try {
    messageSent = await sendSMS(
      message: message,
      recipients: recipients,
      sendDirect: true,
    );
  } catch (e) {
    print(e.toString());
    messageSent = 'message not sent. Error: $e';
  }
}
