/*
*  Filename    :   date_time_form_field.dart
*  Purpose     :	 Date form field
*  Created     :   2019-07-23 16:11 by Detective Conan
*	 Updated			:   28/11/2019 10:59 AM PM by Detective Conan
*	 Changes			:   Added padding for hours and minutes
*/

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DateTimeFormField extends StatefulWidget {
  @required
  final ChurchFormField churchFormField;

  DateTimeFormField({Key key, this.churchFormField});

  @override
  _DateTimeFormFieldState createState() => _DateTimeFormFieldState();
}

class _DateTimeFormFieldState extends State<DateTimeFormField> {
  final GlobalKey<FormFieldState> _fKey = GlobalKey<FormFieldState>();
  FormBuilderState _formState;
  String _date = "";

  @override
  void initState() {
    _formState = FormBuilder.of(context);
    _formState?.registerFieldKey(widget.churchFormField.attribute, _fKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            widget.churchFormField.labelText,
            style: Theme.of(context)
                .primaryTextTheme
                .subhead
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FormField(
            key: _fKey,
            validator: (val) {
              final validators = _validators();
              for (int i = 0; i < validators.length; i++) {
                if (validators[i](val) != null) return validators[i](val);
              }
              return null;
            },
            onSaved: (val) {
              _formState?.setAttributeValue(
                  widget.churchFormField.attribute, val);
            },
            builder: (FormFieldState<dynamic> field) {
              return InputDecorator(
                decoration: InputDecoration(
                  errorText: field.errorText,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                ),
                child: ListTile(
                  title: Text(
                    _date,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).primaryTextTheme.subhead,
                  ),
                  subtitle: Divider(),
                  onTap: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
//                        minTime: widget.churchFormField.validatorMinDate == null
//                            ? DateTime(1900, 1, 1)
//                            : DateTime.parse(
//                            widget.churchFormField.validatorMinDate),
//                        maxTime: widget.churchFormField.validatorMaxDate == null
//                            ? DateTime.now().add(Duration(days: 365))
//                            : DateTime.parse(
//                            widget.churchFormField.validatorMaxDate),
                        onChanged: (dateTime) {}, onConfirm: (dateTime) {
                      _formState.value[widget.churchFormField.attribute] =
                          "${dateTime.year}-${dateTime.month.toString().padLeft(2, "0")}-${dateTime.day.toString().padLeft(2, "0")}";
                      FocusScope.of(context).requestFocus(FocusNode());
                      field.didChange(
                          "${dateTime.year}-${dateTime.month.toString().padLeft(2, "0")}-${dateTime.day.toString().padLeft(2, "0")}");
                      _date =
                          "${dateToString(dateTime)} ${dateTime.day}, ${dateTime.year} ${dateTime.hour.toString().padLeft(2, "0")}:${dateTime.minute.toString().padLeft(2, "0")}:${dateTime.second.toString().padLeft(2, "0")}";
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _formState?.unregisterFieldKey(widget.churchFormField.attribute);
    super.dispose();
  }

  String dateToString(DateTime date) {
    switch (date.month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 14:
        return "December";
      default:
        return "January";
    }
  }

  List<String Function(dynamic)> _validators() {
    List<String Function(dynamic)> validators = [];

    if (widget.churchFormField.validatorIsRequired == "true")
      validators.add(FormBuilderValidators.required());

    if (widget.churchFormField.validatorIsNumeric == "true")
      validators.add(FormBuilderValidators.numeric());

    if (widget.churchFormField.errorText != null)
      validators.add(FormBuilderValidators.required(
          errorText: widget.churchFormField.errorText));

    return validators;
  }
}
