/*
*   Filename    :   profile_feature_service.dart
*   Purpose     :
*   Created     :   08/10/2019 5:38 PM by Detective Conan
*   Updated     :   08/10/2019 5:38 PM by Detective Conan
*   Changes     :   
*/

import 'dart:convert';

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/profile_feature.dart';

class ProfileFeatureService {
  Future<List<ProfileFeature>> getData() async {
    final _keyword = "profileFeature";
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    List<ProfileFeature> _profileFeatures = [];
    final branchId = await locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();

    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.PROFILE_FEATURE_JSON_URL}?branch_id=$branchId&role_id=$roleId";
    print("profile feature url $url");
    var dio = locator<DioService>().getDio();

    var response;

    try {
      response = await dio
          .get(
            "$url",
            queryParameters: {'k': _keyword},
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
        throw Exception('ProfileService.getData: No connection');
      throw Exception(
          'ProfileService.getData:  Error requesting ProfileService: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        _profileFeatures = ProfileFeatureData.fromJson(body).data;
      } catch (e) {
        print(e);
        throw Exception("ProfileService.getData: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "ProfileService.getData: statusCode ${response.statusCode}");
    }

    return _profileFeatures;
  }
}
