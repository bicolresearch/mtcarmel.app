/*
*  Filename    :   module_list_service.dart
*  Purpose     :	  Requesting of url response
*  Created     :   2019-08-16 14:44 by Detective Conan
*	 Updated			:   30/09/2019 2:41 PM PM by Detective Conan
*	 Changes			:   Implemented caching og url response
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
//import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/church_module.dart';

class ModuleListService {
  List<ModuleReference> _moduleReferences = [];

  List<ModuleReference> get moduleReferences => _moduleReferences;

  Future<List<ModuleReference>> getData() async {
    final keyword = "module";
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    final branchId = await locator<BranchService>().branch.id;
    var response;

    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.SERVICES_JSON_URL}?branch_id=$branchId";

    var dio = locator<DioService>().getDio();

    try {
      response = await dio.get("$url",
          queryParameters: {'k': keyword},
          options:
              buildCacheOptions(Duration(days: AppConstants.CACHE_DURATION), subKey: "page=$branchId"));
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception('ModuleListService.getJsonData: No connection');
      throw Exception(
          'ModuleListService.getData:  Error requesting Modules: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return ModuleReferenceRoot.fromJson(body).data;
      } catch (e) {
        print(e);
        throw Exception("ModuleListService.getJsonData: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "ModuleListService.getData: statusCode ${response.statusCode}");
    }
  }
}
