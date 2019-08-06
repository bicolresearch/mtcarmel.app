/*
*  Filename    :   country_and_related_form_fields.dart
*  Purpose     :	
*  Created     :   2019-08-06 14:34 by Detective Conan
*  Updated     :   2019-08-06 14:34 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_dropdown_form_common.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_abstract.dart';

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

  const CountryAndRelatedFormFields(
      {Key key, this.churchFormField, this.fieldsToShow})
      : super(key: key);

  @override
  _CountryAndRelatedFormFieldsState createState() =>
      _CountryAndRelatedFormFieldsState();
}

class _CountryAndRelatedFormFieldsState
    extends State<CountryAndRelatedFormFields> {
  List<String> labels = [];

  List<String> currentFields = [];

  @override
  void initState() {
    super.initState();
    labels = _labels();
    currentFields = labels.sublist(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  _labels() {
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

  @override
  void dispose() {
    super.dispose();
  }
}
//
//class RelatedFormFields extends ServiceDropdownFormCommon
//    implements ServiceFormAbstract {
//  final _list = ["Yes", "No"];
//
//  RelatedFormFields({churchFormField}) : super(churchFormField: churchFormField);
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: Column(
//        children: <Widget>[
//          labelText(context, churchFormField.labelText),
//          buildForm(context),
//        ],
//      ),
//    );
//  }
//
//  @override
//  Widget buildForm(BuildContext context) {
//    return super.bottomSheetForm(context, _list);
//  }
//
//}
