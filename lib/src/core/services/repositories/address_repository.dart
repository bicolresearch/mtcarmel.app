/*
*  Filename    :   address_repository.dart
*  Purpose     :	
*  Created     :   2019-08-07 10:11 by Detective Conan
*  Updated     :   2019-08-07 10:11 by Detective Conan 
*  Changes     :
*/

import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/country.dart';

class AddressRepository{


 Future<List<Country>> getCountries() async {
    List<Country> countries;
    final url = "https://api.mountcarmel.ph/country";
    await http.get(url).then((response) {
      if (response.statusCode == 200) {
        countries = (json.decode(response.body) as List)
              .map((data) => Country.fromJson(data))
              .toList();
      } else {
        print(response.statusCode);
        throw Exception("Error in country data");
      }
    }).timeout(Duration(seconds: 5));
    return countries;
  }
}


Future<List<Country>> getProvinceById(String id) async {
  List<Country> provinces;
  final url = "https://api.mountcarmel.ph/country";
  await http.get(url).then((response) {
    if (response.statusCode == 200) {
      provinces = (json.decode(response.body) as List)
          .map((data) => Country.fromJson(data))
          .toList();
    } else {
      print(response.statusCode);
      throw Exception("Error in province data");
    }
  }).timeout(Duration(seconds: 5));
  return provinces;
}

