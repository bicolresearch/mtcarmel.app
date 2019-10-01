/*
*   Filename    :   branch_service.dart
*   Purpose     :   For the requesting branch
*   Created     :   09/09/2019 9:36 AM by Detective Conan
*	 Updated			:   01/10/2019 12:15 PM PM by Detective Conan
*	 Changes			:   Refresh the response when success on responses
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/branch.dart';
import 'dart:convert';

import 'service_locator.dart';

class BranchService {
  final _keyword = "branch";
  Branch _branch;

  Branch get branch => _branch;

  void clearBranch() => _branch = null;

  Future<Branch> getBranch(String branchId) async {
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    if (_branch != null) return _branch;

    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.BRANCHES_JSON_URL}branch/?id=$branchId";

    var dio = locator<DioService>().getDio();

    var response;
    try {
      response = await dio.get("$url",
          queryParameters: {'k': _keyword},
          options: buildCacheOptions(
              Duration(days: AppConstants.CACHE_DURATION),
              forceRefresh: true,
              subKey: "page=$branchId"));
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception('BranchService.getBranch: No connection');
      throw Exception('BranchService.getBranch:  Error requesting Branch: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        _branch = Branch.fromJson(body);
      } catch (e) {
        print(e);
        throw e;
      }
    } else {
      throw Exception('Failed to load');
    }

    return _branch;
  }
}
