/*
*  Filename    :   address_repository.dart
*  Purpose     :	
*  Created     :   2019-08-07 10:11 by Detective Conan
*  Updated     :   2019-08-07 10:11 by Detective Conan 
*  Changes     :
*/

import 'dart:async';

//import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/barangay.dart';
import 'package:mt_carmel_app/src/models/city.dart';
import 'package:mt_carmel_app/src/models/country.dart';
import 'package:mt_carmel_app/src/models/province.dart';

class AddressRepository{


 Future<List<Country>> getCountries() async {
    List<Country> countries;
    final url = "https://api.mountcarmel.ph/country";
//    await http.get(url).then((response) {
//      if (response.statusCode == 200) {
//        countries = (json.decode(response.body) as List)
//              .map((data) => Country.fromJson(data))
//              .toList();
//      } else {
//        print(response.statusCode);
//        throw Exception("Error in country data");
//      }
//    }).timeout(Duration(seconds: 5));
//    return countries;
  }

 Future<List<Province>> getProvinceByCountryCode(String countryCode) async {
   List<Province> provinces;
   final url = "https://api.mountcarmel.ph/province/province_by_countryid/id/$countryCode";
//   await http.get("$url").then((response) {
//     if (response.statusCode == 200) {
//       provinces = (json.decode(response.body) as List)
//           .map((data) => Province.fromJson(data))
//           .toList();
//     } else {
//       print(response.statusCode);
//       throw Exception("Error in province data");
//     }
//   }).timeout(Duration(seconds: 5));
   return provinces;
 }

 Future<List<City>> getCityByProvinceCode(String provinceCode) async {
   List<City> cities;
   final url = "https://api.mountcarmel.ph/city/city_by_provinceid/id/$provinceCode";
//   await http.get("$url").then((response) {
//     if (response.statusCode == 200) {
//       cities = (json.decode(response.body) as List)
//           .map((data) => City.fromJson(data))
//           .toList();
//     } else {
//       print(response.statusCode);
//       throw Exception("Error in city data");
//     }
//   }).timeout(Duration(seconds: 5));
   return cities;
 }

 Future<List<Barangay>> getBarangayByCityCode(String cityCode) async {
   List<Barangay> barangays;
   final url = "https://api.mountcarmel.ph/barangay/barangay_by_cityid/id/$cityCode";
//   await http.get("$url").then((response) {
//     if (response.statusCode == 200) {
//       barangays = (json.decode(response.body) as List)
//           .map((data) => Barangay.fromJson(data))
//           .toList();
//     } else {
//       print(response.statusCode);
//       throw Exception("Error in barangay data");
//     }
//   }).timeout(Duration(seconds: 5));
   return barangays;
 }


}




