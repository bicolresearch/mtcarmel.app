/*
*   Filename    :   priests_service.dart
*   Purpose     :
*   Created     :   17/09/2019 3:05 PM by Detective Conan
*	 Updated			:   30/09/2019 6:46 PM PM by Detective Conan
*	 Changes			:   Implemented caching of url response
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/data_carmelite.dart';
import 'package:mt_carmel_app/src/models/carmelite.dart';
import 'dart:convert';

class PriestsService {
  final keyword = "priests";
  static const String _TYPE_ID = "107";

  Future<List<Carmelite>> getPriests() async {
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    final branchId = await locator<BranchService>().branch.id;
    var response;

    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.CARMELITES_JSON_URL}contact/?branch_id=$branchId&id=$branchId?type_id=$_TYPE_ID";
print(url);
print("${AppConstants.CARMELITES_JSON_URL}?branch_id=$branchId?type_id=$_TYPE_ID");
    var dio = locator<DioService>().getDio();

    try {
      response = await dio.get("$url",
          queryParameters: {'k': keyword},
          options: buildCacheOptions(
              Duration(days: AppConstants.CACHE_DURATION),
              subKey: "page=$branchId"));
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception('PriestsService.getPriests: No connection');
      throw Exception(
          'PriestsService.getPriests:  Error requesting PriestsService: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return DataCarmelite.fromJson(body).data.where((priest) {
          return priest.typeId == _TYPE_ID;
        }).toList();
      } catch (e) {
        print(e);
        throw Exception("PriestsService.getPriests: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "PriestsService.getPriests: statusCode ${response.statusCode}");
    }
  }
}
