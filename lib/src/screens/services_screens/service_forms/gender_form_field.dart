/*
*  Filename    :   gender_form_field.dart
*  Purpose     :	
*  Created     :   2019-07-15 17:48 by Detective Conan
*	 Updated			:   16/07/2019 2:18 PM PM by Detective Conan
*	 Changes			:   Moved the other method to ServiceDropdownFormCommon class.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service_type.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_dropodown_form_common.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_abstract.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_common.dart';

class GenderFormField extends ServiceDropdownFormCommon
    implements ServiceFormAbstract {
  final _list = ["Male", "Female"];

  GenderFormField({churchFormField}) : super(churchFormField: churchFormField);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          labelText(context, churchFormField.labelText),
          buildForm(context),
        ],
      ),
    );
  }

  @override
  Widget buildForm(BuildContext context) {
    if (churchFormField.selections == null ||
        churchFormField.selections.isEmpty) {
      print("no defined selections");
      return Container();
    }
    return super.dropDownForm(context, _list);
  }

}
