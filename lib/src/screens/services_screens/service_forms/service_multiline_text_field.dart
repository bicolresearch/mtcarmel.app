/*
*  Filename    :   service_multiline_text_field.dart
*  Purpose     :	  Use for the multiline text form field
*  Created     :   2019-07-17 16:18 by Detective Conan
*  Updated     :   2019-07-17 16:18 by Detective Conan
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_abstract.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_common.dart';

class ServiceMultilineTextField extends ServiceFormCommon
    implements ServiceFormAbstract {
  ServiceMultilineTextField({churchFormField})
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
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                border: OutlineInputBorder(),
                alignLabelWithHint: false,
                hintText: (churchFormField.hint == null ||
                        churchFormField.hint.isEmpty)
                    ? "Write here..."
                    : churchFormField.hint),
            validators: _validators(),
            style: Theme.of(context).primaryTextTheme.title,
            textAlign: TextAlign.left,
            cursorColor: Colors.brown,
            maxLines: 15,
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
