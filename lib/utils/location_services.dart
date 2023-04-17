import 'dart:convert';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:latlong2/latlong.dart';

import 'package:dio/dio.dart';
import 'package:location/location.dart';

class LocationServices {
  static final LocationServices _instance = LocationServices._internal();
  factory LocationServices() {
    return _instance;
  }
  LocationServices._internal();

  Location location = Location();
  final distance = const Distance();
  final Dio dio = Dio();
  double latitude = 0;
  double longitude = 0;
  final int radiusInMeters = 50000;
  LatLng? nearestPoliceStation;

  Future<LatLng> getCurrentLocation() async {
    await location.getLocation().then((currentLocation) {
      latitude = currentLocation.latitude ?? -1;
      longitude = currentLocation.longitude ?? -1;
    });
    return LatLng(latitude, longitude);

    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   latitude = currentLocation.latitude ?? -1;
    //   longitude = currentLocation.longitude ?? -1;
    //   setState(() {});
    // });
  }

  Future<List<LatLng>?> getPoliceStations({
    required LatLng currentLocation,
  }) async {
    final String query = '''
    [out:json];
    node["amenity"="police"]["name"]
      (around:$radiusInMeters,${currentLocation.latitude},${currentLocation.longitude});
    out;
  ''';

    final Response<String> response = await dio.post(
      'https://overpass-api.de/api/interpreter',
      data: query,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.data!) as Map<String, dynamic>;
      final List<dynamic> elements = data['elements'] as List<dynamic>;
      final List<LatLng> policeStations = elements
          .where(
            (element) => element['tags']['amenity'] == 'police',
          )
          .map(
            (element) => LatLng(
              element['lat'] as double,
              element['lon'] as double,
            ),
          )
          .toList();
      return policeStations;
    } else {
      throw Exception('Failed to load police stations');
    }
  }

  LatLng? getNearestPoliceStation({
    required LatLng currentLocation,
    required List<LatLng> policeStations,
  }) {
    double shortestDistance = double.infinity;

    for (int i = 0; i < policeStations.length; i++) {
      double policeStationDistance = distance.as(
        LengthUnit.Meter,
        currentLocation,
        policeStations[i],
      );

      if (policeStationDistance < shortestDistance) {
        shortestDistance = policeStationDistance;
        nearestPoliceStation = policeStations[i];
      }
    }
    return nearestPoliceStation;
  }

  Future<List<LatLng>> getRoute({
    required LatLng source,
    required LatLng destination,
  }) async {
    String accessToken =
        'pk.eyJ1IjoiaGltYW5pc2h1OTMiLCJhIjoiY2xnNzEzN2NuMDJmZDNscGltd3pmcTRiMCJ9.NWJQbn74aZkRYk-IOORhWA';
    String coordinates =
        '${source.longitude},${source.latitude};${destination.longitude},${destination.latitude}';
    String url =
        'https://api.mapbox.com/directions/v5/mapbox/driving/$coordinates?access_token=$accessToken';

    var response = await dio.get(url);

    var data = response.data;

    var geometry = data['routes'][0]['geometry'];
    return decodePolyline(geometry);
  }

  List<LatLng> decodePolyline(String polyline) {
    List<PointLatLng> points = PolylinePoints().decodePolyline(polyline);
    return points
        .map((point) => LatLng(point.latitude, point.longitude))
        .toList();
  }
}
