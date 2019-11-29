/*
*   Filename    :   liturgical_service.dart
*   Purpose     :
*   Created     :   28/11/2019 1:47 PM by Detective Conan
*   Updated     :   28/11/2019 1:47 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/liturgical.dart';

class LiturgicalService {
  Future<List<Liturgical>> getLiturgicalList() async {
    final branchId = locator<BranchService>().branch.id;
    final roleId = await locator<AuthenticationService>().getRoleId();
    final userId = await locator<AuthenticationService>().getUserId();
    List<Liturgical> _liturgicalList = [];
    // TODO implement code
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
}
