/*
*  Filename    :   service_dropdown_form_common.dart
*  Purpose     :   
*  Created     :   2019-07-22 15:24 by Detective Conan
*  Updated     :   2019-07-22 15:24 by Detective Conan
*  Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/form_builder_bottom_sheet.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_common.dart';

class ServiceDropdownFormCommon extends ServiceFormCommon {
  ServiceDropdownFormCommon({ChurchFormField churchFormField})
      : super(churchFormField: churchFormField);

  Widget bottomSheetForm(BuildContext context, List<String> dropDownList) {
    return FormBuilderBottomSheet(
      style: Theme.of(context).primaryTextTheme.caption,
      attribute: super.churchFormField.attribute,
      hint: (churchFormField.hint == null)
          ? Text(
              "",
              style: Theme.of(context).primaryTextTheme.subhead,
            )
          : Text(
              churchFormField.hint,
              style: Theme.of(context).primaryTextTheme.subhead,
            ),
      validators: _validators(),
      items: dropDownList
          .map(
            (item) => Text(
              "$item",
              style: Theme.of(context).primaryTextTheme.subhead,
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

    if (super.churchFormField.errorText != null)
      validators.add(FormBuilderValidators.required(
          errorText: super.churchFormField.errorText));

    return validators;
  }
}

class BottomSelection extends StatelessWidget {
  final ChurchFormField churchFormField;
  final List<String> selection;

  BottomSelection({this.churchFormField, this.selection})
      : assert(churchFormField != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _showModalSheet(context);
        },
        child: ListTile(
          title: Text(
            (churchFormField.hint == null)
                ? "choose ..."
                : churchFormField.hint,
            textAlign: TextAlign.center,
            style: Theme.of(context).primaryTextTheme.title,
          ),
          trailing: Icon(
            Icons.arrow_drop_down,
            size: 20.0,
          ),
          subtitle: Divider(),
        ));
  }

  void _showModalSheet(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: Colors.white),
          child: ListView.builder(
            itemCount: this.selection.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    this.selection[index],
                    style: Theme.of(context).primaryTextTheme.title,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    print("${selection[index]} selected");
                    Navigator.pop(context, selection[index]);
                  },
                ),
              );
            },
          ),
          padding: EdgeInsets.all(30.0),
        );
      },
    );
  }
}
