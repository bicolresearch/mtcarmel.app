/*
*   Filename    :   contact_detail_service.dart
*   Purpose     :
*   Created     :   18/09/2019 11:31 AM by Detective Conan
*	 Updated			:   30/09/2019 5:05 PM PM by Detective Conan
*	 Changes			:   Implemented caching of url response
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/contact.dart';

class ContactDetailService {
  Future<ContactData> getData() async {
    final keyword = "contactDetails";
    final hasConnection = await ConnectivityChecker.hasDataConnection();
    final branchId = await locator<BranchService>().branch.id;

    var response;

    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.CONTACT_DETAILS_JSON_URL}contact/?branch_id=$branchId&id=$branchId";

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
        throw Exception('ContactDetailService.getData: No connection');
      throw Exception(
          'ContactDetailService.getData:  Error requesting Contactdetails: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return ContactData.fromJson(body);
      } catch (e) {
        print(e);
        throw Exception("ContactDetailService.getData: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "ContactDetailService.getData: statusCode ${response.statusCode}");
    }
  }
}
