import 'package:flutter/material.dart';

class CacheAssetImages {
  final List<String> _imagePaths = [
    'assets/icons/logo.png',
    'assets/images/add_your_close_circle.png',
    'assets/images/sos_feature.png',
    'assets/images/track_safe_zones.png',
    'assets/images/page_not_found.jpg',
    'assets/images/be_aware.jpg',
    'assets/images/events_and_activities.jpg',
    'assets/images/directions.jpg',
    'assets/images/radiant_city.png',
    'assets/images/safe_stay.jpg',
    'assets/images/friends.jpg',
    'assets/images/helpline_numbers.jpg',
    'assets/images/e_learning.jpg',
    'assets/images/aadhar_card.png',
    'assets/images/add_hostels.jpg',
    'assets/images/favourites.jpg',
    'assets/images/learn_on_the_go.jpg',
    'assets/images/my_incidents.jpg',
    'assets/images/my_requests.jpg',
    'assets/images/no_requests.png',
    'assets/images/policies_and_docs.jpg',
    'assets/images/request_help.jpg',
    'assets/images/search_hostels.jpg',
  ];

  Future<void> preCacheAssetImages({required BuildContext context}) async {
    for (var imagePath in _imagePaths) {
      await precacheImage(AssetImage(imagePath), context);
    }
  }
}
