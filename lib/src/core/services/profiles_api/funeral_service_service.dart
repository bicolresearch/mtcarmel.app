/*
*   Filename    :   funeral_service_service.dart
*   Purpose     :
*   Created     :   28/11/2019 1:57 PM by Detective Conan
*   Updated     :   28/11/2019 1:57 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/constants/module_directories.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/module_model_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';
import 'package:mt_carmel_app/src/models/funeral_service.dart';
import 'package:mt_carmel_app/src/models/module_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FuneralServiceService {
  Future<ModuleAndDataActions> getModuleAndDataActions() async {
    List<FuneralService> _funeralServices = [];
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();

    DataActionModuleModel _dataActionModuleModel;
    try {
      _dataActionModuleModel = await locator<ModuleModelService>()
          .getDataActionModuleModels(
              ModuleDirectories.FUNERAL_SERVICE_DIR.split("/")[0]);
    } catch (e) {
      print(e);
    }

    var client = new http.Client();
    final urlByIdBase =
        "${AppConstants.API_BASE_URL}${ModuleDirectories.FUNERAL_SERVICE_DIR}/?branch_id=$branchId&role_id=$roleId&id=";

    try {
      List<ModuleModel> moduleModels = _dataActionModuleModel.data.data;
      for (var moduleModel in moduleModels) {
        final id = moduleModel.id;
        await client.get('$urlByIdBase$id').then((respond) {
          if (respond.statusCode == 200) {
            final body = json.decode(respond.body);
            final funeralService = FuneralService.fromJson(body);
            _funeralServices.add(funeralService);
          }
        });
      }
    } finally {
      client.close();
    }
    return ModuleAndDataActions(_funeralServices, _dataActionModuleModel);
  }
}
