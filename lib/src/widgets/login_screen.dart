/*
*  Filename    :   login_screen.dart
*  Purpose     :   Displays the login screen.
*  Created     :   2019-07-04 10:01 by Detective Conan
*  Updated     :   2019-07-04 10:01 by Detective Conan
*  Changes     :   Replaced logo. Added skip button
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

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
                Spacer(),
                Container(
                  child: Image.asset(
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
                      flex: 4,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        color: Colors.brown,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          print("Login pressed");
                        },
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          print("Forgot password pressed");
                        },
                        child: Text(
                          "Forgot password",
                          style: TextStyle(color: Colors.brown),
                        )),
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
                        onTap: () {},
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              color: Colors.brown, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ]),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
