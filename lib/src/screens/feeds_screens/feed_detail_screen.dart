/*
*	Filename		:	<filename.extension>
*	Purpose			:	
* Created			: 2019-06-04 16:52:31 by Detective Conan
*	Updated			: 2019-06-04 16:52:31 by Detective Conan 
*	Changes			:
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/model/feed.dart';

class FeedDetailScreen extends StatelessWidget{
  
  final Feed feed;    

  FeedDetailScreen(this.feed);

  @override
  Widget build(BuildContext context) {
    return SafeArea(      
      child: Scaffold( 
        body: SingleChildScrollView(
            child: Container(
            padding: EdgeInsets.only(left:30, right: 30, bottom: 50.0),
              child: Column(
            children: <Widget>[ 
              Container(
                padding: EdgeInsets.only(top: 30.0),
                child: Container(   
                  //width: 200.0,  
                  height: 40.0,        
                  decoration: BoxDecoration(
                    color: Colors.brown[600],
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Mount Carmel Church now a National Shrine",
                    style: TextStyle(color: Colors.white,
                    fontFamily: "Helvetica"),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  ),
                ),
              Container(
            padding: EdgeInsets.all(20),
            width: double.infinity, 
            height: 300, 
            child: Image.network(AppConstants.FEEDS_API_BASE_URL+feed.cover_photo),
            ),
          Text( feed.content,
            style: AppConstants.OPTION_STYLE1 ,
            textAlign: TextAlign.justify, 
            ),
            RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: Colors.brown,
            child: Text("Close", 
            style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
              ],          
            ),
            ),
        ),
      ),
    );
  }

}