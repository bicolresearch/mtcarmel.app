/*
*  Filename    :   login_screen.dart
*  Purpose     :   Displays the login screen.
*  Created     :   2019-07-04 10:01 by Detective Conan
*  Updated     :   2019-07-11 09:22 by Detective conan
*  Changes     :   Hides the logo when Text editing.
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/models/login_model.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';

import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/password_crypto.dart';
import 'package:mt_carmel_app/src/screens/sign_up_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final GlobalKey<FormBuilderState> _fbKey =
      GlobalKey<FormBuilderState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    final branch = locator<BranchService>().branch;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "${branch.name}",
                    style: Theme.of(context).primaryTextTheme.title.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Image.asset(
                    AppConstants.MT_CARMEL_LOGO_PATH,
                    height: 120,
                  ),
                  FormBuilder(
                    key: _fbKey,
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          attribute: "email",
                          decoration: InputDecoration(
                              labelText: "Email",
                              helperStyle:
                                  Theme.of(context).primaryTextTheme.subtitle),
                          keyboardType: TextInputType.emailAddress,
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
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
                                obscureText: _isPasswordHidden,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  helperStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                validators: [
                                  FormBuilderValidators.required(),
                                ],
                                style: Theme.of(context).primaryTextTheme.title,
                                textAlign: TextAlign.center,
                                cursorColor: Colors.brown,
                              ),
                            ),
                            IconButton(
                              icon: _isPasswordHidden
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isPasswordHidden = !_isPasswordHidden;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              color: Colors.brown,
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                bool success;
                                _fbKey.currentState.save();
                                if (_fbKey.currentState.validate()) {
                                  try {
                                    success = await validate(
                                        _fbKey.currentState.value["email"],
                                        _fbKey.currentState.value["password"]);
                                  } catch (e) {
                                    print(e);
                                  }
                                  if (success == null || !success) {
                                    _scaffoldKey.currentState
                                        .removeCurrentSnackBar();

                                    _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Email or password did not match.',
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                  } else {
                                    Navigator.pop(context, true);
                                  }
                                }
                              },
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  print("Forgot password pressed");
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    "Forgot password",
                                    style: TextStyle(color: Colors.brown),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    "Sign-up",
                                    style: TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                onTap: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ),
                                  );
                                  if (result) {
                                    print("Signup successful");
                                    _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: SingleChildScrollView(
                                          child: Text(
                                            'Signup successful.',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          leftArrowBackButton(context: context),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }

  String _encrypted(String text) {
    final crypto = PasswordCrypto();
    return crypto.sha512(text);
  }

  Future<bool> validate(String email, String password) async {
    try {
      //TODO add service for this
      return await locator<LoginModel>().login(email, _encrypted(password));
    } catch (e) {
      print(e);
      throw Exception("ProfileLoginScreen.validate: login error");
    }
  }
}
