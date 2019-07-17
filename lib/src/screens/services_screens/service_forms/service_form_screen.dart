/*
*  Filename    :   service_form_screen.dart
*  Purpose     :	
*  Created     :   2019-07-15 14:12 by Detective Conan
*	 Updated			:   17/07/2019 10:48 AM PM by Detective Conan
*	 Changes			:   Added parameter in constructor. For formFields.
*	                 Made static the GlobalKey. To fixed the disappearing of
*	                 keyboard.
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_field.dart';

class ServiceFormScreen extends StatelessWidget {
  static final GlobalKey<FormBuilderState> _fbKey =
      GlobalKey<FormBuilderState>();

  ServiceFormScreen({this.formFields});

  final List<ChurchFormField> formFields;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: <Widget>[
            FormBuilder(
              key: _fbKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  for (var formField in formFields)
                    ServiceFormField(churchFormField: formField)
                ],
              ),
            ),
            Row(
              children: <Widget>[
                MaterialButton(
                  child: Text("Submit"),
                  onPressed: () {
                    _fbKey.currentState.save();
                    if (_fbKey.currentState.validate()) {
                      print(_fbKey.currentState.value);
                    }
                  },
                ),
                MaterialButton(
                  child: Text("Reset"),
                  onPressed: () {
                    _fbKey.currentState.reset();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
