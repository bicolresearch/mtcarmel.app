/*
*  Filename    :   login_screen.dart
*  Purpose     :   Displays the login screen.
*  Created     :   2019-07-04 10:01 by Detective Conan
*  Updated     :   2019-07-11 09:22 by Detective conan
*  Changes     :   Hides the logo when Text editing.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/models/login_model.dart';

import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/password_crypto.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoginFailed = false;
  bool _isTextEditing = false;

  @override
  void dispose() {
    _textControllerEmail.dispose();
    _textControllerPassword.dispose();
    super.dispose();
  }

  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: _isTextEditing
                      ? Container()
                      : Image.asset(
                          AppConstants.MT_CARMEL_LOGO_PATH,
                          height: 160,
                        ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 40.0,
                  child: TextField(
                    onTap: () {
                      _isTextEditing = true;
                    },
                    onSubmitted: (_) {
                      _isTextEditing = false;
                    },
                    controller: _textControllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 40.0,
                  child: TextField(
                    controller: _textControllerPassword,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Colors.brown,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          print("Login pressed");
                          validate(_textControllerEmail.value.text,
                              _textControllerPassword.value.text);
                        },
                      ),
                    ),
                    Spacer(),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.brown,
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        print("Cancel pressed");
                        Navigator.pop(context, false);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    print("Sign-up pressed");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(children: <Widget>[
                      Text(
                        "Sign-up",
                        style: TextStyle(
                            color: Colors.brown, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          print("Forgot password pressed");
                        },
                        child: Text(
                          "Forgot password",
                          style: TextStyle(color: Colors.brown),
                        ),
                      ),
                    ]),
                  ),
                ),
                (_isLoginFailed)
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Login failed! Make sure the email and password are correct.",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontFamily: "Helvetica",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate(String email, String password) {
    _isLoginFailed = false;
    if (email.isEmpty ||
        password.isEmpty ||
        !email.contains("@") ||
        email.contains(" ")) {
      setState(() {
        print("wrong email");
        _isLoginFailed = true;
      });
      return;
    }
    locator<LoginModel>().login(email, _encrypted(password)).then((value) {
      print(value);
      if (value)
        Navigator.pop(context, true);
      else
        setState(() {
          _isLoginFailed = true;
        });
    });
  }

  String _encrypted(String text) {
    final crypto = PasswordCrypto();
    return crypto.sha512(text);
  }
}
