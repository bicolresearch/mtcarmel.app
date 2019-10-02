/*
*   Filename    :   location_map_service.dart
*   Purpose     :
*   Created     :   17/09/2019 6:10 PM by Detective Conan
*	 Updated			:   02/10/2019 9:04 AM PM by Detective Conan
*	 Changes			:   Added timeout on request.
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/location_map.dart';

class LocationMapService {
  List<LatLng> _points = [];

  List<LatLng> get points => _points;

  LatLng _centerLocation;

  LatLng get centerLocation => _centerLocation;

  Future<void> getMapData() async {
    final keyword = "locationMap";
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    final branchId = await locator<BranchService>().branch.id;
    var response;

    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.MAP_JSON_URL}?branch_id=$branchId";

    var dio = locator<DioService>().getDio();

    try {
      response = await dio
          .get(
            "$url",
            queryParameters: {'k': keyword},
            options: buildCacheOptions(
                Duration(days: AppConstants.CACHE_DURATION),
                forceRefresh: true,
                subKey: "page=$branchId"),
          )
          .timeout(
            Duration(seconds: 5),
          );
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception('LocationMapService.getJsonData: No connection');
      throw Exception(
          'LocationMapService.getData:  Error requesting Modules: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        LocationMap locationMap = LocationMap.fromJson(body);

        if (locationMap.mapBoundaries.isNotEmpty) {
          for (var boundary in locationMap.mapBoundaries) {
            _points.add(
                LatLng(double.parse(boundary.lat), double.parse(boundary.lng)));
          }

          if (locationMap.mapCenter.isNotEmpty) {
            _centerLocation = LatLng(
                double.parse(locationMap.mapCenter[0].lat_center),
                double.parse(locationMap.mapCenter[0].lng_center));
          }
        }
      } catch (e) {
        print(e);
        throw Exception("LocationMapService.getJsonData: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "LocationMapService.getData: statusCode ${response.statusCode}");
    }
  }
}
