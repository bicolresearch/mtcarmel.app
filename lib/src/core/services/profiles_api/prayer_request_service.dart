/*
*  Filename    :   prayer_request_service.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:20 by Detective Conan
*  Updated     :   2019-08-20 16:20 by Detective Conan 
*  Changes     :
*/

import 'package:mt_carmel_app/src/models/data_prayer_request.dart';
import 'package:mt_carmel_app/src/models/prayer_request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PrayerRequestService {
  //TODO implement request per priest and admin account
  Future<List<PrayerRequest>> getPrayerRequests() async {
    List<PrayerRequest> _prayerRequests;
    await http.get("https://api.mountcarmel.ph/prayer_request").then((result) {
      if (result.statusCode == 200) {
        final body = json.decode(result.body);
        _prayerRequests =
            DataPrayerRequest.fromJson(body).data;
      } else {
        print(result.statusCode);
      }
    }).timeout(Duration(seconds: 5));
    return _prayerRequests;
  }
}