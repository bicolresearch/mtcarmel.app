/*
*   Filename    :   branch_list_service.dart
*   Purpose     :
*   Created     :   16/09/2019 10:52 AM by Detective Conan
*	 Updated			:   23/09/2019 9:27 AM PM by Detective Conan
*	 Changes			:   Added connectivity check
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/branch.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/branch_location.dart';

class BranchListService {
  Future<List<Branch>> getLocations(String locationId) async {
    List<Branch> _branches = [];

    final hasConnection = await ConnectivityChecker.hasDataConnection();

    if(!hasConnection)
      throw Exception('BranchListService.getLocations: No connection');

    print(
      "${AppConstants.BRANCHES_JSON_URL}branch_location/?location_id=$locationId",
    );

    final response = await http.get(
      "${AppConstants.BRANCHES_JSON_URL}branch_location/?location_id=$locationId",
    );

    if (response.statusCode == 200) {
      try {
        final body = json.decode(response.body);
        _branches = DataBranch.fromJson(body).data;
      } catch (e) {
        print(e);
        throw e;
      }
    } else {
      throw Exception('Failed to load');
    }
    return _branches;
  }
}
