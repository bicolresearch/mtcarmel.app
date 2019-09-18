/*
*   Filename    :   about_service.dart
*   Purpose     :
*   Created     :   18/09/2019 9:58 AM by Detective Conan
*   Updated     :   18/09/2019 9:58 AM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/about.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AboutService {
  Future<About> getData() async {
    final branchId = locator<BranchService>().branch.id;
    About _about;
    var response = await http.get(
        "${AppConstants.ABOUT_JSON_URL}/history/?branch_id=$branchId&id=$branchId");

    if (response.statusCode == 200) {
      try {
        final body = json.decode(response.body);
        _about = About.fromJson(body);
      } catch (e) {
        print(e);
        throw Exception("Failed fetching about");
      }
    } else {
      print(response.statusCode);
      throw Exception("Failed fetching about");
    }
    return _about;
  }
}
