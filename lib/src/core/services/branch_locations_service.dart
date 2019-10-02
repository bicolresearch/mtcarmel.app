/*
*   Filename    :   branch_locations_service.dart
*   Purpose     :   Use for the requesting the locations.
*   Created     :   19/09/2019 4:45 PM by Detective Conan
*	 Updated			:   02/10/2019 9:04 AM PM by Detective Conan
*	 Changes			:   Added timeout on request.
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/branch_location.dart';

import 'service_locator.dart';

class BranchLocationsService {
  final _keyword = "locations";

  Future<List<BranchLocation>> getData() async {
    List<BranchLocation> branches = [];

    final hasConnection = await ConnectivityChecker.hasDataConnection();

    var response;

    var dio = locator<DioService>().getDio();

    try {
      response = await dio
          .get(
            "${AppConstants.API_BASE_URL}${AppConstants.BRANCH_LOCATIONS_JSON_URL}",
            queryParameters: {'k': _keyword},
            options: buildCacheOptions(
              Duration(days: AppConstants.CACHE_DURATION),
              forceRefresh: true,
            ),
          )
          .timeout(
            Duration(seconds: 5),
          );
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception('BranchLocationsService.getData: No connection');
      throw Exception(
          'BranchLocationsService.getData:  Error requesting BranchLocations: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        branches = DataBranchLocation.fromJson(body).data;
      } catch (e) {
        print(e);
        throw Exception(
            'BranchLocationsService.getData:  Error fetching BranchLocations: $e');
      }
    } else {
      throw Exception(
          'BranchLocationsService.getData: Error fetching BranchLocations: ${response.statusCode}');
    }
    return branches;
  }
}
