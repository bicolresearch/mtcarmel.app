/*
*  Filename    :   service_plain_text_field.dart
*  Purpose     :	 Use for the plain text form field
*  Created     :   2019-07-15 16:18 by Detective Conan
*  Updated     :   2019-07-15 16:18 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service_type.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_abstract.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ServicePlainTextField extends StatelessWidget
    implements ServiceFormAbstract {
  ServicePlainTextField(this._churchFormField);

  final ChurchFormField _churchFormField;

  @override
  Widget build(BuildContext context) {
    return buildForm(context);
  }

  @override
  Widget buildForm(BuildContext context) {
    return FormBuilderTextField(
      attribute: _churchFormField.attribute,
      decoration: InputDecoration(labelText: _churchFormField.labelText),
      validators: _validators(),
      style: Theme.of(context).primaryTextTheme.caption,
    );
  }

  List<String Function(dynamic)> _validators() {
    List<String Function(dynamic)> validators = [];

    if (_churchFormField.validators == null) return validators;

    if (_churchFormField.validators.isRequired == "true")
      validators.add(FormBuilderValidators.required());
    else
      return validators; // all other validator are not matter

    if (_churchFormField.validators.isNumeric.isNotEmpty)
      validators.add(FormBuilderValidators.numeric());
    if (_churchFormField.validators.minValue != null &&
        _churchFormField.validators.minValue.isNotEmpty)
      try {
        validators.add(FormBuilderValidators.min(
            int.tryParse(_churchFormField.validators.minValue)));
      } catch (e) {
        print("not an integer");
      }
    if (_churchFormField.validators.maxValue != null &&
        _churchFormField.validators.maxValue.isNotEmpty)
      try {
        validators.add(FormBuilderValidators.max(
            int.tryParse(_churchFormField.validators.maxValue)));
      } catch (e) {
        print("not an integer");
      }
    if (_churchFormField.validators.errorText.isNotEmpty)
      validators.add(FormBuilderValidators.required(
          errorText: _churchFormField.validators.errorText));

    return validators;
  }
}
