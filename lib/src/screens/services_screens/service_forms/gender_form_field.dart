/*
*  Filename    :   gender_form_field.dart
*  Purpose     :	 FormField for gender
*  Created     :   2019-07-15 17:48 by Detective Conan
*  Updated     :   2019-07-22 15:06 by Detective conan
*  Changes     :   removed the guad for no selection defined.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_dropdown_form_common.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_abstract.dart';

class GenderFormField extends ServiceDropdownFormCommon
    implements ServiceFormAbstract {
  final _list = ["Male", "Female"];

  GenderFormField({churchFormField}) : super(churchFormField: churchFormField);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          labelText(context, churchFormField.labelText),
          buildForm(context),
        ],
      ),
    );
  }

  @override
  Widget buildForm(BuildContext context) {
    return super.bottomSheetForm(context, _list);
  }

}
