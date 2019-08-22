/*
*  Filename    :   selection_service.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:20 by Detective Conan
*  Updated     :   2019-08-20 16:20 by Detective Conan 
*  Changes     :
*/

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/selection_api.dart';

class SelectionService {
  Future<List<SelectionApi>> getSelection(String url) async {
    List<SelectionApi> _selectionApis;
    await http.get("$url").then((response) {
      if (response.statusCode == 200) {
        _selectionApis = (json.decode(response.body) as List)
              .map((data) => new SelectionApi.fromJson(data))
              .toList();
      } else {
        print(response.statusCode);
        throw Exception("No selection retrieved.");
      }
    }).timeout(Duration(seconds: 5));
    return _selectionApis;
  }
}