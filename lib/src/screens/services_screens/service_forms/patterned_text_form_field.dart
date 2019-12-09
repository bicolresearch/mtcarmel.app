/*
*   Filename    :   patterned_text_form_field.dart
*   Purpose     :   Used for the inputting text with pattern
*   Created     :   09/12/2019 9:54 AM by Detective Conan
*   Updated     :   09/12/2019 9:54 AM by Detective Conan
*   Changes     :
*
*
*   Mask Options #
    In mask, you can use the following characters:

      0: accept numbers
      A: accept letters
      @: accept numbers and letters
      *: accept any character
*/

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PatternedTextFormField extends StatefulWidget {
  @required
  final ChurchFormField churchFormField;
  final String mask;

  const PatternedTextFormField({
    Key key,
    this.churchFormField,
    this.mask,
  }) : super(key: key);

  @override
  _PatternedTextFormFieldState createState() => _PatternedTextFormFieldState();
}

class _PatternedTextFormFieldState extends State<PatternedTextFormField> {
  bool _readOnly = false;
  final GlobalKey<FormFieldState> _fKey = GlobalKey<FormFieldState>();
  FormBuilderState _formState;
  dynamic _initialValue;

  var controller;

  @override
  void initState() {
    super.initState();
//    controller = MaskedTextController(mask: 'AAAA AAAAA');
    controller = MaskedTextController(mask: "${widget.mask}");
    _initializeFormState();
  }

  _initializeFormState() {
    _formState = FormBuilder.of(context);
    _formState?.registerFieldKey("${widget.churchFormField.attribute}", _fKey);
  }

  @override
  void dispose() {
    _formState?.unregisterFieldKey("${widget.churchFormField.attribute}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            "${widget.churchFormField.labelText}",
            style: Theme.of(context)
                .primaryTextTheme
                .subhead
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FormField(
            key: _fKey,
            enabled: !_readOnly,
            initialValue: _initialValue,
            validator: (val) {
              final validators = _validators();
              if (validators == null) return null;

              for (int i = 0; i < validators.length; i++) {
                if (validators[i](val) != null) return validators[i](val);
              }
              return null;
            },
            onSaved: (val) {
              _formState?.setAttributeValue(
                  "${widget.churchFormField.attribute}", val);
            },
            builder: (FormFieldState<dynamic> field) {
              return InputDecorator(
                decoration: InputDecoration(
                  errorText: field.errorText,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                ),
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  List<String Function(dynamic)> _validators() {
    List<String Function(dynamic)> validators = [];

    _fKey.currentState.didChange(controller.text);

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
