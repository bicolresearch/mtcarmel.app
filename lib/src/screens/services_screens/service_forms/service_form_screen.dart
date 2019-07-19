/*
*  Filename    :   service_form_screen.dart
*  Purpose     :	
*  Created     :   2019-07-15 14:12 by Detective Conan
*	 Updated			:   17/07/2019 12:09 PM PM by Detective Conan
*	 Changes			:   Added navigation to thank you screen.
*	                 Added back button and subtype name.
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_field.dart';
import 'package:mt_carmel_app/src/screens/services_screens/thank_you/thank_you_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class ServiceFormScreen extends StatelessWidget {
  static final GlobalKey<FormBuilderState> _fbKey =
      GlobalKey<FormBuilderState>();

  ServiceFormScreen({this.serviceSubType});

  @required
  final ChurchServiceSubtype serviceSubType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                serviceSubType.subTypeName,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            lineWidget(),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    FormBuilder(
                      key: _fbKey,
                      autovalidate: true,
                      child: Column(
                        children: <Widget>[
                          for (var formField in serviceSubType.formFields)
                            ServiceFormField(churchFormField: formField),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.brown,
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                //TODO implement validations and updating database
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThankYouScreen(
                        thankYouText: serviceSubType.thankYouText),
                  ),
                );
                if (result) Navigator.pop(context, true);
              },
            ),
            leftArrowBackButton(context: context),
          ],
        ),
      ),
    );
  }
}
