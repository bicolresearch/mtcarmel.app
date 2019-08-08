/*
*  Filename    :   country_and_related_form_fields.dart
*  Purpose     :	
*  Created     :   2019-08-06 14:34 by Detective Conan
*  Updated     :   2019-08-06 14:34 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/models/barangay_by_city.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/models/city_by_province.dart';
import 'package:mt_carmel_app/src/models/province_by_country.dart';
import 'package:mt_carmel_app/src/repositories/address_repository.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_dropdown_form_common.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_abstract.dart';
import 'dart:convert';

enum FieldsToShow {
  Country,
  Province,
  City,
  Barangay,
  CountryProvinceCityBarangay,
  CountryProvinceCity,
  CountryProvince,
  CountryCity,
  ProvinceCity,
}

class CountryAndRelatedFormFields extends StatefulWidget {
  @required
  final ChurchFormField churchFormField;
  @required
  final FieldsToShow fieldsToShow;

  const CountryAndRelatedFormFields({
    Key key,
    this.churchFormField,
    this.fieldsToShow,
  }) : super(key: key);

  @override
  _CountryAndRelatedFormFieldsState createState() =>
      _CountryAndRelatedFormFieldsState();
}

class _CountryAndRelatedFormFieldsState
    extends State<CountryAndRelatedFormFields> {

  bool _readOnly = false;
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();
  FormBuilderState _formState;
  dynamic _initialValue;

  @override
  void initState() {
//    _initialValue = widget.initialValue ??
//        (_formState.initialValue.containsKey(widget.attribute)
//            ? _formState.initialValue[widget.attribute]
//            : null);

//    _getCountries();
//    _labels = _getLabels();
    _initializeFormState();
    super.initState();
  }

  _initializeFormState(){
    _labels = ["Country","Province",];
    _formState = FormBuilder.of(context);
    for(var label in _labels) {
      final attribute = label.toLowerCase();
      _formState?.registerFieldKey(attribute, _fieldKey);
    }
  }

  @override
  void dispose() {
    for(var label in _labels) {
      final attribute = label.toLowerCase();
      _formState?.unregisterFieldKey(attribute);
    }
    super.dispose();
  }


  List<String> _labels = [];
  List<String> _countries = ["Choose...", "Philippines", "Switzerland", "Japan", "Rusia"];

  List<BarangayByCity> _barangays = [];
  List<CityByProvince> _cities = [];

  List<String> _provincesRepo = ["Pangasinan", "Baguio", "Palawan"];
  List<String> _provincesRepo2 = ["Boracay", "La Union", "Batanes"];
  List<String> _provincesRepo3 = ["Leyte", "Iloilo", "Cagayan"];
  List<String> _provinces = [];
  String _labelText = "Choose...";
  String _provinceValue;
  String _hintText = "Select...";

  final _repository = AddressRepository();
  String _selectedProvince = "Choose...";
//  String _selectedCountry = "Choose...";

  String _selectedCountry;


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[

          FormField(
          enabled: !_readOnly,
          initialValue: _initialValue,
          validator: (val) {

            return null;
          },
          onSaved: (val) {
            _formState?.setAttributeValue("country", val);
          },
          builder: (FormFieldState<dynamic> field) {
            return InputDecorator(
              decoration: InputDecoration(
                errorText: field.errorText,
                border: InputBorder.none,
              ),
              child: DropdownButton(
                isExpanded: true,
                items: _countries
                  .map((country) => DropdownMenuItem(
                  value: country,
                  child: Text("$country")
              )).toList(),
                value: _selectedCountry,
                isDense: true,
                onChanged: (value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  field.didChange(value);
                  _onCountrySelected(value);
                },
              ),
            );
          },
        ),

            // Province
            FormField(

              enabled: !_readOnly,
              initialValue: _initialValue,
              validator: (val) {

                return null;
              },
              onSaved: (val) {
                _formState?.setAttributeValue("province", val);
              },
              builder: (FormFieldState<dynamic> field) {
                return InputDecorator(
                  decoration: InputDecoration(
                    errorText: field.errorText,
                    border: InputBorder.none,
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    items: _provinces
                        .map((country) => DropdownMenuItem(
                        value: country,
                        child: Text("$country")
                    )).toList(),
                    value: _selectedProvince,
                    isDense: true,
                    onChanged: (value) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      field.didChange(value);
                      _onProvinceSelected(value);
                    },
                  ),
                );
              },
            )

          ],
        ),
    );
  }

  _getLabels() {
    switch (widget.fieldsToShow) {
      case FieldsToShow.Country:
        return ["Country"];
      case FieldsToShow.Province:
        return ["Province"];
      case FieldsToShow.City:
        return ["City"];
      case FieldsToShow.Barangay:
        return ["Barangay"];
      case FieldsToShow.CountryProvinceCityBarangay:
        return [
          "Country",
          "Province",
          "City",
          "Barangay",
        ];
      case FieldsToShow.CountryProvinceCity:
        return [
          "Country",
          "Province",
          "City",
        ];
      case FieldsToShow.CountryProvince:
      // TODO: Handle this case.
        break;
      case FieldsToShow.CountryCity:
        return [
          "Country",
          "City",
        ];
      case FieldsToShow.ProvinceCity:
        return [
          "Province",
          "City",
        ];
      default:
        return ["Country"];
    }
  }


  _onCitySelected(String cityCode) {}

  _onBarangaySelected(String barangayCode) {}

  _onCountrySelected(String countryCode) {
    setState(() {
      _selectedProvince = "Choose...";
      _provinces = ["Choose..."];
      _selectedCountry = countryCode;
      if(countryCode == "Philippines")
        _provinces = List.from(_provinces)..addAll(_provincesRepo);
      else if(countryCode == "Japan")
        _provinces = List.from(_provinces)..addAll(_provincesRepo2);
      else if(countryCode == "Switzerland")
        _provinces = List.from(_provinces)..addAll(_provincesRepo3);
    });

  }

  _onProvinceSelected(String provinceCode) {
    setState(() {
      //TODO
//      _selectedCity = "Choose ..";
//      _cities = ["Choose .."];
      _selectedProvince = provinceCode;

    });
  }

  void _getCountries() {
    _countries = _repository.getCountries();
  }
}
