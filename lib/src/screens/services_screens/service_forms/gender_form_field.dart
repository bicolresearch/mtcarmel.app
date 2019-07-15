/*
*  Filename    :   gender_form_field.dart
*  Purpose     :	
*  Created     :   2019-07-15 17:48 by Detective Conan
*  Updated     :   2019-07-15 17:48 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service_type.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_abstract.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class GenderFormField extends StatelessWidget implements ServiceFormAbstract {
  GenderFormField(this._churchFormField);

  final ChurchFormField _churchFormField;

  @override
  Widget build(BuildContext context) {
    return buildForm(context);
  }

  @override
  Widget buildForm(BuildContext context) {
    if (_churchFormField.selections == null ||
        _churchFormField.selections.isEmpty) {
      print("no defined selections");
      return Container();
    }
    return FormBuilderDropdown(
      attribute: _churchFormField.attribute,
      decoration: InputDecoration(labelText: _churchFormField.labelText),
      hint: Text(_churchFormField.hint),
      validators: [FormBuilderValidators.required()],
      items: ['Male', 'Female']
          .map((gender) =>
              DropdownMenuItem(value: gender, child: Text("$gender")))
          .toList(),
    );
  }
}
