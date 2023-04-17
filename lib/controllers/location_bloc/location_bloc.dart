import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../../routes.dart';
import '../../utils/location_services.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<GetCurrentLocation>((event, emit) async {
      final currentLocation = await locationServices.getCurrentLocation();
      final nearestPoliceStations = await locationServices.getPoliceStations(
        currentLocation: currentLocation,
      );
      final nearestPoliceStation = locationServices.getNearestPoliceStation(
        currentLocation: currentLocation,
        policeStations: nearestPoliceStations ?? [],
      );
      final route = await locationServices.getRoute(
        source: currentLocation,
        destination: nearestPoliceStation ?? currentLocation,
      );
      if (nearestPoliceStations == null || nearestPoliceStations.isEmpty) {
        AppNavigator.showSnackBar(
          snackBar: SnackBar(
            content: const Text(
              'The Path could not be loaded because of a server error.',
            ),
            action: SnackBarAction(
              label: 'Dismiss',
              onPressed: () {
                AppNavigator.scaffoldMessengerKey.currentState
                    ?.removeCurrentMaterialBanner();
              },
            ),
          ),
        );
      }
      emit(
        CurrentLocation(
          latitude: currentLocation.latitude,
          longitude: currentLocation.longitude,
          nearestPoliceStations: nearestPoliceStations ?? [],
          route: route,
        ),
      );
    });
  }
  final LocationServices locationServices = LocationServices();
}
