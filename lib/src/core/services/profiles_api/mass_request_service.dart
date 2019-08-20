/*
*  Filename    :   mass_request_service.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:20 by Detective Conan
*  Updated     :   2019-08-20 16:20 by Detective Conan 
*  Changes     :
*/

import 'package:mt_carmel_app/src/models/mass_request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MassRequestService {
  //TODO implement request per priest and admin account
  Future<MassRequest> getPrayerRequests() async {
    MassRequest _prayerRequest;
    await http.get("https://api.mountcarmel.ph/mass_request").then((result) {
      if (result.statusCode == 200) {
        final body = json.decode(result.body);
        _prayerRequest =
            MassRequest.fromJson(body);
      } else {
        print(result.statusCode);
      }
    }).timeout(Duration(seconds: 5));
    return _prayerRequest;
  }
}