/*
*   Filename    :   liturgical_service.dart
*   Purpose     :
*   Created     :   28/11/2019 1:47 PM by Detective Conan
*   Updated     :   28/11/2019 1:47 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/constants/module_directories.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/module_model_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/liturgical.dart';
import 'package:mt_carmel_app/src/models/module_model.dart';

class LiturgicalService {
  Future<List<Liturgical>> getLiturgicalList() async {
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();
    final userId = await locator<AuthenticationService>().getUserId();
    List<Liturgical> _liturgicalList = [];
    String url =
        "${AppConstants.API_BASE_URL}liturgicals/?branch_id=$branchId&role_id=$roleId&user_id=$userId";

    await http
        .get(url)
        .then((result) {
          if (result.statusCode == 200) {
            final body = json.decode(result.body);
            print(body);
            _liturgicalList = DataActionLiturgical.fromJson(body).data.data;
          } else {
            print(result.statusCode);
          }
        })
        .timeout(Duration(seconds: 5))
        .catchError((error) => throw error);
    return _liturgicalList;
  }

  Future<ModuleAndDataActions> getModuleAndDataActions() async {
    List<Liturgical> _liturgicals = [];
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();

    DataActionModuleModel _dataActionModuleModel;
    try {
      _dataActionModuleModel = await locator<ModuleModelService>()
          .getDataActionModuleModels(
              ModuleDirectories.LITURGICAL_DIR.split("/")[0]);
    } catch (e) {
      print(e);
    }

    var client = new http.Client();
    final urlByIdBase =
        "${AppConstants.API_BASE_URL}${ModuleDirectories.LITURGICAL_DIR}/?branch_id=$branchId&role_id=$roleId&id=";

    try {
      List<ModuleModel> moduleModels = _dataActionModuleModel.data.data;
      for (var moduleModel in moduleModels) {
        final id = moduleModel.id;
        await client.get('$urlByIdBase$id').then((respond) {
          if (respond.statusCode == 200) {
            final body = json.decode(respond.body);
            final liturgical = Liturgical.fromJson(body);
            _liturgicals.add(liturgical);
          }
        });
      }
    } finally {
      client.close();
    }
    return ModuleAndDataActions(_liturgicals, _dataActionModuleModel);
  }
}
