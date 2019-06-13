/*
*	Filename		:	left_arrow_back_button.dart
*	Purpose			:	Button for navigation to previous screen. Shows left arrow icon
* Created			: 2019-06-13 12:35:21 by Detective Conan
*	Updated			: 2019-06-13 12:35:21 by Detective Conan 
*	Changes			:
*/
import 'package:flutter/material.dart';


Widget leftArrowBackButton({BuildContext context}){
  return GestureDetector(
    onTap: (){
      Navigator.pop(context);
    },
    child: Icon(Icons.keyboard_arrow_left, 
    size: 50.0,
    color: Colors.brown,)
  );
}