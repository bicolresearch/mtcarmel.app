/*
*   Filename    :   priests_service.dart
*   Purpose     :
*   Created     :   17/09/2019 3:05 PM by Detective Conan
*	 Updated			:   25/09/2019 4:57 PM PM by Detective Conan
*	 Changes			:   Removed the parameter of getPriests. make it local instead
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/data_carmelite.dart';
import 'package:mt_carmel_app/src/models/carmelite.dart';
import 'dart:convert';

class PriestsService {
  static const String _TYPE_ID = "107";

  List<Carmelite> _priests = [];

  Future<List<Carmelite>> getPriests() async {

    final hasConnection = await ConnectivityChecker.hasDataConnection();

    if(!hasConnection)
      throw Exception('PriestsService.getData: No connection');

    final _branchId = await locator<BranchService>().branch.id;
    var response;

    try {
      response = await http
              .get(
                  "${AppConstants.CARMELITES_JSON_URL}?branch_id=$_branchId?type_id=$_TYPE_ID")
              .timeout(Duration(seconds: 5));
    } catch (e) {
      print(e);
      throw Exception("Failure in retrieving priests");
    }

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      _priests = DataCarmelite.fromJson(body).data.where((priest) {
        return priest.typeId == _TYPE_ID;
      }).toList();
    } else {
      throw Exception("Failure in retrieving priests");
    }
    return _priests;
  }

  List<Carmelite> get priests => _priests;
}
