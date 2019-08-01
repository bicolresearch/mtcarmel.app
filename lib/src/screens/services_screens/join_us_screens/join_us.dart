/*
*	 Filename		 :	 join_us.dart
*	 Purpose		 :   TEMPORARY
*  Created		 :   2019-06-11 15:52:50 by Detective Conan
*  Updated     :   2019-07-12 16:50 by Detective conan
*  Changes     :   Tempoary
*/

import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class JoinUs {

  JoinUs(){
    _getSubModuleAndFormFields(confraternityUrl).then((result){
      _confraternity = result;
      print(_confraternity);
      _isLoading = false;
    }).catchError((e) {
      print(e);
      _isLoading = false;
    });
//    while (_isLoading == true){
//      print("loading");
//    }
  }

  bool _isLoading = true;
  final confraternityUrl = "https://api.mountcarmel.ph/confraternity";
  SubModuleAndFormFields _confraternity;

  dynamic getChurchModule(ServiceItem moduleItem) {
    final ModuleReference moduleReference = ModuleReference(
        moduleItem.id,
        moduleItem.branchId,
        moduleItem.name,
        moduleItem.description,
        moduleItem.coverPhoto);
    final String acceptanceContent = _confraternity.subModule.acceptanceContent;

//    final ChurchFormValidators validatorsPlainRequired =
//        ChurchFormValidators(isRequired: "true", isNumeric: "false");
//    final ChurchFormValidators validatorsPlainNotRequired =
//        ChurchFormValidators(isRequired: "false");
//    final ChurchFormValidators validatorsNumericRequired =
//        ChurchFormValidators(isRequired: "true", isNumeric: "true");
//    final ChurchFormValidators validatorsNumericNotRequired =
//        ChurchFormValidators(isRequired: "false", isNumeric: "true");
//
//    final ChurchFormField churchFormField1 = ChurchFormField(

//        attribute: "name",
//        labelText: "Name",
//        validators: validatorsPlainRequired,
//        textFieldType: "plain_text");
//    final ChurchFormField churchFormField2 = ChurchFormField(
//        attribute: "address_1",
//        labelText: "Address 1",
//        validators: validatorsPlainRequired,
//        textFieldType: "plain_text");
//    final ChurchFormField churchFormField3 = ChurchFormField(
//        attribute: "address_2",
//        labelText: "Address 2",
//        validators: validatorsPlainRequired,
//        textFieldType: "plain_text");
//    final ChurchFormField churchFormField4 = ChurchFormField(
//        attribute: "barangay",
//        labelText: "Barangay",
//        validators: validatorsPlainRequired,
//        textFieldType: "numeric");
//    final ChurchFormField churchFormField5 = ChurchFormField(
//        attribute: "city",
//        labelText: "City",
//        validators: validatorsPlainRequired,
//        textFieldType: "numeric");
//    final ChurchFormField churchFormField6 = ChurchFormField(
//        attribute: "province",
//        labelText: "Province",
//        validators: validatorsPlainRequired,
//        textFieldType: "numeric");
//    final ChurchFormField churchFormField7 = ChurchFormField(
//        attribute: "country",
//        labelText: "Country",
//        validators: validatorsPlainRequired,
//        textFieldType: "numeric");
//    final ChurchFormField churchFormField8 = ChurchFormField(
//        attribute: "dt_birth",
//        labelText: "Birthday",
//        validators: validatorsPlainRequired,
//        textFieldType: "plain_text");
//    final ChurchFormField churchFormField9 = ChurchFormField(
//        attribute: "landline",
//        labelText: "Landline",
//        validators: validatorsNumericNotRequired,
//        textFieldType: "plain_text");
//    final ChurchFormField churchFormField10 = ChurchFormField(
//        attribute: "mobile",
//        labelText: "Mobile",
//        validators: validatorsPlainRequired,
//        textFieldType: "plain_text");
//    final ChurchFormField churchFormField11 = ChurchFormField(
//        attribute: "email",
//        labelText: "Email",
//        validators: validatorsPlainRequired,
//        textFieldType: "email");

    final ChurchSubModule churchServiceSubtype = ChurchSubModule(
        name: "Confraternity of Our Lady of Mount Carmel",
        formFields: _confraternity.formFields,
//        [
//          churchFormField1,
//          churchFormField2,
//          churchFormField3,
//          churchFormField4,
//          churchFormField5,
//          churchFormField6,
//          churchFormField7,
//          churchFormField8,
//          churchFormField9,
//          churchFormField10,
//          churchFormField11,
//        ],
        acceptanceContent: acceptanceContent,
        thankYouContent: _confraternity.subModule.thankYouContent,
        url: "https://api.mountcarmel.ph/confraternity/create");

    return ChurchModule(
        moduleReference: moduleReference,
        churchSubModules: [churchServiceSubtype]);
  }

  Future<SubModuleAndFormFields> _getSubModuleAndFormFields(
      String confraternityUrl) async {
    final response = await http.get(confraternityUrl);

      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        return SubModuleAndFormFields.fromJson(body);
      } else {
        return null;
        throw "Error in SubModlueAndFormFields data gathering.";
      }

  }
}
