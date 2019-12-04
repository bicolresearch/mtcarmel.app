/*
*   Filename    :   individual_baptism_service.dart
*   Purpose     :
*   Created     :   28/11/2019 1:53 PM by Detective Conan
*   Updated     :   28/11/2019 1:53 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/individual_baptism.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
}
