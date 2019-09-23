/*
*  Filename    :   module_list_service.dart
*  Purpose     :	
*  Created     :   2019-08-16 14:44 by Detective Conan
*	 Updated			:   23/09/2019 9:26 AM PM by Detective Conan
*	 Changes			:   Added connectivity check
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/church_module.dart';

class ModuleListService {
  List<ModuleReference> _moduleReferences = [];


  Future<void> getJsonData() async {

    final hasConnection = await ConnectivityChecker.hasDataConnection();

    if(!hasConnection)
      throw Exception('ModuleListService.getJsonData: No connection');

    final branchId = locator<BranchService>().branch.id;
    print("${AppConstants.SERVICES_JSON_URL}?branch_id=$branchId");
    var response = await http
        .get("${AppConstants.SERVICES_JSON_URL}?branch_id=$branchId")
        .timeout(Duration(seconds: 3));

    if (response.statusCode == 200) {
      _moduleReferences = (json.decode(response.body) as List)
          .map((data) => ModuleReference.fromJson(data))
          .toList();
    } else {
      _moduleReferences.clear();
      throw Exception("Failure in retrieving modules");
    }
  }

  List<ModuleReference> get moduleReferences => _moduleReferences;

  Future<List<ModuleReference>> getData() async {

    final hasConnection = await ConnectivityChecker.hasDataConnection();

    if(!hasConnection)
      throw Exception('ModuleListService.getData: No connection');

    final branchId = await locator<BranchService>().branch.id;
    var response;

    try {
      response = await http
          .get("${AppConstants.SERVICES_JSON_URL}?branch_id=$branchId")
          .timeout(Duration(seconds: 3));
    } catch (e) {
      print(e);
      throw e;
    }

    if (response.statusCode == 200) {
      try {
        final body = jsonDecode(response.body);
        return ModuleReferenceRoot.fromJson(body).data;
      } catch (e) {
        print("$e");
        throw e;
      }
    } else {
      throw Exception("Failure in retrieving modules");
    }
  }
}
