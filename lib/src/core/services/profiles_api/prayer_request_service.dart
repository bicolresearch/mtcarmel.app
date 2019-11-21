/*
*  Filename    :   prayer_request_service.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:20 by Detective Conan
*	 Updated			:   29/10/2019 9:31 PM PM by Detective Conan
*	 Changes			:   Implemented dio package instead of http
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/data_prayer_request.dart';
import 'package:mt_carmel_app/src/models/prayer_request.dart';
import 'dart:convert';

enum PrayerRequestsStatus { OnGoing, Approved, Rejected, Deleted, All }

class PrayerRequestService {
  //TODO implement request per priest and admin account
  Future<DataActionPrayerRequest> getPrayerRequests() async {
    final keyword = "prayerRequests";
    final hasConnection = await ConnectivityChecker.hasDataConnection();
    final branchId = await locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();
    final userId = await locator<AuthenticationService>().getUserId();

    var response;
    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.PRAYER_REQUEST_JSON_URL}?branch_id=$branchId&role_id=$roleId&user_id=$userId";

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
        throw Exception('PrayerRequestService.getData: No connection');
      throw Exception(
          'PrayerRequestService.getData:  Error requesting UserProfile data: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return DataActionPrayerRequest.fromJson(body);
      } catch (e) {
        print(e);
        throw Exception("PrayerRequestService.getData: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "PrayerRequestService.getData: statusCode ${response.statusCode}");
    }
  }
}
