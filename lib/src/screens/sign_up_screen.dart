import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart';
import 'package:mt_carmel_app/src/helpers/password_crypto.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class SignUpScreen extends StatelessWidget {
  static final GlobalKey<FormBuilderState> _fbKey =
  GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Text(
                "Sign-up",
                style: Theme
                    .of(context)
                    .primaryTextTheme
                    .headline
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
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
                _fbKey.currentState.save();
                if (_fbKey.currentState.validate()) {
                  print(_fbKey.currentState.value);
                  final url = "https://api.mountcarmel.ph/users/create";
                  Map<String, String> headers = {
                    "Content-type": "application/x-www-form-urlencoded"
                  };
                  var fieldsValue = _fbKey.currentState.value;

                  String encrypted = _encrypted(fieldsValue["password"]);

                  fieldsValue["password"] = encrypted;
                  fieldsValue.putIfAbsent("branch_id", ()=> "1");
                  fieldsValue.putIfAbsent("role_id", ()=> "2");
                  fieldsValue.putIfAbsent("user_id", ()=> "2");
                  fieldsValue.putIfAbsent("media_id", ()=> "14");
                  print(encrypted);
                  print(fieldsValue);
                  print(headers);
                  Map<String, String> casted = fieldsValue.cast();
                  Response response = await create(
                    url,
                    headers,
                    casted,
                  ).catchError((e) => print(e));

                  if(response == null)
                    return;
                  print(
                      "After posting response.statusCode is ${response
                          .statusCode}");
                  print(response.body);
                  Navigator.pop(context, true);
                } else {
                  print("validation failed");
                }
              },
            ),
            leftArrowBackButton(context: context),
          ],
        ),
      ),
    );
  }

  String _encrypted(String text) {
    final crypto = PasswordCrypto();
    return crypto.sha512(text);
  }

  Future create(String url, Map<String, String> headers,
      Map<String, dynamic> fieldsValue) async {
    final result = await post(
      url,
      headers: headers,
      body: fieldsValue,
    ).timeout(
      Duration(seconds: 3),
    );

    return result;
  }
}
