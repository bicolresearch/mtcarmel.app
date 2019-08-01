/*
*	Filename		:	back_button.dart
*	Purpose			:	Button to navigate to the previous screen or furtherr to the root.
*             : e.g The root of thank you screen is the ServicesScreen.
*             : The label customi
* Created			: 2019-06-13 12:38:15 by Detective Conan
*	Updated			: 2019-06-13 12:38:15 by Detective Conan 
*	Changes			:
*/
import 'package:flutter/material.dart';

Widget backButton(
    {@required BuildContext context,
    String label = "Back",
    bool isNavigateFurtherToTheRoot = false}) {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    color: Colors.brown,
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      Navigator.pop(context, isNavigateFurtherToTheRoot);
    },
  );
}
