import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.brown),
        ),
            body: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(MountCarmelIcons.logo, color: Colors.brown, size: 150.0,),
                    SizedBox(height:20.0),
                   TextField(
                     keyboardType: TextInputType.emailAddress,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(),
                       hintText: "Enter email",
                       labelText: "Email",
                       ),
                   ),
                   SizedBox(
                     height: 20.0,
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
                     height: 20.0,
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(
                       horizontal: 30.0,
                     ),
                     child: Row(children: <Widget>[
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
                   ),
                   SizedBox(height: 20.0,),
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
          ),
        ),
      ),
    );
  }
}