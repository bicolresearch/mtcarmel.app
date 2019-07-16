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
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_common.dart';

class GenderFormField extends ServiceFormCommon implements ServiceFormAbstract {
  GenderFormField(this._churchFormField);

  final ChurchFormField _churchFormField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          labelText(context, _churchFormField.labelText),
          buildForm(context),
        ],
      ),
    );
  }

  @override
  Widget buildForm(BuildContext context) {
    if (_churchFormField.selections == null ||
        _churchFormField.selections.isEmpty) {
      print("no defined selections");
      return Container();
    }
    return FormBuilderDropdown(
      style: Theme.of(context).primaryTextTheme.caption,
      attribute: _churchFormField.attribute,
      hint: Text(
        _churchFormField.hint,
        style: Theme.of(context).primaryTextTheme.title,
      ),
      validators: _validators(),
      items: ['Male', 'Female']
          .map(
            (gender) => DropdownMenuItem(
              value: gender,
              child: Text(
                "$gender",
                style: Theme.of(context).primaryTextTheme.title,
              ),
            ),
          )
          .toList(),
    );
  }

  List<String Function(dynamic)> _validators() {
    List<String Function(dynamic)> validators = [];

    if (_churchFormField.validators == null) return validators;

    if (_churchFormField.validators.isRequired == "true")
      validators.add(FormBuilderValidators.required());

    if (_churchFormField.validators.errorText.isNotEmpty)
      validators.add(FormBuilderValidators.required(
          errorText: _churchFormField.validators.errorText));

    return validators;
  }
}
