
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service_type.dart';

class ServiceFormCommon extends StatelessWidget {

  @required
  final ChurchFormField churchFormField;

  const ServiceFormCommon({Key key, this.churchFormField}) : super(key: key);
  Widget labelText(BuildContext context, String label){
    return Text(
      label,
      style: Theme.of(context)
          .primaryTextTheme
          .title
          .copyWith(fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


