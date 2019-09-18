/*
*   Filename    :   pastors_service.dart
*   Purpose     :
*   Created     :   17/09/2019 3:05 PM by Detective Conan
*   Updated     :   17/09/2019 3:05 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/data_pastor.dart';
import 'package:mt_carmel_app/src/models/pastor.dart';
import 'dart:convert';

class PastorsService {
  static const String _TYPE_ID = "107";

  List<Pastor> _pastors = [];

  Future<List<Pastor>> getData() async {
    final _branchId = locator<BranchService>().branch.id;
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
      _pastors = DataPastor.fromJson(body).data.where((priest) {
        return priest.typeId == _TYPE_ID;
      }).toList();
    } else {
      throw Exception("Failure in retrieving priests");
    }
    return _pastors;
  }

  List<Pastor> get priests => _pastors;
}