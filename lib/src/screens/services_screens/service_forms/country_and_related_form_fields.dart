/*
*  Filename    :   country_and_related_form_fields.dart
*  Purpose     :	
*  Created     :   2019-08-06 14:34 by Detective Conan
*  Updated     :   2019-08-09 16:07 by Detective conan
*  Changes     :   Implemented countries, provinces, cities and barangays bottom sheet
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

enum FieldsToShow {
  Country,
  Region,
  Province,
  City,
  Barangay,
  CountryRegionProvinceCityBarangay,
  CountryRegionProvinceCity,
  CountryRegionProvince,
  CountryRegion,
  CountryProvinceCityBarangay,
  CountryProvinceCity,
  CountryProvince,
  CountryCity,
  ProvinceCity,
}

enum FieldSelect {
  CountryField,
  RegionField,
  ProvinceField,
  CityField,
  BarangayField,
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
  final _repository = locator<AddressRepository>();

  bool _readOnly = false;
  final GlobalKey<FormFieldState> _fieldKeyCountry =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _fieldKeyProvince =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _fieldKeyCity = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _fieldKeyBarangay =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _fieldKeyRegion = GlobalKey<FormFieldState>();
  FormBuilderState _formState;
  dynamic _initialValue;

  Map<String, GlobalKey<FormFieldState>> _labelAndKeyMap = {};
  List<Country> _countries;

  //TODO add region
  //List<Region> _regions = [];

  List<Barangay> _barangays = [];
  List<City> _cities = [];

  List<Province> _provinces = [];

  String _selectedProvince = "Choose...";
  String _selectedRegion = "Choose...";
  String _selectedCity = "Choose...";
  String _selectedBarangay = "Choose...";

  String _selectedCountry;

  @override
  void initState() {
    _initialize();

    super.initState();
  }

  _initializeFormState() {
    _labelAndKeyMap = _getLabelAndKeyList();
    final keys = _labelAndKeyMap.keys;
    print(keys);
    _formState = FormBuilder.of(context);

    for (String key in keys) {
      _formState?.registerFieldKey(
          "${key.toLowerCase()}_code", _labelAndKeyMap[key]);
    }
  }

  @override
  void dispose() {
    final keys = _labelAndKeyMap.keys;

    for (String key in keys) {
      _formState?.unregisterFieldKey(
        "${key.toLowerCase()}_code",
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
          !_labelAndKeyMap.containsKey("Country")
              ? Container()
              : Text(
                  "Country",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
          !_labelAndKeyMap.containsKey("Country")
              ? Container()
              : FormField(
                  key: _fieldKeyCountry,
                  enabled: !_readOnly,
                  initialValue: _initialValue,
                  validator: (val) {
                    return null;
                  },
                  onSaved: (val) {
                    final Country country = val;
                    _formState?.setAttributeValue(
                        "country_code", country.countryCode);
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
                            _selectedCountry ?? "Choose...",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).primaryTextTheme.subhead,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_drop_down,
                          size: 20.0,
                        ),
                        subtitle: Divider(),
                        onTap: () {
                          if (_countries.length <= 1) return;

                          _showModalBottomSheet(context, _countries, field,
                              FieldSelect.CountryField);
                        },
                      ),
                    );
                  },
                ),

          // Province
          !_labelAndKeyMap.containsKey("Province")
              ? Container()
              : Text(
                  "Province",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
          !_labelAndKeyMap.containsKey("Province")
              ? Container()
              : FormField(
                  key: _fieldKeyProvince,
                  enabled: !_readOnly,
                  initialValue: _initialValue,
                  validator: (val) {
                    return null;
                  },
                  onSaved: (val) {
                    if (val == null) return;
                    final Province province = val;
                    _formState?.setAttributeValue(
                        "province_code", province.provinceCode);
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
                            _selectedProvince ?? "Choose...",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).primaryTextTheme.subhead,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_drop_down,
                          size: 20.0,
                        ),
                        subtitle: Divider(),
                        onTap: () {
                          if (_selectedProvince == null ||
                              _provinces == null ||
                              _provinces.length <= 1) return;

                          _showModalBottomSheet(context, _provinces, field,
                              FieldSelect.ProvinceField);
                        },
                      ),
                    );
                  },
                ),

          //TODO add Region
          // Region
//          !_labelAndKeyMap.containsKey("Region")
//              ? Container()
//              : Text(
//                  "Region",
//                  style: Theme.of(context)
//                      .primaryTextTheme
//                      .subhead
//                      .copyWith(fontWeight: FontWeight.bold),
//                  textAlign: TextAlign.center,
//                ),
//          !_labelAndKeyMap.containsKey("Region")
//              ? Container()
//              : FormField(
//                  key: _fieldKeyRegion,
//                  enabled: !_readOnly,
//                  initialValue: _initialValue,
//                  validator: (val) {
//                    return null;
//                  },
//                  onSaved: (val) {
//                    _formState?.setAttributeValue("region", val);
//                  },
//                  builder: (FormFieldState<dynamic> field) {
//                    return InputDecorator(
//                      decoration: InputDecoration(
//                        errorText: field.errorText,
//                        border: InputBorder.none,
//                        contentPadding: EdgeInsets.all(0),
//                      ),
//                      child: ListTile(
//                        title: Padding(
//                          padding: const EdgeInsets.only(left: 40.0),
//                          child: Text(
//                            _selectedRegion ?? "Choose...",
//                            textAlign: TextAlign.center,
//                            style: Theme.of(context).primaryTextTheme.subhead,
//                          ),
//                        ),
//                        trailing: Icon(
//                          Icons.arrow_drop_down,
//                          size: 20.0,
//                        ),
//                        subtitle: Divider(),
//                        onTap: () {
//                          if (_selectedRegion == null || _provinces.length <= 1)
//                            return;
//
//                          _showModalBottomSheet(context, _regions, field,
//                              FieldSelect.RegionField);
//                        },
//                      ),
//                    );
//                  },
//                ),

          // City
          !_labelAndKeyMap.containsKey("City")
              ? Container()
              : Text(
                  "City",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
          !_labelAndKeyMap.containsKey("City")
              ? Container()
              : FormField(
                  key: _fieldKeyCity,
                  enabled: !_readOnly,
                  initialValue: _initialValue,
                  validator: (val) {
                    return null;
                  },
                  onSaved: (val) {
                    if (val == null) return;
                    final City city = val;
                    _formState?.setAttributeValue("city_code", city.cityCode);
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
                            _selectedCity ?? "Choose...",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).primaryTextTheme.subhead,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_drop_down,
                          size: 20.0,
                        ),
                        subtitle: Divider(),
                        onTap: () {
                          if (_selectedCity == null ||
                              _cities == null ||
                              _cities.length <= 1) return;

                          _showModalBottomSheet(
                              context, _cities, field, FieldSelect.CityField);
                        },
                      ),
                    );
                  },
                ),

          // Barangay
          !_labelAndKeyMap.containsKey("Barangay")
              ? Container()
              : Text(
                  "Barangay",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
          !_labelAndKeyMap.containsKey("Barangay")
              ? Container()
              : FormField(
                  key: _fieldKeyBarangay,
                  enabled: !_readOnly,
                  initialValue: _initialValue,
                  validator: (val) {
                    return null;
                  },
                  onSaved: (val) {
                    if (val == null) return;

                    final Barangay barangay = val;
                    _formState?.setAttributeValue(
                        "barangay_code", barangay.brgyCode);
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
                            _selectedBarangay ?? "Choose...",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).primaryTextTheme.subhead,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_drop_down,
                          size: 20.0,
                        ),
                        subtitle: Divider(),
                        onTap: () {
                          if (_selectedBarangay == null ||
                              _barangays == null ||
                              _barangays.length <= 1) return;

                          _showModalBottomSheet(context, _barangays, field,
                              FieldSelect.BarangayField);
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

    switch (widget.fieldsToShow) {
      case FieldsToShow.Country:
        fields["Country"] = _fieldKeyCountry;
        break;
      case FieldsToShow.Region:
        // TODO add region
        //fields["Region"] = _fieldKeyRegion;
        break;
      case FieldsToShow.Province:
        fields["Province"] = _fieldKeyProvince;
        break;
      case FieldsToShow.City:
        fields["City"] = _fieldKeyCity;
        break;
      case FieldsToShow.Barangay:
        fields["Barangay"] = _fieldKeyBarangay;
        break;
      case FieldsToShow.CountryProvinceCityBarangay:
        fields["Country"] = _fieldKeyCountry;
        fields["Province"] = _fieldKeyProvince;
        fields["City"] = _fieldKeyCity;
        fields["Barangay"] = _fieldKeyBarangay;
        break;
      case FieldsToShow.CountryProvinceCity:
        fields["Country"] = _fieldKeyCountry;
        fields["Province"] = _fieldKeyProvince;
        fields["City"] = _fieldKeyCity;
        break;
      case FieldsToShow.CountryProvince:
        fields["Country"] = _fieldKeyCountry;
        fields["Province"] = _fieldKeyProvince;
        break;
      case FieldsToShow.CountryCity:
        fields["Country"] = _fieldKeyCountry;
        fields["City"] = _fieldKeyCity;
        break;
      case FieldsToShow.ProvinceCity:
        fields["Province"] = _fieldKeyProvince;
        fields["City"] = _fieldKeyCity;
        break;
      case FieldsToShow.CountryRegionProvinceCityBarangay:
        fields["Country"] = _fieldKeyCountry;
        // TODO add region
        //fields["Region"] = _fieldKeyRegion;
        fields["Province"] = _fieldKeyProvince;
        fields["City"] = _fieldKeyCity;
        fields["Barangay"] = _fieldKeyBarangay;
        break;
      case FieldsToShow.CountryRegionProvinceCity:
        fields["Country"] = _fieldKeyCountry;
        // TODO add region
        //fields["Region"] = _fieldKeyRegion;
        fields["Province"] = _fieldKeyProvince;
        fields["City"] = _fieldKeyCity;
        break;
      case FieldsToShow.CountryRegionProvince:
        fields["Country"] = _fieldKeyCountry;
        // TODO add Region
        //fields["Region"] = _fieldKeyRegion;
        fields["Province"] = _fieldKeyProvince;
        break;
      case FieldsToShow.CountryRegion:
        fields["Country"] = _fieldKeyCountry;
        // TODO add region
        //fields["Region"] = _fieldKeyRegion;
        break;
    }
    return fields;
  }

  // TODO Add Region
//  _onRegionSelected(Region region) {
//    setState(
//          () {
//        _selectedCRegion = region.name;
//
//        //province
//        if(_fieldKeyProvince.currentState != null) {
//          _selectedProvince = "Choose...";
//          _provinces = ["Choose..."];
//          _fieldKeyProvince.currentState?.didChange(null);
//        }
//        // city
//        if(_fieldKeyCity.currentState != null) {
//          _selectedCity = "Choose...";
//          _cities = ["Choose..."];
//          _fieldKeyCity.currentState?.didChange(null);
//        }
//        // barangay
//        if(_fieldKeyBarangay.currentState != null) {
//          _selectedBarangay = "Choose...";
//          _barangays = ["Choose..."];
//          _fieldKeyBarangay.currentState?.didChange(null);
//        }
//      },
//    );
//  }

  _onCitySelected(City city) async {
    _selectedCity = city.name;

    // barangay
    if (_fieldKeyBarangay.currentState != null) {
      _selectedBarangay = "Choose...";
      _barangays =
          await _repository.getBarangayByCityCode(city.cityCode).catchError(
        (e) {
          print(e);
          _barangays = [];
        },
      );
      _fieldKeyBarangay.currentState?.didChange(null);
    }
    setState(() {});
  }

  _onBarangaySelected(Barangay barangay) {
    _selectedBarangay = barangay.name;
  }

  _onCountrySelected(Country country) async {
    _selectedCountry = country.name;

    //TODO add region
    // region
//        if(_fieldKeyRegion.currentState != null) {
//          _selectedRegion = "Choose...";
//          _regions = [];
//          _fieldKeyRegion.currentState?.didChange(null);
//        }
    //province
    if (_fieldKeyProvince.currentState != null) {
      _selectedProvince = "Choose...";
      _provinces = [];
      _provinces = await _repository
          .getProvinceByCountryCode(country.countryCode)
          .catchError(
        (e) {
          print(e);
          _provinces = [];
        },
      );
      _fieldKeyProvince.currentState?.didChange(null);
    }
    // city
    if (_fieldKeyCity.currentState != null) {
      _selectedCity = "Choose...";
      _cities = [];
      _fieldKeyCity.currentState?.didChange(null);
    }
    // barangay
    if (_fieldKeyBarangay.currentState != null) {
      _selectedBarangay = "Choose...";
      _barangays = [];
      _fieldKeyBarangay.currentState?.didChange(null);
    }
    setState(
      () {},
    );
  }

  _onProvinceSelected(Province province) async {
    _selectedProvince = province.name;

    // city
    if (_fieldKeyCity.currentState != null) {
      _selectedCity = "Choose...";
      _cities = await _repository
          .getCityByProvinceCode(province.provinceCode)
          .catchError(
        (e) {
          print(e);
          _cities = [];
        },
      );
      _fieldKeyCity.currentState?.didChange(null);
    }
    // barangay
    if (_fieldKeyBarangay.currentState != null) {
      _selectedBarangay = "Choose...";
      _barangays = [];
      _fieldKeyBarangay.currentState?.didChange(null);
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
                  style: Theme.of(context).primaryTextTheme.subtitle,
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
                    case FieldSelect.BarangayField:
                      _onBarangaySelected(selection[index]);
                      break;
                    case FieldSelect.RegionField:
                      //TODO add region
                      //_onRegionSelected(selection[index]);
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
    _initializeCountryList();
    _initializeFormState();
  }

  Future _initializeCountryList() async {
    _countries = await _repository.getCountries().catchError(
      (e) {
        print(e);
      },
    );
  }
}
