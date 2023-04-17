import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/views/loading_screen/loading_screen.dart';
import 'package:hackathon_project/views/mapbox_map/mapbox_map.dart';
import 'package:latlong2/latlong.dart';

import '../../controllers/location_bloc/location_bloc.dart';

class DirectionsScreen extends StatelessWidget {
  const DirectionsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final LocationBloc locationBloc = context.read<LocationBloc>();
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is CurrentLocation) {
          return MapboxMap(
            location: LatLng(state.latitude, state.longitude),
            nearestPoliceStationsList: state.nearestPoliceStations,
            route: state.route,
          );
        } else {
          locationBloc.add(GetCurrentLocation());
          return const LoadingScreen();
        }
      },
    );
  }
}
