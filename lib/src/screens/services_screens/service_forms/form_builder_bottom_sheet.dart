/*
*  Filename    :   form_builder_bottom_sheet.dart
*  Purpose     :	
*  Created     :   2019-08-05 13:46 by Detective Conan
*  Updated     :   2019-08-05 13:46 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderBottomSheet extends StatefulWidget {
  final String attribute;
  final List<FormFieldValidator> validators;
  final dynamic initialValue;
  final bool readOnly;
  final InputDecoration decoration;
  final ValueChanged onChanged;
  final ValueTransformer valueTransformer;

  final Widget hint;
  final List<Text> items;
  final bool isExpanded;
  final TextStyle style;
  final bool isDense;
  final int elevation;
  final Widget disabledHint;
  final double iconSize;
  final Widget underline;
  final Widget icon;
  final Color iconDisabledColor;
  final Color iconEnabledColor;

  FormBuilderBottomSheet({
    @required this.attribute,
    @required this.items,
    this.validators = const [],
    this.readOnly = false,
    this.decoration = const InputDecoration(),
    this.isExpanded = true,
    this.isDense = false,
    this.elevation = 8,
    this.iconSize = 24.0,
    this.hint,
    this.initialValue,
    this.style,
    this.disabledHint,
    this.onChanged,
    this.valueTransformer,
    this.underline,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
  });

  @override
  _FormBuilderBottomSheetState createState() => _FormBuilderBottomSheetState();
}

class _FormBuilderBottomSheetState extends State<FormBuilderBottomSheet> {
  bool _readOnly = false;
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();
  FormBuilderState _formState;
  dynamic _initialValue;

  @override
  void initState() {
    _formState = FormBuilder.of(context);
    _formState?.registerFieldKey(widget.attribute, _fieldKey);
    _initialValue = widget.initialValue ??
        (_formState.initialValue.containsKey(widget.attribute)
            ? _formState.initialValue[widget.attribute]
            : null);
    super.initState();
  }

  @override
  void dispose() {
    _formState?.unregisterFieldKey(widget.attribute);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _readOnly = (_formState?.readOnly == true) ? true : widget.readOnly;
    return FormField(
      key: _fieldKey,
      enabled: !_readOnly,
      initialValue: _initialValue,
      validator: (val) {
        for (int i = 0; i < widget.validators.length; i++) {
          if (widget.validators[i](val) != null)
            return widget.validators[i](val);
        }
        return null;
      },
      onSaved: (val) {
        if (widget.valueTransformer != null) {
          var transformed = widget.valueTransformer(val);
          _formState?.setAttributeValue(widget.attribute, transformed);
        } else
          _formState?.setAttributeValue(widget.attribute, val);
      },
      builder: (FormFieldState<dynamic> field) {
        return InputDecorator(
          decoration: widget.decoration.copyWith(
            errorText: field.errorText,
            border: InputBorder.none,
          ),
          child: BottomSelection(
              hint: widget.hint,
              selection: widget.items,
              fieldKey: _fieldKey,
              formState: _formState,
              attribute: widget.attribute),
        );
      },
    );
  }
}

class BottomSelection extends StatefulWidget {
  final Text hint;
  final List<Text> selection;
  final FormBuilderState formState;
  final GlobalKey<FormFieldState> fieldKey;
  final String attribute;

  BottomSelection(
      {this.hint,
      this.selection,
      this.formState,
      this.fieldKey,
      this.attribute});

  @override
  _BottomSelectionState createState() => _BottomSelectionState();
}

class _BottomSelectionState extends State<BottomSelection> {
  String _value = "Choose...";

  @override
  void initState() {
    super.initState();
    if (widget.hint != null) _value = widget.hint.data;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showModalSheet(context);
      },
      child: ListTile(
        title: Text(
          _value,
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.title,
        ),
        trailing: Icon(
          Icons.arrow_drop_down,
          size: 20.0,
        ),
        subtitle: Divider(),
      ),
    );
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
            itemCount: this.widget.selection.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    widget.selection[index].data,
                    style: Theme.of(context).primaryTextTheme.title,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    print("${widget.selection[index].data} selected");
                    setState(() {
                      _value = widget.selection[index].data;
                      widget.formState.value[widget.attribute] = _value;
                      widget.fieldKey.currentState.setValue(_value);
                      widget.fieldKey.currentState.setState(() {
                        widget.formState.setState(() {});
                      });
                      Navigator.pop(context);
                    });
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
