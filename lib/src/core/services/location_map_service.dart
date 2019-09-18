/*
*   Filename    :   location_map_service.dart
*   Purpose     :
*   Created     :   17/09/2019 6:10 PM by Detective Conan
*   Updated     :   17/09/2019 6:10 PM by Detective Conan
*   Changes     :   
*/

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/location_map.dart';

class LocationMapService {
  List<LatLng> _points = [];

  List<LatLng> get points => _points;

  LatLng _centerLocation;

  LatLng get centerLocation => _centerLocation;

  Future<void> getMapData() async {
    final branchId = await locator<BranchService>().branch.id;
    print("${AppConstants.MAP_JSON_URL}?branch_id=$branchId}");
    var response;
    try {
      response = await http
          .get("${AppConstants.MAP_JSON_URL}?branch_id=$branchId")
          .timeout(Duration(seconds: 5));
    } catch (e) {
      print(e);
      throw Exception("Error in fetching location map");
    }

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      LocationMap locationMap = LocationMap.fromJson(body);

      if (locationMap.mapBoundaries.isNotEmpty) {
        for (var boundary in locationMap.mapBoundaries) {
          _points.add(
              LatLng(double.parse(boundary.lat), double.parse(boundary.lng)));
        }
      }

      if (locationMap.mapCenter.isNotEmpty) {
        _centerLocation = LatLng(
            double.parse(locationMap.mapCenter[0].lat_center),
            double.parse(locationMap.mapCenter[0].lng_center));
      }
    } else {
      print(response.statusCode);
      throw Exception("Error in fetching location map");
    }
  }
}
