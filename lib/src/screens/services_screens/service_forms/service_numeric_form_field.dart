/*
*  Filename    :   service_numeric_form_field.dart
*  Purpose     :	
*  Created     :   2019-07-31 14:24 by Detective Conan
*  Updated     :   2019-07-31 14:24 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
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
                helperStyle: Theme.of(context).primaryTextTheme.subtitle),
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

    validators.add(FormBuilderValidators.numeric());

    if (churchFormField.validators == null) return validators;

    if (churchFormField.validators.isRequired == "true")
      validators.add(FormBuilderValidators.required());

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
    if (churchFormField.errorText != null
    )
      validators.add(FormBuilderValidators.required(
          errorText: churchFormField.errorText));

    return validators;
  }
}