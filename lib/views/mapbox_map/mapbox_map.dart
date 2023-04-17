import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapboxMap extends StatelessWidget {
  const MapboxMap({
    super.key,
    required this.location,
    required this.nearestPoliceStationsList,
    required this.route,
  });
  final LatLng location;
  final List<LatLng> nearestPoliceStationsList;
  final List<LatLng> route;
  static const _urlTemplate =
      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: location,
            zoom: 15,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: _urlTemplate,
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: location,
                  builder: (ctx) => const SizedBox(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ),
                ...nearestPoliceStationsList.map(
                  (station) {
                    return Marker(
                      point: LatLng(station.latitude, station.longitude),
                      builder: (context) {
                        return const Icon(
                          Icons.local_police,
                          color: Colors.red,
                          size: 40,
                        );
                      },
                    );
                  },
                ).toList(),
              ],
            ),
            PolylineLayerOptions(
              polylines: [
                Polyline(
                  points: route,
                  color: Colors.red,
                  strokeWidth: 3.0,
                ),
              ],
            )
          ],
        )
      ],
    ));
  }
}
