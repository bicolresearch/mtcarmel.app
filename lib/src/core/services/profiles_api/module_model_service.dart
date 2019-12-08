/*
*   Filename    :   module_model_service.dart
*   Purpose     :
*   Created     :   05/12/2019 9:50 AM by Detective Conan
*   Updated     :   05/12/2019 9:50 AM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/module_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ModuleModelService {
  Future<DataActionModuleModel> getDataActionModuleModels(
      String moduleDir) async {
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();
    final userId = await locator<AuthenticationService>().getUserId();
    var _dataActionModuleModel;
    String url =
        "${AppConstants.API_BASE_URL}$moduleDir/?branch_id=$branchId&role_id=$roleId&user_id=$userId";

    await http
        .get(url)
        .then((result) {
          if (result.statusCode == 200) {
            final body = json.decode(result.body);
            print(body);
            _dataActionModuleModel = DataActionModuleModel.fromJson(body);
          } else {
            print(result.statusCode);
          }
        })
        .timeout(Duration(seconds: 5))
        .catchError((error) => throw error);
    return _dataActionModuleModel;
  }
}
