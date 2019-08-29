/*
*  Filename    :   selection_form_field.dart
*  Purpose     :	
*  Created     :   2019-08-22 12:16 by Detective Conan
*  Updated     :   2019-08-22 12:16 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/selection_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/models/selection_api.dart';

class SelectionFormField extends StatefulWidget {
  @required
  final ChurchFormField churchFormField;

  const SelectionFormField({
    Key key,
    this.churchFormField,
  }) : super(key: key);

  @override
  _SelectionFormFieldState createState() => _SelectionFormFieldState();
}

class _SelectionFormFieldState extends State<SelectionFormField> {

  bool _readOnly = false;
  final GlobalKey<FormFieldState> _fKey = GlobalKey<FormFieldState>();
  FormBuilderState _formState;
  dynamic _initialValue;

  List<SelectionApi> _fieldSelection = [];

  String _selected = "Choose...";

  @override
  void initState() {
    _initialize();

    super.initState();
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
            style: Theme
                .of(context)
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
              if (validators == null)
                return null;

              for (int i = 0; i < validators.length; i++) {
                if (validators[i](val) != null)
                  return validators[i](val);
              }
              return null;
            },
            onSaved: (val) {
              if (val == null) return;
              final SelectionApi selectionApi = val;
              _formState?.setAttributeValue(
                  "${widget.churchFormField.attribute}", selectionApi.id);
            },
            builder: (FormFieldState<dynamic> field) {
              return InputDecorator(
                decoration: InputDecoration(
                  errorText: field.errorText,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      _selected ?? "Choose...",
                      textAlign: TextAlign.center,
                      style: Theme
                          .of(context)
                          .primaryTextTheme
                          .subhead,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down,
                    size: 20.0,
                  ),
                  subtitle: Divider(),
                  onTap: () {
                    if (_fieldSelection.isNotEmpty) {
                      _showModalBottomSheet(
                        context,
                        _fieldSelection,
                        field,
                      );
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(context,
      selection,
      FormFieldState<dynamic> field,) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return Container(
          height: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: Colors.white),
          child: ListView.builder(
            itemCount: selection.length,
            itemBuilder: (context, index) {
              final name = selection[index].name;
              return ListTile(
                title: Text(
                  name,
                  style: Theme
                      .of(context)
                      .primaryTextTheme
                      .subtitle,
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  field.didChange(selection[index]);
                  _selected = selection[index].name;
                  Navigator.pop(
                    context,
                  );
                },
              );
            },
          ),
        );
      },
    );
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

  void _initialize() {
    _initializeSelection();
    _initializeFormState();
  }

  Future _initializeSelection() async {
    final selectionService = locator<SelectionService>();
    await selectionService.getSelection(
        "${AppConstants.API_BASE_URL}${widget.churchFormField.selections}")
        .then((value) {
      _fieldSelection = value ?? [];
    }).catchError((error) {
      debugPrint(error);
    });
  }
}
