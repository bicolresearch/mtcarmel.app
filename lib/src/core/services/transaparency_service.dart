/*
*   Filename    :   transaparency_service.dart
*   Purpose     :
*   Created     :   12/09/2019 4:48 PM by Detective Conan
*   Updated     :   12/09/2019 4:48 PM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/donations.dart';

class TransparencyService{
  Future<Donations> getData() async {
    var response = await http.get(AppConstants.TRANSACTION_JSON_URL);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return Donations.fromJson(body);
    } else {
      throw Exception("Failed to load");
    }
  }
}