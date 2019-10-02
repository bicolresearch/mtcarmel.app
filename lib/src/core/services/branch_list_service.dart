/*
*   Filename    :   branch_list_service.dart
*   Purpose     :   For requesting branches
*   Created     :   16/09/2019 10:52 AM by Detective Conan
*	 Updated			:   02/10/2019 9:03 AM PM by Detective Conan
*	 Changes			:   Added timeout on request.
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/branch.dart';
import 'dart:convert';

import 'service_locator.dart';

class BranchListService {
  Future<List<Branch>> getLocations(String locationId) async {
    List<Branch> _branches = [];
    final _keyword = "branches";

    final hasConnection = await ConnectivityChecker.hasDataConnection();
    var dio = locator<DioService>().getDio();

    var response;
    try {
      response = await dio
          .get(
            "${AppConstants.API_BASE_URL}${AppConstants.BRANCHES_JSON_URL}branch_location/?location_id=$locationId",
            queryParameters: {'k': _keyword},
            options: buildCacheOptions(
                Duration(days: AppConstants.CACHE_DURATION),
                forceRefresh: true,
                subKey: "page=$locationId"),
          )
          .timeout(
            Duration(seconds: 5),
          );
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception('BranchListService.getData: No connection');
      throw Exception(
          'BranchListService.getData:  Error requesting BranchLists: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        _branches = DataBranch.fromJson(body).data;
      } catch (e) {
        print(e);
        throw 'BranchListService.getData:  Error requesting BranchLists: $e';
      }
    } else {
      throw Exception('Failed to load');
    }
    return _branches;
  }
}
