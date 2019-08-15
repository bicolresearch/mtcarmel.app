/*
*  Filename    :   date_form_field.dart
*  Purpose     :	 Date form field
*  Created     :   2019-07-23 16:11 by Detective Conan
*  Updated     :   2019-08-15 11:00 by Detective conan
*  Changes     :   changed to bottom sheet modal picker.
*/

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DateFormField extends StatefulWidget {

  @required
  final ChurchFormField churchFormField;

  DateFormField({Key key, this.churchFormField});

  @override
  _DateFormFieldState createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {

  final GlobalKey<FormFieldState> _fKey =
  GlobalKey<FormFieldState>();
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
            style: Theme
                .of(context)
                .primaryTextTheme
                .subhead
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          FormField(
            key: _fKey,
            // TODO
            validator: (val) {
              return null;
            },
            onSaved: (val) {
              _formState?.setAttributeValue(
                  widget.churchFormField.attribute, val.toString());
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
                      style: Theme
                          .of(context)
                          .primaryTextTheme
                          .subhead,
                    ),
                  subtitle: Divider(),
                  onTap: () {
                    print("date");
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900, 1, 1),
                        maxTime: DateTime(2050, 12, 12),
                        onChanged: (date) {},
                        onConfirm: (date) {
                          _formState.value[widget.churchFormField.attribute] =
                              date;
                          FocusScope.of(context).requestFocus(FocusNode());
                          field.didChange(date);
                          _date = "${dateToString(date)} ${date.day}, ${date.year}";
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.en);
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

  String dateToString(DateTime date){

    switch(date.month){
      case 1: return "January";
      case 2: return "February";
      case 3: return "March";
      case 4: return "April";
      case 5: return "May";
      case 6: return "June";
      case 7: return "July";
      case 8: return "August";
      case 9: return "September";
      case 10: return "October";
      case 11: return "November";
      case 14: return "December";
      default:
        return "January";
    }
  }


  List<String Function(dynamic)> _validators() {
    List<String Function(dynamic)> validators = [];

    if (widget.churchFormField.validators == null) return validators;

    if (widget.churchFormField.validators.isRequired == "true")
      validators.add(FormBuilderValidators.required());

    if (widget.churchFormField.validators.isNumeric != null
        &&
        widget.churchFormField.validators.isNumeric == "true"
    )
      validators.add(FormBuilderValidators.numeric());

    if (widget.churchFormField.errorText != null
    )
      validators.add(FormBuilderValidators.required(
          errorText: widget.churchFormField.errorText));

    return validators;
  }
}