/*
*  Filename    :   service_form_field.dart
*  Purpose     :	 Responsible for the calling of which type of form field
*                  to be used.
*  Created     :   2019-07-15 17:02 by Detective Conan
*  Updated     :   2019-07-15 17:02 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service_type.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_plain_text_field.dart';

import 'gender_form_field.dart';

class ServiceFormField extends StatelessWidget {
  ServiceFormField(this._churchFormField);

  final ChurchFormField _churchFormField;

  @override
  Widget build(BuildContext context) {
    return _formField();
  }

  Widget _formField() {
    if (_churchFormField.textFieldType == "plain_text")
      return ServicePlainTextField(_churchFormField);
    else if(_churchFormField.textFieldType == "gender_selection")
      return GenderFormField(_churchFormField);
//    else if(_churchFormField.textFieldType == "nationality_selection")
//    else if(_churchFormField.textFieldType == "religion_selection")
//    else if(_churchFormField.textFieldType == "marital_selection")
//    else if(_churchFormField.textFieldType == "event_selection")
//    else if(_churchFormField.textFieldType == "date_picker")

    return Container();
  }
}
