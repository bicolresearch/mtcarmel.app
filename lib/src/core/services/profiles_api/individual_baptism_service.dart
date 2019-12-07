/*
*   Filename    :   individual_baptism_service.dart
*   Purpose     :
*   Created     :   28/11/2019 1:53 PM by Detective Conan
*   Updated     :   28/11/2019 1:53 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/constants/module_directories.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/module_model_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';
import 'package:mt_carmel_app/src/models/individual_baptism.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/module_model.dart';

class IndividualBaptismService {
  Future<List<IndividualBaptism>> getIndividualBaptismList() async {
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();
    final userId = await locator<AuthenticationService>().getUserId();
    List<IndividualBaptism> _individualBaptismList = [];
    String url =
        "${AppConstants.API_BASE_URL}individuals/?branch_id=$branchId&role_id=$roleId&user_id=$userId";
    print("...... $url");
    await http
        .get(url)
        .then((result) {
          if (result.statusCode == 200) {
            final body = json.decode(result.body);
            print(body);
            _individualBaptismList =
                DataActionIndividualBaptism.fromJson(body).data.data;
          } else {
            print(result.statusCode);
          }
        })
        .timeout(Duration(seconds: 5))
        .catchError((error) => throw error);
    return _individualBaptismList;
  }

  Future<ModuleAndDataActions> getModuleAndDataActions() async {
    List<IndividualBaptism> _individualBaptisms = [];
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();

    DataActionModuleModel _dataActionModuleModel;
    try {
      _dataActionModuleModel = await locator<ModuleModelService>()
          .getDataActionModuleModels(
              ModuleDirectories.INDIVIDUAL_BAPTISM_DIR.split("/")[0]);
    } catch (e) {
      print(e);
    }

    var client = new http.Client();
    final urlByIdBase =
        "${AppConstants.API_BASE_URL}${ModuleDirectories.INDIVIDUAL_BAPTISM_DIR}/?branch_id=$branchId&role_id=$roleId&id=";

    try {
      List<ModuleModel> moduleModels = _dataActionModuleModel.data.data;
      for (var moduleModel in moduleModels) {
        final id = moduleModel.id;
        await client.get('$urlByIdBase$id').then((respond) {
          if (respond.statusCode == 200) {
            final body = json.decode(respond.body);
            final individualBaptism = IndividualBaptism.fromJson(body);
            _individualBaptisms.add(individualBaptism);
          }
        });
      }
    } finally {
      client.close();
    }
    return ModuleAndDataActions(_individualBaptisms, _dataActionModuleModel);
  }
}
