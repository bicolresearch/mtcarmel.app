/*
*   Filename    :   send_help_service.dart
*   Purpose     :   For requesting url response
*   Created     :   12/09/2019 12:46 PM by Detective Conan
*	 Updated			:   30/09/2019 2:31 PM PM by Detective Conan
*	 Changes			:   Implemented the caching of url response
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/send_help.dart';

import 'branch_service.dart';
import 'dart:convert';

class SendHelpService {
  final _keyword = "sendHelp";

  Future<List<SendHelpData>> getData() async {
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    final branchId = await locator<BranchService>().branch.id;
    var response;

    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.SEND_HELP_JSON_URL}?branch_id=$branchId";

    var dio = locator<DioService>().getDio();

    try {
      response = await dio.get("$url",
          queryParameters: {'k': _keyword},
          options:
              buildCacheOptions(Duration(days: AppConstants.CACHE_DURATION), subKey: "page=$branchId"));
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception('SendHelpService.getData: No connection');
      throw Exception(
          'SendHelpService.getData:  Error requesting SendHelp: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return SendHelp.fromJson(body).data;
      } catch (e) {
        print(e);
        throw Exception("SendHelpService.getData: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "SendHelpService.getData: statusCode ${response.statusCode}");
    }
  }
}
