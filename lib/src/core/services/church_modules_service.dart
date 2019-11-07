/*
*   Filename    :   church_modules_service.dart
*   Purpose     :
*   Created     :   11/09/2019 1:02 PM by Detective Conan
*	 Updated			:   02/10/2019 9:03 AM PM by Detective Conan
*	 Changes			:   Added timeout on request.
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'dart:convert';

class ChurchModuleService {
  Future<ChurchModule> getChurchModule(ModuleReference moduleReference) async {
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    var subModuleAndFormFields;
    try {
      subModuleAndFormFields = await _getSubModuleAndFormFieldsList(moduleReference);
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception('ChurchModuleService.getChurchModule: No connection');
      throw Exception(e);
    }

    return ChurchModule(
        moduleReference: moduleReference, subModuleAndFormFieldsList: subModuleAndFormFields);
  }

  Future _getSubModuleAndFormFieldsList(ModuleReference moduleReference) async {
    final List<String> subModuleIds =
        moduleReference.subModuleIds?.split(",") ?? [];

    if (subModuleIds.isEmpty)
      throw Exception("No sub module for ${moduleReference?.name}");

    List<SubModuleAndFormFields> subModuleAndFormFields = [];

    for (var id in subModuleIds) {
      try {
        final subModuleId = "$id";
        subModuleAndFormFields.add(await _getSubModuleAndFormFields(subModuleId));
      } catch (e) {
        print("ChurchModulesService._getSubModuleAndFormFieldsList: $e");
      }
    }

    if (subModuleAndFormFields.isEmpty) throw Exception("No SubModule retrieved");

    return subModuleAndFormFields;
  }

  Future<SubModuleAndFormFields> _getSubModuleAndFormFields(String subModuleId) async {
    final keyword = "subModuleAndFormFields";
    final branchId = await locator<BranchService>().branch.id;
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    var response;
    //TODO uncomment when ready
//    final url =
//        "${AppConstants.API_BASE_URL}${AppConstants.SUB_SERVICES_BASE_JSON_URL}sub_module/?branch_id=$branchId&id=$subModuleId";
    //TODO temporary
    final url =
        "${AppConstants.OLD_API_BASE_URL}${AppConstants.SUB_SERVICES_BASE_JSON_URL}sub_module/?branch_id=$branchId&id=$subModuleId";


    var dio = locator<DioService>().getDio();

    try {
      response = await dio
          .get(
            "$url",
            queryParameters: {'k': keyword},
            options: buildCacheOptions(
              Duration(days: AppConstants.CACHE_DURATION),
              forceRefresh: true,
              subKey: "page=${branchId.toString()}_$subModuleId",
            ),
          )
          .timeout(
            Duration(seconds: 5),
          );
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception(
            'ChurchModuleService._getSubModuleAndFormFields: No connection');
      throw Exception(
          'ChurchModuleService._getSubModuleAndFormFields:  Error requesting SubModuleAndFormFields: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return SubModuleAndFormFields.fromJson(body);

      } catch (e) {
        print(e);
        throw Exception("ChurchModuleService._getSubModuleAndFormFields: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "ChurchModuleService._getSubModuleAndFormFields: statusCode ${response.statusCode}");
    }
  }
}
