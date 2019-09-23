/*
*   Filename    :   branch_locations_service.dart
*   Purpose     :
*   Created     :   19/09/2019 4:45 PM by Detective Conan
*	 Updated			:   23/09/2019 9:27 AM PM by Detective Conan
*	 Changes			:   Added connectivity check
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/branch_location.dart';

class BranchLocationsService {
  Future<List<BranchLocation>> getData() async {
    List<BranchLocation> branches = [];

    final hasConnection = await ConnectivityChecker.hasDataConnection();

    if(!hasConnection)
      throw Exception('BranchLocationsService.getData: No connection');

    var response;
    try {
      response = await http.get(
            "${AppConstants.BRANCH_LOCATIONS_JSON_URL}",
          );
    } catch (e) {
      print(e);
      throw Exception('BranchLocationsService.getData: Error fetching BranchLocations: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode(response.body);
        branches = DataBranchLocation.fromJson(body).data;
      } catch (e) {
        print(e);
        throw Exception('BranchLocationsService.getData:  Error fetching BranchLocations: $e');
      }
    } else {
      throw Exception('BranchLocationsService.getData: Error fetching BranchLocations: ${response.statusCode}');
    }
    return branches;
  }
}
