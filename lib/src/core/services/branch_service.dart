/*
*   Filename    :   branch_service.dart
*   Purpose     :
*   Created     :   09/09/2019 9:36 AM by Detective Conan
*	 Updated			:   23/09/2019 9:26 AM PM by Detective Conan
*	 Changes			:   Added connectivity check
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/branch.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BranchService {
  Branch _branch;

  Branch get branch => _branch;

  void clearBranch() => _branch = null;

  Future<Branch> getBranch(String branchId) async {

    final hasConnection = await ConnectivityChecker.hasDataConnection();

    if(!hasConnection)
      throw Exception('BranchService.getBranch: No connection');

    if(_branch != null)
      return _branch;

    final url = "${AppConstants.BRANCHES_JSON_URL}branch/?id=$branchId";
    print(url);
    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      try {
        final body = json.decode(response.body);
        _branch = Branch.fromJson(body);
      } catch (e) {
        print(e);
        throw e;
      }
    } else {
      throw Exception('Failed to load');
    }

    return _branch;
  }
}
