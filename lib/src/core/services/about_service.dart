/*
*   Filename    :   about_service.dart
*   Purpose     :
*   Created     :   18/09/2019 9:58 AM by Detective Conan
*	 Updated			:   02/10/2019 9:04 AM PM by Detective Conan
*	 Changes			:   Added timeout on request.
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/about.dart';
import 'dart:convert';

class AboutService {
  Future<About> getData() async {
    final keyword = "about";
    final hasConnection = await ConnectivityChecker.hasDataConnection();
    final branchId = await locator<BranchService>().branch.id;
    var response;

    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.ABOUT_JSON_URL}history/?branch_id=$branchId&id=$branchId";

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
        throw Exception('ModuleListService.getData: No connection');
      throw Exception(
          'ModuleListService.getData:  Error requesting About data: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return About.fromJson(body);
      } catch (e) {
        print(e);
        throw Exception("ModuleListService.getData: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "ModuleListService.getData: statusCode ${response.statusCode}");
    }
  }
}
