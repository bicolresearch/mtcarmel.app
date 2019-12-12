/*
*   Filename    :   patterned_form_field.dart
*   Purpose     :
*   Created     :   11/12/2019 2:07 PM by Detective Conan
*	 Updated			:   12/12/2019 1:45 PM PM by Detective Conan
*	 Changes			:   Added initial value of the text field. Changed the color.
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
  final String initialValue;
  final List<FormFieldValidator> validators;

  const PatternedFormField({
    Key key,
    this.mask,
    @required this.attribute,
    this.label,
    this.hintText,
    this.textAlign = TextAlign.center,
    this.validators,
    this.initialValue,
  }) : super(key: key);

  @override
  _PatternedFormFieldState createState() => _PatternedFormFieldState();
}

class _PatternedFormFieldState extends State<PatternedFormField> {
  bool _readOnly = false;
  final GlobalKey<FormFieldState> _fKey = GlobalKey<FormFieldState>();
  FormBuilderState _formState;
  dynamic _initialValue;

  MaskedTextController controller;

  @override
  void initState() {
    super.initState();
    controller = MaskedTextController(
        mask: "${widget.mask}", text: widget.initialValue ?? "");
    _initializeFormState();
  }

  _initializeFormState() {
    _formState = FormBuilder.of(context);
    _formState?.registerFieldKey("${widget.attribute}", _fKey);
  }

  @override
  void dispose() {
    _formState?.unregisterFieldKey("${widget.attribute}");
    controller.dispose();
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
              var validators = widget.validators;
              if (validators == null) return null;

              validators.add(
                FormBuilderValidators.pattern(
                    "".padRight(widget.mask.length, "."),
                    errorText: "Not valid. Follow this pattern ${widget.mask}"),
              );
              for (int i = 0; i < validators.length; i++) {
                if (validators[i](val) != null) return validators[i](val);
              }
              return null;
            },
            onSaved: (val) {
              controller.updateText(val);
              var newVal = controller.text;
              _fKey.currentState.didChange(newVal);
              _formState.setAttributeValue("${widget.attribute}", newVal);
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
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: widget.textAlign,
                  onChanged: (val) {
                    controller.updateText(val);
                    var newVal = controller.text;
                    _fKey.currentState.didChange(newVal);
                    _formState.setAttributeValue("${widget.attribute}", newVal);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
