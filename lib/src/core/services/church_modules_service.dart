/*
*   Filename    :   church_modules_service.dart
*   Purpose     :
*   Created     :   11/09/2019 1:02 PM by Detective Conan
*   Updated     :   11/09/2019 1:02 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChurchModuleService {
  Future<ChurchModule> getChurchModule(ModuleReference moduleReference) async {
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
    final branchId = locator<BranchService>().branch.id;
    final response = await http
        .get("${AppConstants.SUB_SERVICES_BASE_JSON_URL}sub_module/?branch_id=$branchId&id=$subModuleId");
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return ChurchSubModule.fromJson(body);
    } else {
      throw Exception("Error in SubModlueAndFormFields data gathering.");
    }
//    return ChurchSubModule(
//        name: subModuleAndFormFields.subModule?.name,
//        formFields: subModuleAndFormFields.formFields,
//        acceptanceContent: subModuleAndFormFields.subModule.acceptanceContent,
//        thankYouContent: subModuleAndFormFields.subModule.thankYouContent,
//        url: subModuleAndFormFields.subModule.url);
  }

//TODO
  Future<SubModuleAndFormFields> _getSubModuleAndFormFields(
      String subModuleId) async {
    final branchId = locator<BranchService>().branch.id;
    final response = await http
        .get("${AppConstants.SUB_SERVICES_BASE_JSON_URL}sub_module/?branch_id=$branchId&id=$subModuleId");
    if (response.statusCode == 200) {
      print(response.body);
      final body = json.decode(response.body);
      print(body);
      return SubModuleAndFormFields.fromJson(body);
    } else {
      throw Exception("Error in SubModlueAndFormFields data gathering.");
    }
//    if (response.statusCode == 200) {
//      return (json.decode(response.body) as List)
//          .map((data) => SubModuleAndFormFields.fromJson(data))
//          .toList()
//          .firstWhere((value) => value.subModule.id == subModuleId);
//    } else {
//      throw Exception('Failed to load');
//    }
  }
}
