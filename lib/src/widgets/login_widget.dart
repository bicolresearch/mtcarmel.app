import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';

  Widget loginWidget() {
    return  Container(
      width: double.infinity,
      child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50.0, left: 10.0),
                child: Icon(MountCarmelIcons.logo, color: Colors.brown, size: 70,)
                ),
               SizedBox(
                 height: 10.0,
               ),
               TextField(
                 keyboardType: TextInputType.emailAddress,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: "Enter email",
                   labelText: "Email",
                   ),
               ),
               SizedBox(
                 height: 10.0,
               ),
               TextField(
                 obscureText: true,
                 keyboardType: TextInputType.emailAddress,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: "Input password",
                   labelText: "Password",
                   ),
               ),
               SizedBox(
                 height: 10.0,
               ),
               Row(children: <Widget>[
                 Expanded(
                   flex: 4,
                    child: RaisedButton(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20.0)
                     ),
                     color: Colors.brown,
                     child: Text("Login", 
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
                   child: Text("Forgot password", 
                   style: TextStyle(color: Colors.brown),
                   )
                   ),
                ],
               ),
               SizedBox(height: 10.0,),
               GestureDetector(
                     onTap: () {
                       print("Sign-up pressed");
                     },
                 child: Text("Sign-up", 
                       style: TextStyle(color: Colors.brown,
                        fontWeight: FontWeight.bold),
                  ),
               ),
              ],
            ),
          ),
      ),
    );
  }