/*
*  Filename    :   service_numeric_form_field.dart
*  Purpose     :	
*  Created     :   2019-07-31 14:24 by Detective Conan
*  Updated     :   2019-07-31 14:24 by Detective Conan 
*  Changes     :   Added setting of keyboardType as numeric
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_abstract.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_common.dart';

class ServiceNumericFormField extends ServiceFormCommon
    implements ServiceFormAbstract {
  ServiceNumericFormField({churchFormField})
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
                helperStyle: Theme.of(context).primaryTextTheme.subtitle,
                hintText: (churchFormField.hint == null ||
                        churchFormField.hint.isEmpty)
                    ? ""
                    : churchFormField.hint),
            validators: _validators(),
            style: Theme.of(context).primaryTextTheme.title,
            textAlign: TextAlign.center,
            cursorColor: Colors.brown,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  List<String Function(dynamic)> _validators() {
    List<String Function(dynamic)> validators = [];

    if (churchFormField.validatorIsRequired == "true")
      validators.add(FormBuilderValidators.required());

    if (churchFormField.validatorIsNumeric == "true") {
      validators.add(FormBuilderValidators.numeric());
      if (churchFormField.validatorMinValue != null)
        try {
          validators.add(FormBuilderValidators.min(
              int.tryParse(churchFormField.validatorMinValue)));
        } catch (e) {
          print("not an integer");
        }
      if (churchFormField.validatorMaxValue != null)
        try {
          validators.add(FormBuilderValidators.max(
              int.tryParse(churchFormField.validatorMaxValue)));
        } catch (e) {
          print("not an integer");
        }
    }
    if (churchFormField.errorText != null)
      validators.add(
          FormBuilderValidators.required(errorText: churchFormField.errorText));

    if (churchFormField.validatorPattern != null)
      validators
          .add(FormBuilderValidators.pattern(churchFormField.validatorPattern));

    return validators;
  }
}
