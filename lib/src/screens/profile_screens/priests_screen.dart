/*
*	Filename		:	priest_screen.dart
*	Purpose			:	Shows the Carmalites Priests
* Created			: 2019-06-11 14:14:18 by Detective Conan
*	Updated			: 2019-06-11 14:14:18 by Detective Conan 
*	Changes			:
*/


import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/model/priest.dart';
import 'dart:async';
import 'dart:convert';


class PriestsScreen extends StatefulWidget {

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  PriestsScreen(BuildContext context);

  @override
  _PriestsScreenState createState() => _PriestsScreenState();
}

class _PriestsScreenState extends State<PriestsScreen> {

  List<Priest> _priestList = [];
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
              _priestList = (json.decode(response.body) as List)
            .map((data) => new Priest.fromJson(data))
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
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
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
              child: Text("Priests",
                style: AppConstants.OPTION_STYLE3,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 500.0,
                  child: this._isLoading?LinearProgressIndicator(backgroundColor: Colors.brown,):_priestList.isNotEmpty
                    ?GridView.count(
                      primary: true,
                      crossAxisCount: 2,
                      children: List.generate(_priestList.length, (index) {
                        return getStructuredGridCell(_priestList[index]);
                      }
                      ),
                    ):LinearProgressIndicator(),
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
        )        
      )
    );
  }

Card getStructuredGridCell(Priest priest) {
  String url = AppConstants.API_BASE_URL+priest.cover_photo;
    return Card(
      elevation: 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0,5.0),
          width: 100.0,
          height: 100.0,
          child: CircleAvatar(backgroundImage: NetworkImage(url),
            backgroundColor: Colors.brown,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(priest.name, 
                style:  TextStyle(color: Colors.brown,
                  fontFamily: "Helvetica",
                  fontWeight: FontWeight.bold),),    
                Text(priest.position, 
                style:  AppConstants.OPTION_STYLE1,),              
              ],
            ),
          )
        ],
      )
    );
  }
  
  void close(){    
    this.dispose();
  }    
}