/*
*  Filename    :   mass_request_service.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:20 by Detective Conan
*  Updated     :   2019-08-20 16:20 by Detective Conan 
*  Changes     :
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/data_mass_request.dart';
import 'package:mt_carmel_app/src/models/mass_request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MassRequestService {
  Future<List<MassRequest>> getMassRequests() async {
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();
    final userId = await locator<AuthenticationService>().getUserId();
    List<MassRequest> _massRequests = [];
    String url =
        "${AppConstants.API_BASE_URL}mass_requests/?branch_id=$branchId&role_id=$roleId&user_id=$userId";
    print("..,,..,,");
    print(url);
    await http
        .get(url)
        .then((result) {
          if (result.statusCode == 200) {
            final body = json.decode(result.body);
            _massRequests = DataMassRequest.fromJson(body).data;
          } else {
            print(result.statusCode);
          }
        })
        .timeout(Duration(seconds: 5))
        .catchError((error) => throw error);
    return _massRequests;
  }
}
