/*
*   Filename    :   pastors_service.dart
*   Purpose     :
*   Created     :   17/09/2019 3:05 PM by Detective Conan
*	 Updated			:   25/09/2019 4:57 PM PM by Detective Conan
*	 Changes			:   Changed the pastor type to carmelite
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/carmelite.dart';
import 'dart:convert';

import '../../models/data_carmelite.dart';

class PastorsService {
  final keyword = "pastors";
  static const String _TYPE_ID = "108";

  Future<List<Carmelite>> getPastors() async {
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    final branchId = await locator<BranchService>().branch.id;
    var response;
//TODO change the implementation. use Dio package
//    try {
//      response = await http
//              .get(
//                  "${AppConstants.PRIESTS_JSON_URL}?branch_id=$_branchId?type_id=$_TYPE_ID")
//              .timeout(Duration(seconds: 5));
//    } catch (e) {
//      print(e);
//      throw Exception("Failure in retrieving priests");
//    }
//
//    if (response.statusCode == 200) {
//      final body = json.decode(response.body);
//      _pastors = DataCarmelite.fromJson(body).data.where((priest) {
//        return priest.typeId == _TYPE_ID;
//      }).toList();
//    } else {
//      throw Exception("Failure in retrieving priests");
//    }
    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.CARMELITES_JSON_URL}contact/?branch_id=$branchId&id=$branchId?type_id=$_TYPE_ID";

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
        throw Exception('PastorsService.getPastors: No connection');
      throw Exception(
          'PastorsService.getPastors:  Error requesting PastorsService: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return DataCarmelite.fromJson(body).data.where((priest) {
          return priest.typeId == _TYPE_ID;
        }).toList();
      } catch (e) {
        print(e);
        throw Exception("PastorsService.getPastors: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "PastorsService.getPastors: statusCode ${response.statusCode}");
    }
  }
}
