/*
*  Filename    :   address_repository.dart
*  Purpose     :	
*  Created     :   2019-08-07 10:11 by Detective Conan
*  Updated     :   2019-08-07 10:11 by Detective Conan 
*  Changes     :
*/

import 'dart:core';
import 'dart:core';

import 'package:mt_carmel_app/src/models/barangay_by_city.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/city_by_province.dart';

class AddressRepository{

  final _barangayByCity =
  [
    {
      "id": "2",
      "brgy_code": "012802001",
      "description": "Bani",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "3",
      "brgy_code": "012802002",
      "description": "Buyon",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "4",
      "brgy_code": "012802003",
      "description": "Cabaruan",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "5",
      "brgy_code": "012802004",
      "description": "Cabulalaan",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "6",
      "brgy_code": "012802005",
      "description": "Cabusligan",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "7",
      "brgy_code": "012802006",
      "description": "Cadaratan",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "8",
      "brgy_code": "012802007",
      "description": "Calioet-Libong",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "9",
      "brgy_code": "012802008",
      "description": "Casilian",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "10",
      "brgy_code": "012802009",
      "description": "Corocor",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "11",
      "brgy_code": "012802011",
      "description": "Duripes",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "12",
      "brgy_code": "012802012",
      "description": "Ganagan",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "13",
      "brgy_code": "012802013",
      "description": "Libtong",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "14",
      "brgy_code": "012802014",
      "description": "Macupit",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "15",
      "brgy_code": "012802015",
      "description": "Nambaran",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "16",
      "brgy_code": "012802016",
      "description": "Natba",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "17",
      "brgy_code": "012802017",
      "description": "Paninaan",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "18",
      "brgy_code": "012802018",
      "description": "Pasiocan",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "19",
      "brgy_code": "012802019",
      "description": "Pasngal",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "20",
      "brgy_code": "012802020",
      "description": "Pipias",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "21",
      "brgy_code": "012802021",
      "description": "Pulangi",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "22",
      "brgy_code": "012802022",
      "description": "Pungto",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "23",
      "brgy_code": "012802024",
      "description": "San Agustin I (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "24",
      "brgy_code": "012802025",
      "description": "San Agustin II (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "25",
      "brgy_code": "012802027",
      "description": "San Andres I (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "26",
      "brgy_code": "012802028",
      "description": "San Andres II (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "27",
      "brgy_code": "012802030",
      "description": "San Gabriel I (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "28",
      "brgy_code": "012802031",
      "description": "San Gabriel II (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "29",
      "brgy_code": "012802033",
      "description": "San Pedro I (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "30",
      "brgy_code": "012802034",
      "description": "San Pedro II (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "31",
      "brgy_code": "012802036",
      "description": "San Roque I (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "32",
      "brgy_code": "012802037",
      "description": "San Roque II (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "33",
      "brgy_code": "012802039",
      "description": "San Simon I (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "34",
      "brgy_code": "012802040",
      "description": "San Simon II (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "35",
      "brgy_code": "012802041",
      "description": "San Vicente (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "36",
      "brgy_code": "012802042",
      "description": "Sangil",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "37",
      "brgy_code": "012802044",
      "description": "Santa Filomena I (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "38",
      "brgy_code": "012802045",
      "description": "Santa Filomena II (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "39",
      "brgy_code": "012802046",
      "description": "Santa Rita (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "40",
      "brgy_code": "012802047",
      "description": "Santo Cristo I (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "41",
      "brgy_code": "012802048",
      "description": "Santo Cristo II (Pob.)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "42",
      "brgy_code": "012802050",
      "description": "Tambidao",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "43",
      "brgy_code": "012802051",
      "description": "Teppang",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "44",
      "brgy_code": "012802052",
      "description": "Tubburan",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
  ];

  List _cityByProvince =

  [
    {
      "id": "1",
      "psgc_code": "012801000",
      "description": "ADAMS",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012801",
    },
    {
      "id": "2",
      "psgc_code": "012802000",
      "description": "BACARRA",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012802",
    },
    {
      "id": "3",
      "psgc_code": "012803000",
      "description": "BADOC",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012803",
    },
    {
      "id": "4",
      "psgc_code": "012804000",
      "description": "BANGUI",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012804",
    },
    {
      "id": "5",
      "psgc_code": "012805000",
      "description": "CITY OF BATAC",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012805",
    },
    {
      "id": "6",
      "psgc_code": "012806000",
      "description": "BURGOS",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012806",
    },
    {
      "id": "7",
      "psgc_code": "012807000",
      "description": "CARASI",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012807",
    },
    {
      "id": "8",
      "psgc_code": "012808000",
      "description": "CURRIMAO",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012808",
    },
    {
      "id": "9",
      "psgc_code": "012809000",
      "description": "DINGRAS",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012809",
    },
    {
      "id": "10",
      "psgc_code": "012810000",
      "description": "DUMALNEG",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012810",
    },
    {
      "id": "11",
      "psgc_code": "012811000",
      "description": "BANNA (ESPIRITU)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012811",
    },
    {
      "id": "12",
      "psgc_code": "012812000",
      "description": "LAOAG CITY (Capital)",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012812",
    },
    {
      "id": "13",
      "psgc_code": "012813000",
      "description": "MARCOS",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012813",
    },
    {
      "id": "14",
      "psgc_code": "012814000",
      "description": "NUEVA ERA",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012814",
    },
    {
      "id": "15",
      "psgc_code": "012815000",
      "description": "PAGUDPUD",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012815",
    },
    {
      "id": "16",
      "psgc_code": "012816000",
      "description": "PAOAY",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012816",
    },
    {
      "id": "17",
      "psgc_code": "012817000",
      "description": "PASUQUIN",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012817",
    },
    {
      "id": "18",
      "psgc_code": "012818000",
      "description": "PIDDIG",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012818",
    },
    {
      "id": "19",
      "psgc_code": "012819000",
      "description": "PINILI",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012819",
    },
    {
      "id": "20",
      "psgc_code": "012820000",
      "description": "SAN NICOLAS",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012820",
    },
    {
      "id": "21",
      "psgc_code": "012821000",
      "description": "SARRAT",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012821",
    },
    {
      "id": "22",
      "psgc_code": "012822000",
      "description": "SOLSONA",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012822",
    },
    {
      "id": "23",
      "psgc_code": "012823000",
      "description": "VINTAR",
      "region_code": "01",
      "province_code": "0128",
      "city_code": "012823",
    },
  ];

  //TODO get from api
  getCountries() {
    return [
      "01",
      "02",
      "03",
    ];
  }

  //TODO get from api
  getBarangays(String cityCode){
    final barangays = _barangayByCity
        .map((data) => BarangayByCity.fromJson(data))
        .toList();

    return barangays;
  }

  //TODO get from api
  getCities(String cityCode){
    final cities = _barangayByCity
        .map((data) => CityByProvince.fromJson(data))
        .toList();

    return cities;
  }

}