import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:mt_carmel_app/src/model/about.dart';
////
class AboutScreen extends StatefulWidget {
  //////
  const AboutScreen({Key key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

   List<About> _aboutList = [];

  var _isLoading = true;

  var _isJsonFailed = false;

  @override
  void initState() { 
    super.initState();   
    this.getJasonData();
  }

  Future<void> getJasonData() async{
    var response = await http.get(AppConstants.ABOUT_JSON_URL); 
    if(this.mounted){
      setState(() 
        {
          if (response.statusCode == 200) {
              _aboutList = (json.decode(response.body) as List)
            .map((data) => new About.fromJson(data))
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
    return Scaffold(
      body: Center(
        child: Column(
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
              child: Text("About the Church",
                style: AppConstants.OPTION_STYLE3,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                  children: <Widget>[                    
                  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text("Date of Establishment:",
                              style: AppConstants.OPTION_STYLE2,
                              textAlign: TextAlign.start,
                            ),
                      ),
                      SizedBox(width: 10.0,),
                      Expanded(
                        flex: 1,
                        child: Text("${_aboutList.isEmpty?"":_aboutList[0].date_of_establishment}",
                              style: AppConstants.OPTION_STYLE2,
                              textAlign: TextAlign.left,
                            ),
                      ),
                        ],
                      ),
                    ),
                    Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text("Feast day:",
                              style: AppConstants.OPTION_STYLE2,
                              textAlign: TextAlign.start,
                            ),
                      ),
                      SizedBox(width: 10.0,),
                      Expanded(
                        flex: 1,
                        child: Text("${_aboutList.isEmpty?"":_aboutList[0].feast_Day}",
                              style: AppConstants.OPTION_STYLE2,
                              textAlign: TextAlign.left,
                            ),
                      ),
                        ],
                      ),
                    ),
                    Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text("Titular:",
                              style: AppConstants.OPTION_STYLE2,
                              textAlign: TextAlign.start,
                            ),
                      ),
                      SizedBox(width: 10.0,),
                      Expanded(
                        flex: 1,
                        child: Text("${_aboutList.isEmpty?"":_aboutList[0].titular}",
                              style: AppConstants.OPTION_STYLE2,
                              textAlign: TextAlign.left,
                            ),
                      ),
                        ],
                      ),
                    ),
                    Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text("Diocese:",
                              style: AppConstants.OPTION_STYLE2,
                              textAlign: TextAlign.start,
                            ),
                      ),
                      SizedBox(width: 10.0,),
                      Expanded(
                        flex: 1,
                        child: Text("${_aboutList.isEmpty?"":_aboutList[0].diocese}",
                              style: AppConstants.OPTION_STYLE2,
                              textAlign: TextAlign.left,
                            ),
                      ),
                        ],
                      ),
                    ),
                    ],
                  ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  print("tapped");
                },
                child: Icon(Icons.keyboard_arrow_left, 
                size: 50.0,
                color: Colors.brown,)),
            )
          ],
        ),
      ),
    );
  }

  void close(){
    this.dispose();
  }
}