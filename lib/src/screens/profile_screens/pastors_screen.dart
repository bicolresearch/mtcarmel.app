/*
*	Filename		:	pastor_screen.dart
*	Purpose			:	Displays the list of pastors
* Created			: 2019-06-11 15:56:33 by Detective Conan
*	Updated			: 2019-06-11 15:56:33 by Detective Conan 
*	Changes			:
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/model/pastor.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PastorsScreen extends StatefulWidget {

  PastorsScreen(BuildContext context);

  @override
  _PastorsScreenState createState() => _PastorsScreenState();
}

class _PastorsScreenState extends State<PastorsScreen> {
  List<Pastor> _pastorList = [];

  var _isLoading = true;

  var _isJsonFailed = false;

  @override
  void initState() { 
    super.initState();   
    this.getJasonData();
  }

  Future<void> getJasonData() async{
    var response = await http.get(AppConstants.PRIESTS_JSON_URL); 
    if(this.mounted){
      setState(() 
        {
          if (response.statusCode == 200) {
              _pastorList = (json.decode(response.body) as List)
            .map((data) => new Pastor.fromJson(data))
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
                                        
      body: 
      Column(
        children: <Widget> [
          Container(   
                margin: EdgeInsets.only(top: 30.0), 
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Pastors",
                style: AppConstants.OPTION_STYLE3,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                  horizontal: 50.0,
                ),
                child: ListView.builder(
                  reverse: true,
                  itemCount: _pastorList.length,
                  itemBuilder:(context, index){
                    return _pastorItem(context, _pastorList[index]);
                  }
                ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              color: Colors.brown,
              child: Text("Close", 
              style: TextStyle(color: Colors.white,
              fontFamily: "Helvetica"),
              ),
              onPressed: () {
                Navigator.pop(context);
            },
          ),
          ],
        ),                
      ),
    );
  }

  Widget _pastorItem(context, Pastor pastor){
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: .0),
    child: ListTile(title: Text('${pastor.name}', 
      style: AppConstants.OPTION_STYLE2),
      subtitle: Text('${pastor.position}',
      style: AppConstants.OPTION_STYLE1),
      ),
    );
  }
}