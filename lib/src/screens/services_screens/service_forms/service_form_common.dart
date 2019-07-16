
import 'package:flutter/material.dart';

class ServiceFormCommon extends StatelessWidget {

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


