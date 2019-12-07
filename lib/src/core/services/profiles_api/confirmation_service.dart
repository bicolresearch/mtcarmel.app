/*
*   Filename    :   confirmation_service.dart
*   Purpose     :
*   Created     :   07/12/2019 3:12 PM by Detective Conan
*   Updated     :   07/12/2019 3:12 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/constants/module_directories.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/module_model_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/models/confirmation.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/module_model.dart';

class ConfirmationService {
  Future<ModuleAndDataActions> getModuleAndDataActions() async {
    List<Confirmation> _confirmations = [];
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();

    DataActionModuleModel _dataActionModuleModel;
    try {
      _dataActionModuleModel = await locator<ModuleModelService>()
          .getDataActionModuleModels(
              ModuleDirectories.CONFIRMATION_DIR.split("/")[0]);
    } catch (e) {
      print(e);
    }

    var client = new http.Client();
    final urlByIdBase =
        "${AppConstants.API_BASE_URL}${ModuleDirectories.CONFIRMATION_DIR}/?branch_id=$branchId&role_id=$roleId&id=";

    try {
      List<ModuleModel> moduleModels = _dataActionModuleModel.data.data;
      for (var moduleModel in moduleModels) {
        final id = moduleModel.id;
        await client.get('$urlByIdBase$id').then((respond) {
          if (respond.statusCode == 200) {
            final body = json.decode(respond.body);
            final crytpLobby = Confirmation.fromJson(body);
            _confirmations.add(crytpLobby);
          }
        });
      }
    } finally {
      client.close();
    }
    return ModuleAndDataActions(_confirmations, _dataActionModuleModel);
  }
}
