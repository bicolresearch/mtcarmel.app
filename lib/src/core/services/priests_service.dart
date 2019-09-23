/*
*   Filename    :   priests_service.dart
*   Purpose     :
*   Created     :   17/09/2019 3:05 PM by Detective Conan
*	 Updated			:   23/09/2019 9:25 AM PM by Detective Conan
*	 Changes			:   Added connectivity check
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/data_priest.dart';
import 'package:mt_carmel_app/src/models/priest.dart';
import 'dart:convert';

class PriestsService {
  static const String _TYPE_ID = "108";

  List<Priest> _priests = [];

  Future<List<Priest>> getData() async {

    final hasConnection = await ConnectivityChecker.hasDataConnection();

    if(!hasConnection)
      throw Exception('PriestsService.getData: No connection');

    final _branchId = await locator<BranchService>().branch.id;
    var response;

    try {
      response = await http
              .get(
                  "${AppConstants.PRIESTS_JSON_URL}?branch_id=$_branchId?type_id=$_TYPE_ID")
              .timeout(Duration(seconds: 5));
    } catch (e) {
      print(e);
      throw Exception("Failure in retrieving priests");
    }

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      _priests = DataPriest.fromJson(body).data.where((priest) {
        return priest.typeId == _TYPE_ID;
      }).toList();
    } else {
      throw Exception("Failure in retrieving priests");
    }
    return _priests;
  }

  List<Priest> get priests => _priests;
}
