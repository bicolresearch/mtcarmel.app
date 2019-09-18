/*
*   Filename    :   contact_detail_service.dart
*   Purpose     :
*   Created     :   18/09/2019 11:31 AM by Detective Conan
*   Updated     :   18/09/2019 11:31 AM by Detective Conan
*   Changes     :   
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/contact.dart';

class ContactDetailService {
  Future<ContactData> getData() async {
    final branchId = locator<BranchService>().branch.id;
    ContactData contactData;
    var response = await http.get(
        "${AppConstants.CONTACT_DETAILS_JSON_URL}contact/?branch_id=$branchId&id=$branchId");

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      try {
        contactData = ContactData.fromJson(body);
      } catch (e) {
        print(e);
        throw Exception("Failed fetching contact details");
      }
    } else {
      print(response.statusCode);
      throw Exception("Failed fetching contact details");
    }
    print("return contactData; $contactData");
    print("return contactData; ${contactData.name}");
    return contactData;
  }
}
