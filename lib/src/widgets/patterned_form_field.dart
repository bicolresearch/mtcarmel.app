/*
*   Filename    :   patterned_form_field.dart
*   Purpose     :
*   Created     :   11/12/2019 2:07 PM by Detective Conan
*   Updated     :   11/12/2019 2:07 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class PatternedFormField extends StatefulWidget {
  final String mask;
  final String attribute;
  final String label;
  final String hintText;
  final TextAlign textAlign;
  final List<FormFieldValidator> validators;

  const PatternedFormField({
    Key key,
    this.mask,
    @required this.attribute,
    this.label,
    this.hintText,
    this.textAlign = TextAlign.center,
    this.validators,
  }) : super(key: key);

  @override
  _PatternedFormFieldState createState() => _PatternedFormFieldState();
}

class _PatternedFormFieldState extends State<PatternedFormField> {
  bool _readOnly = false;
  final GlobalKey<FormFieldState> _fKey = GlobalKey<FormFieldState>();
  FormBuilderState _formState;
  dynamic _initialValue;

  var controller;

  @override
  void initState() {
    super.initState();
    controller = MaskedTextController(mask: "${widget.mask}");
    _initializeFormState();
  }

  _initializeFormState() {
    _formState = FormBuilder.of(context);
    _formState?.registerFieldKey("${widget.attribute}", _fKey);
  }

  @override
  void dispose() {
    _formState?.unregisterFieldKey("${widget.attribute}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            "${widget.label ?? ""}",
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FormField(
            key: _fKey,
            enabled: !_readOnly,
            initialValue: _initialValue,
            validator: (val) {

              final validators = widget.validators;
              if (validators == null) return null;

              for (int i = 0; i < validators.length; i++) {
                if (validators[i](val) != null) return validators[i](val);
              }
              return null;
            },
            onSaved: (val) {

              _fKey.currentState.didChange(controller.text);
              _formState?.setAttributeValue("${widget.attribute}", val);
            },
            builder: (FormFieldState<dynamic> field) {
              return InputDecorator(
                decoration: InputDecoration(
                  errorText: field.errorText,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintText: widget.hintText,
                ),
                child: TextField(
                  controller: controller,
                  textAlign: widget.textAlign,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
