/*
*  Filename    :   module_list_service.dart
*  Purpose     :	
*  Created     :   2019-08-16 14:44 by Detective Conan
*	 Updated			:   10/09/2019 11:20 AM PM by Detective Conan
*	 Changes			:   Added branch id retrieval
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/church_module.dart';

class ModuleListService {
  List<ModuleReference> _moduleReferences = [];
  final _branchId = locator<BranchService>().branch.id;

  Future<void> getJsonData() async {
    print("${AppConstants.SERVICES_JSON_URL}?branch_id=$_branchId");
    var response = await http
        .get("${AppConstants.SERVICES_JSON_URL}?branch_id=$_branchId")
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
    var response;

    try {
      response = await http
          .get("${AppConstants.SERVICES_JSON_URL}?branch_id=$_branchId")
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
