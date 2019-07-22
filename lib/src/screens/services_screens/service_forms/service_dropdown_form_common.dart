/*
*  Filename    :   service_dropdown_form_common.dart
*  Purpose     :   
*  Created     :   2019-07-22 15:24 by Detective Conan
*  Updated     :   2019-07-22 15:24 by Detective Conan
*  Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_common.dart';

class ServiceDropdownFormCommon extends ServiceFormCommon {
  ServiceDropdownFormCommon({ChurchFormField churchFormField})
      : super(churchFormField: churchFormField);

  Widget dropDownForm(BuildContext context, List<String> dropDownList) {
    return FormBuilderDropdown(
      style: Theme.of(context).primaryTextTheme.caption,
      attribute: super.churchFormField.attribute,
      hint: (churchFormField.hint == null)
          ? Container()
          : Text(
              churchFormField.hint,
              style: Theme.of(context).primaryTextTheme.subhead,
            ),
      validators: _validators(),
      items: dropDownList
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(
                "$item",
                style: Theme.of(context).primaryTextTheme.subhead,
              ),
            ),
          )
          .toList(),
    );
  }

  List<String Function(dynamic)> _validators() {
    List<String Function(dynamic)> validators = [];

    if (super.churchFormField.validators == null) return validators;

    if (super.churchFormField.validators.isRequired == "true")
      validators.add(FormBuilderValidators.required());

    if (super.churchFormField.validators.errorText != null)
      validators.add(FormBuilderValidators.required(
          errorText: super.churchFormField.validators.errorText));

    return validators;
  }
}
