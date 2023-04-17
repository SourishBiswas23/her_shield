part of 'location_bloc.dart';

@immutable
abstract class LocationState {
  final double latitude = -1;
  final double longitude = -1;
}

class LocationInitial extends LocationState {}

class CurrentLocation extends LocationState {
  CurrentLocation({
    required this.latitude,
    required this.longitude,
    required this.nearestPoliceStations,
    required this.route,
  });
  @override
  final latitude;
  @override
  final longitude;

  final List<LatLng> nearestPoliceStations;
  final List<LatLng> route;
}
