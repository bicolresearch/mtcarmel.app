/*
*  Filename    :   payment_screen.dart
*  Purpose     :	
*  Created     :   2019-07-30 13:04 by Detective Conan
*  Updated     :   2019-07-30 13:04 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PaymentScreen extends StatefulWidget{
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  static final GlobalKey<FormBuilderState> _fbKey =
  GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(children: <Widget>[
      FormBuilder(
        key: _fbKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            FormBuilderTextField(
              attribute: "first_name",
              decoration: InputDecoration(
                  labelText: "First name",
                  helperStyle: Theme
                      .of(context)
                      .primaryTextTheme
                      .subtitle),
              keyboardType: TextInputType.multiline,
              validators: [
                FormBuilderValidators.required(),
              ],
              style: Theme
                  .of(context)
                  .primaryTextTheme
                  .title,
              textAlign: TextAlign.center,
              cursorColor: Colors.brown,
            ),
            FormBuilderTextField(
              attribute: "last_name",
              decoration: InputDecoration(
                  labelText: "Last name",
                  helperStyle: Theme
                      .of(context)
                      .primaryTextTheme
                      .subtitle),
              keyboardType: TextInputType.multiline,
              validators: [
                FormBuilderValidators.required(),
              ],
              style: Theme
                  .of(context)
                  .primaryTextTheme
                  .title,
              textAlign: TextAlign.center,
              cursorColor: Colors.brown,
            ),
            FormBuilderTextField(
              attribute: "email",
              decoration: InputDecoration(
                  labelText: "Email",
                  helperStyle: Theme
                      .of(context)
                      .primaryTextTheme
                      .subtitle),
              keyboardType: TextInputType.multiline,
              validators: [
                FormBuilderValidators.required(),
              ],
              style: Theme
                  .of(context)
                  .primaryTextTheme
                  .title,
              textAlign: TextAlign.center,
              cursorColor: Colors.brown,
            ),
            FormBuilderTextField(
              attribute: "password",
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  helperStyle: Theme
                      .of(context)
                      .primaryTextTheme
                      .subtitle),
              keyboardType: TextInputType.multiline,
              validators: [
                FormBuilderValidators.required(),
              ],
              style: Theme
                  .of(context)
                  .primaryTextTheme
                  .title,
              textAlign: TextAlign.center,
              cursorColor: Colors.brown,
            ),
          ],
        ),
      ),
    ],)),);
  }
}
