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
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.brown),
          backgroundColor: Colors.white,        
          title: Text(feed.content, 
            maxLines: 1, 
            overflow: TextOverflow.ellipsis,
            style: AppConstants.OPTION_STYLE3,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
            padding: EdgeInsets.only(left:30, right: 30, bottom: 50.0),
              child: Column(
            children: <Widget>[ Container(
            padding: EdgeInsets.all(20),
            width: double.infinity, 
            height: 300, 
            child: Image.network(AppConstants.FEEDS_API_BASE_URL+feed.cover_photo),
            ),
          Text( feed.content,
            style: AppConstants.OPTION_STYLE1 ,
            textAlign: TextAlign.justify, 
            ),
              ],          
            ),
            ),
        ),
      ),
    );
  }

}