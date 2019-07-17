/*
*  Filename    :   service_form_field.dart
*  Purpose     :	 Responsible for the calling of which type of form field
*                  to be used.
*  Created     :   2019-07-15 17:02 by Detective Conan
*	 Updated			:   16/07/2019 2:23 PM PM by Detective Conan
*	 Changes			:   Changed the constructor. The ChurchFormField is now in
*	                 serviceFormCommon class
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_plain_text_field.dart';

import 'gender_form_field.dart';

class ServiceFormField extends StatelessWidget {
  ServiceFormField({this.churchFormField});

  final ChurchFormField churchFormField;

  @override
  Widget build(BuildContext context) {
    if (churchFormField == null) return Container();
    return _formField();
  }

  Widget _formField() {
    if (churchFormField.textFieldType == "plain_text")
      return ServicePlainTextField(churchFormField: churchFormField);
    else if (churchFormField.textFieldType == "gender_selection")
      return GenderFormField(churchFormField: churchFormField);
//    else if(_churchFormField.textFieldType == "nationality_selection")
//    else if(_churchFormField.textFieldType == "religion_selection")
//    else if(_churchFormField.textFieldType == "marital_selection")
//    else if(_churchFormField.textFieldType == "event_selection")
//    else if(_churchFormField.textFieldType == "date_picker")

    return Container();
  }
}
