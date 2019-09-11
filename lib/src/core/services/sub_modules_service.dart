/*
*   Filename    :   sub_modules_service.dart
*   Purpose     :
*   Created     :   11/09/2019 1:02 PM by Detective Conan
*   Updated     :   11/09/2019 1:02 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SubModuleService {

  Future<ChurchModule> getChurchModule(ModuleReference moduleReference) async {
    var churchSubModules;
    try {
      churchSubModules= await _getSubModules(moduleReference);
    } catch (e) {
      print(e);
      throw Exception(e);
    }

    return ChurchModule(
        moduleReference: moduleReference,
        churchSubModules: churchSubModules);
  }

  Future _getSubModules(ModuleReference moduleReference) async {
    final List<String> subModules =
    moduleReference.subModules?.split(",");

    if (subModules.isEmpty)
      throw Exception(
          "No sub module for ${moduleReference.name}");

    List<ChurchSubModule> churchSubmodules = [];

    for (var api in subModules) {
      try {
        SubModuleAndFormFields subModuleAndFormFields =
        await _getSubModuleAndFormFields(api);
        churchSubmodules.add(_getChurchSubModule(subModuleAndFormFields, api));
      } catch (e) {
        print("ModuleScreen._getSubModules: $e");
      }
    }

    if (churchSubmodules.isEmpty)
      throw Exception("No SubModule retrieved");

    return churchSubmodules;
  }

  ChurchSubModule _getChurchSubModule(
      SubModuleAndFormFields subModuleAndFormFields, String urlApi) {
    return ChurchSubModule(
        name: subModuleAndFormFields.subModule.name,
        formFields: subModuleAndFormFields.formFields,
        acceptanceContent: subModuleAndFormFields.subModule.acceptanceContent,
        thankYouContent: subModuleAndFormFields.subModule.thankYouContent,
        url: subModuleAndFormFields.subModule.url);
  }

  Future<SubModuleAndFormFields> _getSubModuleAndFormFields(
      String subModuleUrl) async {
    final branchId = locator<BranchService>().branchId;
    final response = await http.get("$subModuleUrl/?branch_id=$branchId");

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return SubModuleAndFormFields.fromJson(body);
    } else {
      throw Exception("Error in SubModlueAndFormFields data gathering.");
    }
  }
}