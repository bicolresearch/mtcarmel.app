/*
*   Filename    :   church_modules_service.dart
*   Purpose     :
*   Created     :   11/09/2019 1:02 PM by Detective Conan
*	 Updated			:   30/09/2019 3:48 PM PM by Detective Conan
*	 Changes			:   Implemented caching of url response
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

    if (!hasConnection)
      throw Exception('ChurchModuleService.getChurchModule: No connection');

    var churchSubModules;
    try {
      churchSubModules = await _getSubModules(moduleReference);
    } catch (e) {
      print(e);
      throw Exception(e);
    }

    return ChurchModule(
        moduleReference: moduleReference, churchSubModules: churchSubModules);
  }

  Future _getSubModules(ModuleReference moduleReference) async {
    final List<String> subModuleIds =
        moduleReference.subModuleIds?.split(",") ?? [];

    if (subModuleIds.isEmpty)
      throw Exception("No sub module for ${moduleReference?.name}");

    List<ChurchSubModule> churchSubmodules = [];

    for (var id in subModuleIds) {
      try {
        final subModuleId = "$id";
//        SubModuleAndFormFields subModuleAndFormFields =
//        await _getSubModuleAndFormFields(subModuleId);
        churchSubmodules.add(await _getChurchSubModule(subModuleId));
      } catch (e) {
        print("ChurchModulesService._getSubModules: $e");
      }
    }

    if (churchSubmodules.isEmpty) throw Exception("No SubModule retrieved");

    return churchSubmodules;
  }

//  Future _getSubModules(ModuleReference moduleReference) async {
//    final List<String> subModuleIds =
//        moduleReference.subModuleIds?.split(",") ?? [];
//
//    if (subModuleIds.isEmpty)
//      throw Exception("No sub module for ${moduleReference?.name}");
//
//    List<ChurchSubModule> churchSubmodules = [];
//
//    for (var id in subModuleIds) {
//      try {
//        final subModuleId = "$id";
//        SubModuleAndFormFields subModuleAndFormFields =
//            await _getSubModuleAndFormFields(subModuleId);
//        churchSubmodules.add(_getChurchSubModule(subModuleAndFormFields));
//      } catch (e) {
//        print("ChurchModulesService._getSubModules: $e");
//      }
//    }
//
//    if (churchSubmodules.isEmpty) throw Exception("No SubModule retrieved");
//
//    return churchSubmodules;
//  }

  Future<ChurchSubModule> _getChurchSubModule(String subModuleId) async {
    final keyword = "subModule";
    final branchId = await locator<BranchService>().branch.id;
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    var response;
    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.SUB_SERVICES_BASE_JSON_URL}sub_module/?branch_id=$branchId&id=$subModuleId";

    var dio = locator<DioService>().getDio();

    try {
      response = await dio.get("$url",
          queryParameters: {'k': keyword},
          options: buildCacheOptions(Duration(days: 7),
              subKey: "page=${branchId.toString()}_$subModuleId"));
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception(
            'ChurchModuleService._getChurchSubModule: No connection');
      throw Exception(
          'ChurchModuleService._getChurchSubModule:  Error requesting ChurchModuleService: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return ChurchSubModule.fromJson(body);
      } catch (e) {
        print(e);
        throw Exception("ChurchModuleService._getChurchSubModule: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "ChurchModuleService._getChurchSubModule: statusCode ${response.statusCode}");
    }
  }

//TODO
//  Future<SubModuleAndFormFields> _getSubModuleAndFormFields(
//      String subModuleId) async {
//    final branchId = await locator<BranchService>().branch.id;
//    final response = await http.get(
//        "${AppConstants.SUB_SERVICES_BASE_JSON_URL}sub_module/?branch_id=$branchId&id=$subModuleId");
//    if (response.statusCode == 200) {
//      print(response.body);
//      final body = json.decode("$response");
//      print(body);
//      return SubModuleAndFormFields.fromJson(body);
//    } else {
//      throw Exception("Error in SubModlueAndFormFields data gathering.");
//    }
//    if (response.statusCode == 200) {
//      return (json.decode(response.body) as List)
//          .map((data) => SubModuleAndFormFields.fromJson(data))
//          .toList()
//          .firstWhere((value) => value.subModule.id == subModuleId);
//    } else {
//      throw Exception('Failed to load');
//    }
//  }
}
