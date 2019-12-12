/*
*   Filename    :   country_and_other_form_field.dart
*   Purpose     :
*   Created     :   11/12/2019 1:13 PM by Detective Conan
*	 Updated			:   12/12/2019 4:50 PM PM by Detective Conan
*	 Changes			:   Added default Philippine in country field.
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/core/services/repositories/address_repository.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/barangay.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/models/city.dart';
import 'package:mt_carmel_app/src/models/country.dart';
import 'package:mt_carmel_app/src/models/province.dart';

enum FieldSelect {
  CountryField,
  ProvinceField,
  CityField,
}

class CountryAndOtherFormFields extends StatefulWidget {
  final initialCountryCode;
  final initialProvinceCode;
  final initialCityCode;

  const CountryAndOtherFormFields({
    Key key,
    this.initialCountryCode,
    this.initialProvinceCode,
    this.initialCityCode,
  }) : super(key: key);

  @override
  _CountryAndOtherFormFieldState createState() =>
      _CountryAndOtherFormFieldState();
}

class _CountryAndOtherFormFieldState extends State<CountryAndOtherFormFields> {
  final _repository = locator<AddressRepository>();

  final GlobalKey<FormFieldState> _fieldKeyCountry =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _fieldKeyProvince =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _fieldKeyCity = GlobalKey<FormFieldState>();
  FormBuilderState _formState;

  Map<String, GlobalKey<FormFieldState>> _labelAndKeyMap = {};
  List<Country> _countries = [];
  List<City> _cities = [];
  List<Province> _provinces = [];
  String _selectedProvinceName = "Choose...";
  String _selectedCityName = "Choose...";

  String _selectedCountryName;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  _initializeFormState() {
    _labelAndKeyMap = _getLabelAndKeyList();
    final keys = _labelAndKeyMap.keys;
    _formState = FormBuilder.of(context);

    for (String key in keys) {
      _formState?.registerFieldKey(
          "${key.toLowerCase()}", _labelAndKeyMap[key]);
    }
  }

  @override
  void dispose() {
    for (String key in _labelAndKeyMap.keys) {
      _formState?.unregisterFieldKey(
        "${key.toLowerCase()}",
      );
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            "Country",
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FormField(
            key: _fieldKeyCountry,
//            enabled: !_readOnly,
            validator: (val) => FormBuilderValidators.required()(val),
            onSaved: (val) {
              final Country country = val;
              _formState?.setAttributeValue(
                  "country", country?.countryCode ?? null);
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
                      _selectedCountryName ?? "Choose...",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.title,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down,
                    size: 20.0,
                  ),
                  subtitle: Divider(),
                  onTap: () {
                    if (_countries.length <= 1) return;

                    _showModalBottomSheet(
                        context, _countries, field, FieldSelect.CountryField);
                  },
                ),
              );
            },
          ),

          // Province
          Text(
            "Province",
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FormField(
            key: _fieldKeyProvince,
//            enabled: !_readOnly,

            validator: (val) => FormBuilderValidators.required()(val),
            onSaved: (val) {
              if (val == null) return;
              final Province province = val;
              _formState?.setAttributeValue(
                  "province", province?.provinceCode ?? null);
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
                      _selectedProvinceName ?? "Choose...",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.title,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down,
                    size: 20.0,
                  ),
                  subtitle: Divider(),
                  onTap: () {
                    if (_selectedProvinceName == null ||
                        _provinces == null ||
                        _provinces.length <= 1) return;

                    _showModalBottomSheet(
                        context, _provinces, field, FieldSelect.ProvinceField);
                  },
                ),
              );
            },
          ),

          Text(
            "City",
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FormField(
            key: _fieldKeyCity,
//            enabled: !_readOnly,

            validator: (val) => FormBuilderValidators.required()(val),
            onSaved: (val) {
              if (val == null) return;
              final City city = val;
              _formState?.setAttributeValue("city", city?.cityCode ?? null);
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
                      _selectedCityName ?? "Choose...",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.title,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down,
                    size: 20.0,
                  ),
                  subtitle: Divider(),
                  onTap: () {
                    if (_selectedCityName == null ||
                        _cities == null ||
                        _cities.length <= 1) return;

                    _showModalBottomSheet(
                        context, _cities, field, FieldSelect.CityField);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Map<String, GlobalKey<FormFieldState>> _getLabelAndKeyList() {
    Map<String, GlobalKey<FormFieldState>> fields = {};

    fields["country"] = _fieldKeyCountry;
    fields["province"] = _fieldKeyProvince;
    fields["city"] = _fieldKeyCity;

    return fields;
  }

  _onCitySelected(City city) async {
    _selectedCityName = city.name;
    _formState?.setAttributeValue("city", city.id);
    setState(() {});
  }

  _onCountrySelected(Country country) async {
    _selectedCountryName = country.name;
    //province
    if (_fieldKeyProvince.currentState != null) {
      _selectedProvinceName = "Choose...";
      _provinces = [];
      _provinces = await _repository
          .getProvinceByCountryCode(country?.countryCode ?? null)
          .catchError(
        (e) {
          print(e);
          _provinces = [];
        },
      );
      _fieldKeyProvince.currentState?.didChange(null);
      _formState?.setAttributeValue("province", null);
    }
    // city
    if (_fieldKeyCity.currentState != null) {
      _selectedCityName = "Choose...";
      _cities = [];
      _fieldKeyCity.currentState?.didChange(null);
      _formState?.setAttributeValue("city", null);
    }
    setState(
      () {},
    );
  }

  _onProvinceSelected(Province province) async {
    _selectedProvinceName = province.name;

    // city
    if (_fieldKeyCity.currentState != null) {
      _selectedCityName = "Choose...";
      _cities = await _repository
          .getCityByProvinceCode(province?.provinceCode ?? null)
          .catchError(
        (e) {
          print(e);
          _cities = [];
        },
      );
      _fieldKeyCity.currentState?.didChange(null);
      _formState?.setAttributeValue("city", null);
    }
    setState(
      () {},
    );
  }

  void _showModalBottomSheet(
    context,
    selection,
    FormFieldState<dynamic> field,
    FieldSelect selectedField,
  ) {
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
                  style: Theme.of(context).primaryTextTheme.title,
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  field.didChange(selection[index]);
                  switch (selectedField) {
                    case FieldSelect.CountryField:
                      _onCountrySelected(selection[index]);
                      break;
                    case FieldSelect.ProvinceField:
                      _onProvinceSelected(selection[index]);
                      break;
                    case FieldSelect.CityField:
                      _onCitySelected(selection[index]);

                      break;
                  }
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

  void _initialize() {
    _initializeFormState();
    _initialValues();
  }

  Future _initializeCountryList() async {
    _countries = await _repository.getCountries().catchError(
      (e) {
        print(e);
        return;
      },
    );
    setState(() {});
  }

  List<String Function(dynamic)> _validators() {
    List<String Function(dynamic)> validators = [];

//      validators.add(FormBuilderValidators.required());

    return validators;
  }

  Future _initialValues() async {
    await _initializeCountryList();
    if (_countries.any((country) {
      return country.countryCode == widget.initialCountryCode ?? null;
    })) {
      Country selectedCountry = _countries.firstWhere(
          (country) => country.countryCode == widget.initialCountryCode);
      _selectedCountryName = selectedCountry.name;
      _fieldKeyCountry.currentState.didChange(selectedCountry);
      _provinces = await _repository
          .getProvinceByCountryCode(widget.initialCountryCode)
          .catchError(
        (e) {
          print(e);
          _provinces = [];
        },
      );
      if (_provinces.any((province) {
        return province.provinceCode == widget.initialProvinceCode ?? null;
      })) {
        Province initialProvince = _provinces.firstWhere(
            (province) => province.provinceCode == widget.initialProvinceCode);
        _selectedProvinceName = initialProvince.name;
        _fieldKeyProvince.currentState?.didChange(initialProvince);
        _cities = await _repository
            .getCityByProvinceCode(widget.initialProvinceCode)
            .catchError(
          (e) {
            print(e);
            _provinces = [];
          },
        );
        if (_cities.any((city) {
          return city.cityCode == widget.initialCityCode ?? null;
        })) {
          City initialCity = _cities
              .firstWhere((city) => city.cityCode == widget.initialCityCode);
          _selectedCityName = initialCity.name;
          _fieldKeyCity.currentState?.didChange(initialCity);
        }
      }
      setState(() {});
    } else {
      Country selectedCountry = _countries.firstWhere((country) =>
          country.countryCode == "01"); // Philippine code as default
      _selectedCountryName = selectedCountry.name;
      _fieldKeyCountry.currentState.didChange(selectedCountry);
      _provinces = await _repository
          .getProvinceByCountryCode("01")
          .catchError(
        (e) {
          print(e);
          _provinces = [];
          return;
        },
      );
      _fieldKeyProvince.currentState?.didChange(null);
      _formState?.setAttributeValue("province", null);
      setState(() {});
    }
  }
}
