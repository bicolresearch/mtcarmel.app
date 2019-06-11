/*
*	Filename		:	feeds_screen.dart
*	Purpose			:	
* Created			: 2019-06-04 16:28:01 by Detective Conan
*	Updated			:	2019-06-04 16:28:01 by Detective Conan 
*	Changes			:
*/


import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/model/feed.dart';

import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mt_carmel_app/src/screens/calendar.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/feed_detail_screen.dart';


class FeedScreen extends StatefulWidget {

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  FeedScreen(BuildContext context);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  List<Feed> _feedList = [];
  var _isLoading = true;
  var _isJsonFailed = false;

  @override
  void initState() { 
    super.initState();   
    this.getJasonData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(title: Text("The Basilica", 
        style: TextStyle(color: Colors.brown), 
        textAlign: TextAlign.center,),  
        backgroundColor: Colors.white,
        centerTitle: true, 
        actions: <Widget>[Container(
          child:GestureDetector(
            onTap: ()=> {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CalendarPage(),
                ),
              )
            },
            child: Icon(MountCarmelIcons.calendar, 
            color: Colors.brown, ),
            ),
            padding: EdgeInsets.only(right: 20.0),
            ),
          ],
        ),
        body: this._isLoading?LinearProgressIndicator(backgroundColor: Colors.brown,):Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 24, right: 24),
          child: _feedList.isNotEmpty
            ?ListView.builder(
            itemCount: _feedList.length,
            itemBuilder: (context,index){
                return _feedContent(_feedList[index]);
            }
            )
            :Container(
              alignment: Alignment.center,
              child: Text("No results.\nCheck the network.", style: AppConstants.OPTION_STYLE3,),
            ),
            ),   
        ),
      );
    }

    Future<void> getJasonData() async{
      var response = await http.get(AppConstants.FEEDS_JSON_URL); 
    if(this.mounted){
      setState(() 
        {
          if (response.statusCode == 200) {
             _feedList = (json.decode(response.body) as List)
            .map((data) => new Feed.fromJson(data))
            .toList();
            _isLoading = false;              
          } 
          else 
          {
            print(response.statusCode);
          _isJsonFailed = true;
          _isLoading = false;
          }
        }
      );
    }
}

  
  Widget _feedContent(Feed feed) {
    if (_isJsonFailed) 
      return Container();

    String url = AppConstants.FEEDS_API_BASE_URL+feed.cover_photo;
    try{ 
      FadeInImage.assetNetwork(
        fadeInCurve: Curves.bounceIn,
        image: url, 
        placeholder: 'assets/images/mt_logo.png',
      );
    }
    catch(e){
      print(e.toString());
      return Container();
    }
    return Container(
        
        height: 200,
        child: GestureDetector(
          onTap: () => {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedDetailScreen(feed),
                  ),
                ),
             },
          child: Column(
            children: <Widget>[ Expanded(
                child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity, 
                height: 250, 
                child: Image.network(url)
                ),
            ),                          
          Text( feed.content,
            style: AppConstants.OPTION_STYLE1 ,
            textAlign: TextAlign.justify, 
            overflow: TextOverflow.ellipsis,
            maxLines: 3,),
            Divider(color: Colors.brown,)
              ],          
            ),
        ),
      );
  }    

  void close(){    
    this.dispose();
  }    
}