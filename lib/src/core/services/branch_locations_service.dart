/*
*   Filename    :   branch_locations_service.dart
*   Purpose     :
*   Created     :   19/09/2019 4:45 PM by Detective Conan
*   Updated     :   19/09/2019 4:45 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/branch_location.dart';

class BranchLocationsService {
  Future<List<BranchLocation>> getData() async {
    List<BranchLocation> branches = [];

    final response = await http.get(
      "${AppConstants.BRANCH_LOCATIONS_JSON_URL}",
    );

    if (response.statusCode == 200) {
      try {
        final body = json.decode(response.body);
        branches = DataBranchLocation.fromJson(body).data;
      } catch (e) {
        print(e);
        throw Exception('Error fetching BranchLocations: $e');
      }
    } else {
      throw Exception('Error fetching BranchLocations: ${response.statusCode}');
    }
    return branches;
  }
}
