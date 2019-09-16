/*
*   Filename    :   send_help_service.dart
*   Purpose     :
*   Created     :   12/09/2019 12:46 PM by Detective Conan
*   Updated     :   12/09/2019 12:46 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/send_help.dart';

import 'branch_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SendHelpService {
  Future<List<SendHelpData>> getData() async {
    final branchId = locator<BranchService>().branch.id;
    var response;
    try {
      response = await http
              .get("${AppConstants.SEND_HELP_JSON_URL}?branch_id=$branchId")
              .timeout(Duration(seconds: 3));
    } catch (e) {
      print(e);
      throw e;
    }

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return SendHelp.fromJson(body).data;
    } else {
      throw Exception('Failed to load');
    }
  }
}
