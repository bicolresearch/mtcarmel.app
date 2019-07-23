/*
*  Filename    :   time_form_field.dart
*  Purpose     :	
*  Created     :   2019-07-23 16:40 by Detective Conan
*  Updated     :   2019-07-23 16:40 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_abstract.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_common.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class TimeFormField extends ServiceFormCommon
    implements ServiceFormAbstract {
  TimeFormField({churchFormField})
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
          FormBuilderDateTimePicker(
            attribute: "time",
            inputType: InputType.time,
            format: DateFormat("h:mm a"),
            validators: _validators(),
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