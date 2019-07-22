/*
*  Filename    :   service_plain_text_field.dart
*  Purpose     :	 Use for the plain text form field
*  Created     :   2019-07-15 16:18 by Detective Conan
*  Updated     :   2019-07-22 10:09 by Detective conan
*  Changes     :   Fixed the validator for numeric.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_abstract.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_common.dart';

class ServicePlainTextField extends ServiceFormCommon
    implements ServiceFormAbstract {
  ServicePlainTextField({churchFormField})
      : super(churchFormField: churchFormField);

  @override
  Widget build(BuildContext context) {
    return buildForm(context);
  }

  @override
  Widget buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          labelText(context, churchFormField.labelText),
          FormBuilderTextField(
            attribute: churchFormField.attribute,
            decoration: InputDecoration(
                helperStyle: Theme.of(context).primaryTextTheme.subtitle),
            keyboardType: TextInputType.multiline,
            validators: _validators(),
            style: Theme.of(context).primaryTextTheme.title,
            textAlign: TextAlign.center,
            cursorColor: Colors.brown,
          ),
        ],
      ),
    );
  }

  List<String Function(dynamic)> _validators() {
    List<String Function(dynamic)> validators = [];

    if (churchFormField.validators == null) return validators;

    if (churchFormField.validators.isRequired == "true")
      validators.add(FormBuilderValidators.required());

    if (churchFormField.validators.isNumeric != null
        &&
        churchFormField.validators.isNumeric == "true"
    )
      validators.add(FormBuilderValidators.numeric());
    if (churchFormField.validators.minValue != null
    )
      try {
        validators.add(FormBuilderValidators.min(
            int.tryParse(churchFormField.validators.minValue)));
      } catch (e) {
        print("not an integer");
      }
    if (churchFormField.validators.maxValue != null
    )
      try {
        validators.add(FormBuilderValidators.max(
            int.tryParse(churchFormField.validators.maxValue)));
      } catch (e) {
        print("not an integer");
      }
    if (churchFormField.validators.errorText != null
    )
      validators.add(FormBuilderValidators.required(
          errorText: churchFormField.validators.errorText));

    return validators;
  }
}
