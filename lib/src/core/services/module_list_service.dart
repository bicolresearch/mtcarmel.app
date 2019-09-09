/*
*  Filename    :   module_list_service.dart
*  Purpose     :	
*  Created     :   2019-08-16 14:44 by Detective Conan
*  Updated     :   2019-08-16 14:44 by Detective Conan 
*  Changes     :
*/


import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/church_module.dart';


class ModuleListService {

  List<ModuleReference> _moduleReferences = [];
  final _branchId = locator<BranchService>().branchId;
  Future<void> getJsonData() async {
    var response = await http
    // TODO remove when final api is ready
    .get("${AppConstants.SERVICES_JSON_URL}")
    // TODO uncomment when final api is ready
//        .get("${AppConstants.SERVICES_JSON_URL}/branch_id=$_branchId")
        .timeout(Duration(seconds: 3));

    if (response.statusCode == 200) {
      _moduleReferences = (json.decode(response.body) as List)
          .map((data) => ModuleReference.fromJson(data))
          .toList();
    } else {
      throw Exception("Failure in retrieving modules");
    }
  }

  List<ModuleReference> get moduleReferences => _moduleReferences;

}