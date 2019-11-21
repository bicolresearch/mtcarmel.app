/*
*  Filename    :   mass_request_service.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:20 by Detective Conan
*  Updated     :   2019-08-20 16:20 by Detective Conan 
*  Changes     :
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/data_mass_request.dart';
import 'package:mt_carmel_app/src/models/mass_request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MassRequestService {
  Future<List<MassRequest>> getMassRequests() async {
    List<MassRequest> _massRequests;
    await http.get("${AppConstants.API_BASE_URL}/mass_request").then((result) {
      if (result.statusCode == 200) {
        final body = json.decode(result.body);
        _massRequests = DataMassRequest.fromJson(body).data;
      } else {
        print(result.statusCode);
      }
    }).timeout(Duration(seconds: 5));
    return _massRequests;
  }
}
