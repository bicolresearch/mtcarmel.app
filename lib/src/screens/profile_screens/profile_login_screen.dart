/*
*   Filename    :   profile_login_screen.dart
*   Purpose     :
*   Created     :   04/11/2019 10:44 AM by Detective Conan
*	 Updated			:   04/11/2019 4:23 PM PM by Detective Conan
*	 Changes			:   Added padding for sign-up, forgot password and skip button.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/blocs/profile_feature_bloc/profile_feature_bloc.dart';
import 'package:mt_carmel_app/src/blocs/profile_feature_bloc/profile_feature_event.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/screens/start_page.dart';

class ProfileLoginScreen extends StatefulWidget {
  @override
  _ProfileLoginScreenState createState() => _ProfileLoginScreenState();
}

class _ProfileLoginScreenState extends State<ProfileLoginScreen> {
  GlobalKey _fbKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final branch = locator<BranchService>().branch;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: <Widget>[
                Text(
                  "${branch.name}",
                  style: Theme.of(context).primaryTextTheme.headline.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  AppConstants.MT_CARMEL_LOGO_PATH,
                  height: 160,
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
                        keyboardType: TextInputType.multiline,
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                        style: Theme.of(context).primaryTextTheme.title,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.brown,
                      ),
                      FormBuilderTextField(
                        attribute: "password",
                        decoration: InputDecoration(
                            labelText: "Password",
                            helperStyle:
                                Theme.of(context).primaryTextTheme.subtitle),
                        keyboardType: TextInputType.multiline,
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                        style: Theme.of(context).primaryTextTheme.title,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.brown,
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
                            onPressed: () {
                              print("Login pressed");
//                          validate(_textControllerEmail.value.text,
//                              _textControllerPassword.value.text);
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
//                      InkWell(
//                        onTap: () async {
//                          print("Sign-up pressed");
////                          final result = await Navigator.push(
////                            context,
////                            MaterialPageRoute(
////                              builder: (context) => SignUpScreen(),
////                            ),
////                          );
////                          if (result) print("Signup successful");
//                        },
//                        child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(children: <Widget>[
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
                            onTap: () {
                              print("Sign-up pressed");
                            },
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              final bloc =
                                  BlocProvider.of<ProfileFeatureBloc>(context);
                              await SharedPreferencesHelper
                                  .setProfileSkippedLogin(true);
                              bloc.dispatch(FetchProfileFeature());
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Skip",
                                    style: TextStyle(
                                        color: Colors.brown,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_up,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      OutlineButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.brown[500],
                        child: Text(
                          "Change branch",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          final bool confirmed =
                              await _confirmationDialog(context, branch.name);
                          if (!confirmed) return;

                          await SharedPreferencesHelper.setBranchNameFlag(null);
                          await SharedPreferencesHelper.setBranchIdFlag(null);
                          await SharedPreferencesHelper.setResetBranch(true);
                          locator<BranchService>().clearBranch();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return StartPage();
                              },
                            ),
                          );
                          return;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _confirmationDialog(context, branchName) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("You are currently in "),
                Text(
                  "$branchName",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text("\nDo you want to change branch?"),
              ],
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      ),
    );
  }
}
