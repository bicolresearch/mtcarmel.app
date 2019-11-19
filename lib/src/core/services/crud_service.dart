/*
*  Filename    :   crud_service.dart
*  Purpose     :	 Use for posting, updating database.
*  Created     :   2019-08-23 13:23 by Detective Conan
*  Updated     :   2019-08-23 13:23 by Detective Conan 
*  Changes     :
*/

import 'package:http/http.dart' as http;
import 'dart:convert';

class CrudService {
  Future<bool> post(url,
      {Map<String, String> headers, body, Encoding encoding}) async {
    if (url == null || url.isEmpty) throw Exception("No assigned api url.");

    final response = await http
        .post(
          url,
          headers: headers,
          body: body,
        )
        .timeout(
          Duration(seconds: 3),
        )
        .catchError((e) => {throw e});
    print(response.body);
    if (response == null) return false;

    if (response.statusCode == 201)
      return true;
    else
      throw Exception("Error posting data");
  }

  Future<bool> patch(url,
      {Map<String, String> headers, body, Encoding encoding}) async {
    if (url == null || url.isEmpty) throw Exception("No assigned api url.");

    final response = await http.patch(
      url,
      headers: headers,
      body: body,
    )
        .timeout(
      Duration(seconds: 3),
    )
        .catchError((e) => {throw e});
    print(response.body);
    print(response.statusCode);
    if (response == null) return false;

    if (response.statusCode == 200)
      return true;
    else
      throw Exception("Error patching data");
  }

  Future<bool> put(url,
      {Map<String, String> headers, body, Encoding encoding}) async {
    if (url == null || url.isEmpty) throw Exception("No assigned api url.");

    final response = await http.put(
      url,
      headers: headers,
      body: body,
    )
        .timeout(
      Duration(seconds: 5),
    )
        .catchError((e) => {throw e});
    print(response.body);
    print(response.statusCode);
    if (response == null) return false;

    if (response.statusCode == 200)
      return true;
    else
      throw Exception("Error putting data");
  }


}
