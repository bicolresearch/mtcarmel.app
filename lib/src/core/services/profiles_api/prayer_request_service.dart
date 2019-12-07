/*
*  Filename    :   prayer_request_service.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:20 by Detective Conan
*	 Updated			:   29/10/2019 9:31 PM PM by Detective Conan
*	 Changes			:   Implemented dio package instead of http
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/constants/module_directories.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/module_model_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';
import 'package:mt_carmel_app/src/models/module_model.dart';
import 'package:mt_carmel_app/src/models/prayer_request.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

enum PrayerRequestsStatus { OnGoing, Approved, Rejected, Deleted, All }

class PrayerRequestService {
  Future<PrayerRequest> getPrayerRequestById(String id) async {
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();
    PrayerRequest _prayerRequest;
    String url =
        "${AppConstants.API_BASE_URL}prayer_requests/prayer_request/?branch_id=$branchId&role_id=$roleId&id=$id";
    await http
        .get(url)
        .then((result) {
          if (result.statusCode == 200) {
            final body = json.decode(result.body);
            print(body);
            _prayerRequest = PrayerRequest.fromJson(body);
          } else {
            print(result.statusCode);
            throw Exception("No prayer request.");
          }
        })
        .timeout(Duration(seconds: 5))
        .catchError((error) => throw error);
    return _prayerRequest;
  }

  Future<ModuleAndDataActions> getModuleAndDataActions() async {
    List<PrayerRequest> _prayerRequests = [];
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();

    DataActionModuleModel _dataActionModuleModel;
    try {
      _dataActionModuleModel = await locator<ModuleModelService>()
          .getDataActionModuleModels(
          ModuleDirectories.PRAYER_REQUEST_DIR.split("/")[0]);
    } catch (e) {
      print(e);
    }

    var client = new http.Client();
    final urlByIdBase =
        "${AppConstants.API_BASE_URL}${ModuleDirectories.PRAYER_REQUEST_DIR}/?branch_id=$branchId&role_id=$roleId&id=";

    try {
      List<ModuleModel> moduleModels = _dataActionModuleModel.data.data;
      for (var moduleModel in moduleModels) {
        final id = moduleModel.id;
        await client.get('$urlByIdBase$id').then((respond) {
          if (respond.statusCode == 200) {
            final body = json.decode(respond.body);
            final prayerRequest = PrayerRequest.fromJson(body);
            _prayerRequests.add(prayerRequest);
          }
        });
      }
    } finally {
      client.close();
    }
    return ModuleAndDataActions(_prayerRequests, _dataActionModuleModel);
  }
}
