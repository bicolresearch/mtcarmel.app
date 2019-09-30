/*
*  Filename    :   church_regular_schedule_service.dart
*  Purpose     :	
*  Created     :   2019-08-30 14:16 by Detective Conan
*	 Updated			:   30/09/2019 6:23 PM PM by Detective Conan
*	 Changes			:   Implemented caching of url response
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/data_schedule.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/schedule.dart';

class ChurchRegularScheduleService {

  List<Schedule> _churchRegularSchedules = [];

  List<Schedule> get churchRegularSchedules => _churchRegularSchedules;

  Future<List<Schedule>> getData() async {
    final keyword = "regularSchedule";

    final hasConnection = await ConnectivityChecker.hasDataConnection();

    final branchId = await locator<BranchService>().branch.id;
//    var response = await http
//        .get("${AppConstants.CHURCH_SCHEDULE_JSON_URL}?branch_id=$_branchId")
//        .timeout(Duration(seconds: 5));
//
//    if (response.statusCode == 200) {
//      final body = json.decode(response.body);
//      _churchRegularSchedules = DataSchedule.fromJson(body).data;
//    } else {
//      throw Exception("Failure in retrieving schedules");
//    }
//    return _churchRegularSchedules;

    var response;

    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.CHURCH_SCHEDULE_JSON_URL}contact/?branch_id=$branchId";

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
        throw Exception('ChurchRegularScheduleService.getData: No connection');
      throw Exception(
          'ChurchRegularScheduleService.getData:  Error requesting ChurchRegularScheduleService: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return DataSchedule.fromJson(body).data;
      } catch (e) {
        print(e);
        throw Exception("ChurchRegularScheduleService.getData: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "ChurchRegularScheduleService.getData: statusCode ${response.statusCode}");
    }
  }
}
