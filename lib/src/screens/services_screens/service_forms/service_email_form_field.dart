/*
*  Filename    :   service_email_form_field.dart
*  Purpose     :	
*  Created     :   2019-07-31 12:02 by Detective Conan
*  Updated     :   2019-07-31 12:02 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_abstract.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_common.dart';

class ServiceEmailFormField extends ServiceFormCommon
    implements ServiceFormAbstract {
  ServiceEmailFormField({churchFormField})
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
            keyboardType: TextInputType.emailAddress,
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

    return validators;
  }
}