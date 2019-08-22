/*
*  Filename    :   service_form_field.dart
*  Purpose     :	 Responsible for the calling of which type of form field
*                  to be used.
*  Created     :   2019-07-15 17:02 by Detective Conan
*	 Updated			:   16/07/2019 2:23 PM PM by Detective Conan
*  Updated     :   2019-07-22 15:37 by Detective conan
*  Changes     :   Added civil status dropdown
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/civil_status_form_field.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/country_and_related_form_fields.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/date_form_field.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/selection_form_field.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_multiline_text_field.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_numeric_form_field.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_plain_text_field.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/time_form_field.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/yes_no_form_field.dart';

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
    if (churchFormField.textFieldType == "gender_selection")
      return GenderFormField(churchFormField: churchFormField);
    else if (churchFormField.textFieldType == "multiline")
      return ServiceMultilineTextField(churchFormField: churchFormField);
    else if (churchFormField.textFieldType == "yes_no")
      return YesNoFormField(churchFormField: churchFormField);
    else if (churchFormField.textFieldType == "civil_status")
      return CivilStatusFormField(churchFormField: churchFormField);
    else if (churchFormField.textFieldType == "date")
      return DateFormField(churchFormField: churchFormField);
    else if (churchFormField.textFieldType == "time")
      return TimeFormField(churchFormField: churchFormField);
    else if (churchFormField.textFieldType == "numeric")
      return ServiceNumericFormField(churchFormField: churchFormField);
    else if (churchFormField.textFieldType == "country_province_city_barangay")
      return CountryAndRelatedFormFields(
        churchFormField: churchFormField,
        fieldsToShow: FieldsToShow.CountryProvinceCityBarangay,
      );
    else if (churchFormField.textFieldType == "selection")
      return SelectionFormField(churchFormField: churchFormField);
    else if (churchFormField.textFieldType == "plain_text")
      return ServicePlainTextField(churchFormField: churchFormField);
    else // type will be plain if no match found
      return ServicePlainTextField(churchFormField: churchFormField);
//    else if(_churchFormField.textFieldType == "nationality_selection")
//    else if(_churchFormField.textFieldType == "religion_selection")
//    else if(_churchFormField.textFieldType == "marital_selection")
//    else if(_churchFormField.textFieldType == "event_selection")
//    else if(_churchFormField.textFieldType == "date_picker")

    return Container();
  }
}
