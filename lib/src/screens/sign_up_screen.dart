import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart';
import 'package:mt_carmel_app/src/constants/api_constants.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/password_crypto.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  static final GlobalKey<FormBuilderState> _fbKey =
      GlobalKey<FormBuilderState>();

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    child: Text(
                      "Sign-up",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FormBuilder(
                    key: SignUpScreen._fbKey,
//                      autovalidate: true,
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          attribute: "first_name",
                          decoration: InputDecoration(
                              labelText: "First name",
                              helperStyle:
                                  Theme.of(context).primaryTextTheme.subtitle),
                          keyboardType: TextInputType.text,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                          style: Theme.of(context).primaryTextTheme.title,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.brown,
                        ),
                        FormBuilderTextField(
                          attribute: "last_name",
                          decoration: InputDecoration(
                              labelText: "Last name",
                              helperStyle:
                                  Theme.of(context).primaryTextTheme.subtitle),
                          keyboardType: TextInputType.text,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                          style: Theme.of(context).primaryTextTheme.title,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.brown,
                        ),
                        FormBuilderTextField(
                          attribute: "email",
                          decoration: InputDecoration(
                              labelText: "Email",
                              helperStyle:
                                  Theme.of(context).primaryTextTheme.subtitle),
                          keyboardType: TextInputType.emailAddress,
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email()
                          ],
                          style: Theme.of(context).primaryTextTheme.title,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.brown,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: FormBuilderTextField(
                                attribute: "password",
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    helperStyle: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle),
                                keyboardType: TextInputType.text,
                                validators: [
                                  FormBuilderValidators.required(),
                                ],
                                style: Theme.of(context).primaryTextTheme.title,
                                textAlign: TextAlign.center,
                                cursorColor: Colors.brown,
                              ),
                            ),
                            IconButton(
                              icon: _isPasswordVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
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
                  SignUpScreen._fbKey.currentState.save();
                  if (SignUpScreen._fbKey.currentState.validate()) {
                    print(SignUpScreen._fbKey.currentState.value);
                    final url = "${AppConstants.API_BASE_URL}users/create";
                    final branchId = locator<BranchService>().branch.id;
                    var fieldsValue = SignUpScreen._fbKey.currentState.value;

                    String encrypted = _encrypted(fieldsValue["password"]);

                    fieldsValue["password"] = encrypted;
                    fieldsValue.putIfAbsent("branch_id", () => "$branchId");
                    fieldsValue.putIfAbsent("role_id", () => "2");
                    fieldsValue.putIfAbsent("user_id", () => "01");
                    fieldsValue.putIfAbsent("media_id", () => "14");
                    print(encrypted);
                    print(fieldsValue);
                    Map<String, String> casted = fieldsValue.cast();
                    Response response = await create(
                      url,
                      APIConstants.HEADERS,
                      casted,
                    ).catchError((e) {
                      print(e);
                    });

                    if (response == null) return;
                    print(response.body);
                    if(response.body.contains("\"status\":false")){
                      Map<String, dynamic> body = json.decode(response.body);
                      _scaffoldKey.currentState.removeCurrentSnackBar();

                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text(
                            'Sign-up failure. ${body["message"]}',
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 3),
                        ),
                      );
                      return;
                    }
                    setState(() {});
                    Navigator.pop(context, true);
                  } else {
                    _scaffoldKey.currentState.removeCurrentSnackBar();

                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text(
                          'Sign-up failed.',
                          textAlign: TextAlign.center,
                        ),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    print("validation failed");
                  }
                },
              ),
              leftArrowBackButton(context: context),
            ],
          ),
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
