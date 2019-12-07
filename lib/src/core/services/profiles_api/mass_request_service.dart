/*
*  Filename    :   mass_request_service.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:20 by Detective Conan
*  Updated     :   2019-08-20 16:20 by Detective Conan 
*  Changes     :
*/

import 'dart:io';

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/constants/module_directories.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/module_model_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';
import 'package:mt_carmel_app/src/models/mass_request.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/models/module_model.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/screens/profile_screens/module_model_reference.dart';

class MassRequestService {
  Future<MassRequest> getMassRequest(String id) async {
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();
    MassRequest _massRequest;
    String url =
        "${AppConstants.API_BASE_URL}${ModuleDirectories.MASS_REQUEST_DIR}/?branch_id=$branchId&role_id=$roleId&id=$id";
    await http
        .get(url)
        .then((result) {
          if (result.statusCode == 200) {
            final body = json.decode(result.body);
            print(body);
            _massRequest = MassRequest.fromJson(body);
          } else {
            print(result.statusCode);
          }
        })
        .timeout(Duration(seconds: 5))
        .catchError((error) => throw error);
    return _massRequest;
  }

  Future<ModuleAndDataActions> getMassRequests() async {
    List<MassRequest> _massRequests = [];
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();

    DataActionModuleModel _dataActionModuleModel;
    try {
      _dataActionModuleModel = await locator<ModuleModelService>()
          .getDataActionModuleModels(
              ModuleDirectories.MASS_REQUEST_DIR.split("/")[0]);
    } catch (e) {
      print(e);
    }

    var client = new http.Client();
    final urlByIdBase =
        "${AppConstants.API_BASE_URL}${ModuleDirectories.MASS_REQUEST_DIR}/?branch_id=$branchId&role_id=$roleId&id=";

    try {
      List<ModuleModel> moduleModels = _dataActionModuleModel.data.data;
      for (var moduleModel in moduleModels) {
        final id = moduleModel.id;
        await client.get('$urlByIdBase$id').then((respond) {
          if (respond.statusCode == 200) {
            final body = json.decode(respond.body);
            final massRequest = MassRequest.fromJson(body);
            _massRequests.add(massRequest);
          }
        });
      }
    } finally {
      client.close();
    }
    return ModuleAndDataActions(_massRequests, _dataActionModuleModel);
  }
}
