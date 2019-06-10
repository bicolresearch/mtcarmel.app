import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/widgets/login_screen.dart';
import 'send_help_detail_screen.dart';


class SendHelpScreen extends StatelessWidget {

  final _isLoggedIn = true;

  static const TextStyle optionStyle = TextStyle(
                      color: Colors.brown, fontSize: 13.0, fontWeight: FontWeight.bold);

  SendHelpScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          child: Stack(
            fit: StackFit.expand,
            children:<Widget>[
              Container(child: Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                          image: NetworkImage('http://192.168.254.109/api/assets/images/church/mtcarmel_527x800.png'),
                          fit: BoxFit.cover),
                    ),
                  )
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(MountCarmelIcons.borderedlogo, 
                  color: Colors.brown[900], 
                  size: 160,
                  ),
                  Text(AppConstants.COMPANY_NAME, 
                  style: TextStyle(color: Colors.white, 
                    fontFamily: 'Helvetica', 
                    fontSize: 24),),
                  Text(AppConstants.LOCATION_NAME, 
                  style: TextStyle(color: Colors.white, 
                    fontFamily: 'Helvetica', 
                    fontSize: 16),),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(left: 70.0, right: 70.0),
                    child: Padding(                                    
                    padding: const EdgeInsets.only(right: 10.0),
                    child: RaisedButton(                                      
                      //TODO implement the onPress button
                      onPressed: () => {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>_isLoggedIn?SendHelpDetails():LoginScreen(),
                              )
                          )
                        },
                      color: Colors.white,
                      child: Text("Send help", 
                        style: TextStyle(fontFamily: 'Helvetica',
                        color: Colors.brown),                 
                      ),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                        ),   
                      ),
                    ),        
                  ),                      
                ],
              ),
            ],
          ),
        ),
      )  
    );
  }

  void _sendHelpNavigation(context){
    Navigator.push(
						context,
						MaterialPageRoute(
							builder: (context) => SendHelpDetails(),
						)
		);
  }
}