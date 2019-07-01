/*
*	Filename		:	crypt_lobby_info.dart
*	Purpose			:	crypt lobby info add form
* Created			: 2019-06-13 18:08:53 by Scarlet Witch
*	Updated			:	2019-06-13 18:08:53 by Scarlet Witch 
*	Changes			:
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/passing_screens/crypt_lobby_form.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class CryptLobbyInfo extends StatelessWidget {
  const CryptLobbyInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text("Crypt Lobby", 
            style: AppConstants.OPTION_STYLE3,
            textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: lineWidget()),
          SizedBox(height: 30.0),
          Expanded(
              child: SingleChildScrollView(
                child: Container(
                //width: 200.0,
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text("Crypt Lobby is available for conducting mass for the dead.", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("Fees:", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Crypt Lobby", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("20 sitting capacity", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("500 php/hour", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Text("You may settle your bill using your debit card, credit card or cash.", style: AppConstants.OPTION_STYLE2,),
            ],
            ),
            ),
              ),
          ),        
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  color: Colors.brown,
                  child: Text("Accept", 
                  style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => 
                          CryptLobbyForm()
                        )
                      );
                      if(result)
                        Navigator.pop(context, true);
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    child: leftArrowBackButton(context: context),
                  )
                ],
              ),
          ),
          ],
        ),
      ),
    );
  }
}