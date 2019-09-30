/*
*  Filename    :   mass_request_service.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:20 by Detective Conan
*  Updated     :   2019-08-20 16:20 by Detective Conan 
*  Changes     :
*/

import 'package:mt_carmel_app/src/models/data_mass_request.dart';
import 'package:mt_carmel_app/src/models/mass_request.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';

class MassRequestService {
  //TODO implement request per priest and admin account
  //TODO change the implementation. use Dio package
//  Future<List<MassRequest>> getMassRequests() async {
//    List<MassRequest> _massRequests;
//    await http.get("https://api.mountcarmel.ph/mass_request").then((result) {
//      if (result.statusCode == 200) {
//        final body = json.decode(result.body);
//        _massRequests =
//            DataMassRequest.fromJson(body).data;
//      } else {
//        print(result.statusCode);
//      }
//    }).timeout(Duration(seconds: 5));
//    return _massRequests;
//  }
}