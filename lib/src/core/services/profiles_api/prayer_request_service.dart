/*
*  Filename    :   prayer_request_service.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:20 by Detective Conan
*	 Updated			:   29/10/2019 9:31 PM PM by Detective Conan
*	 Changes			:   Implemented dio package instead of http
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
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
}
