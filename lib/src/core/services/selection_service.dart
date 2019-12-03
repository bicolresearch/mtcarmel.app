/*
*  Filename    :   selection_service.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:20 by Detective Conan
*	 Updated			:   23/09/2019 9:25 AM PM by Detective Conan
*	 Changes			:   Added connectivity check
*/

//import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/selection_api.dart';
import 'package:http/http.dart' as http;

class SelectionService {
  Future<List<SelectionApi>> getSelection(String url) async {

    final hasConnection = await ConnectivityChecker.hasDataConnection();

    if(!hasConnection)
      throw Exception('SelectionService.getSelection: No connection');

    List<SelectionApi> _selectionApis;
    print(url);
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