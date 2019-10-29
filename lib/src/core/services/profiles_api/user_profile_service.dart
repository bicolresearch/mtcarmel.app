/*
*  Filename    :   user_profile_service.dart
*  Purpose     :
*  Created     :   2019-07-11 16:37 by Detective Conan
*	 Updated			:   29/10/2019 8:57 PM PM by Detective Conan
*	 Changes			:   Implemented with dio package
*/

import 'dart:convert';

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
//import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';

import 'package:mt_carmel_app/src/models/user_profile.dart';

class UserProfileService {
  Future<UserProfile> getUserProfile(String id) async {
    final keyword = "userProfile";
    final hasConnection = await ConnectivityChecker.hasDataConnection();
    final branchId = await locator<BranchService>().branch.id;

    var response;
    var dio = locator<DioService>().getDio();
    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.USER_JSON_URL}?branch_id=$branchId&id=$id";
    try {
      response = await dio
          .get(
            "$url",
            queryParameters: {'k': keyword},
            options: buildCacheOptions(
                Duration(days: AppConstants.CACHE_DURATION),
                forceRefresh: true,
                subKey: "page=$id"),
          )
          .timeout(
            Duration(seconds: 5),
          );
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception('UserProfileService.getData: No connection');
      throw Exception(
          'UserProfileService.getData:  Error requesting UserProfile data: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return UserProfile.fromJson(body);
      } catch (e) {
        print(e);
        throw Exception("UserProfileService.getData: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "UserProfileService.getData: statusCode ${response.statusCode}");
    }
  }
}
