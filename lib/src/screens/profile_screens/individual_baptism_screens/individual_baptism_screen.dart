/*
*   Filename    :   individual_baptism_screen.dart
*   Purpose     :
*   Created     :   22/11/2019 9:19 AM by Detective Conan
*   Updated     :   22/11/2019 9:19 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndividualBaptismScreen extends StatefulWidget {
  @override
  _IndividualBaptismScreenState createState() => _IndividualBaptismScreenState();
}

class _IndividualBaptismScreenState extends State<IndividualBaptismScreen> {
  @override
  Widget build(BuildContext context) {
    final serviceName = Provider.of<String>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "$serviceName",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
