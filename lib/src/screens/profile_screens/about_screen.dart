/*
*	Filename		:	about_screen.dart
*	Purpose			:	Show the details about the church.
* Created			: 2019-06-13 12:37:11 by Detective Conan
*	Updated			: 2019-06-13 12:37:11 by Detective Conan 
*	Changes			:
*/
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:mt_carmel_app/src/model/about.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
////
class AboutScreen extends StatefulWidget {

  static const String dateOfEstablishmentLabel = "Date of Establishment";
  static const String feastDayLabel = "Feast day";
  static const String titularLabel = "Titular";
  static const String dioceseLabel = "Diocese";

  //////
  const AboutScreen({Key key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  List<About> _aboutList = [];

  final List<_AboutItem> _aboutItems = [];

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
            // get only the first in the list
            About about = _aboutList[0];

            if(_aboutList.isNotEmpty){
              _aboutItems.add(_AboutItem(about, AboutScreen.dateOfEstablishmentLabel));
              _aboutItems.add(_AboutItem(about, AboutScreen.feastDayLabel));
              _aboutItems.add(_AboutItem(about, AboutScreen.titularLabel));
              _aboutItems.add(_AboutItem(about, AboutScreen.dioceseLabel));

            }
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
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[            
              Column(
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

                  Expanded(
                      child: Container(
                        height: 1000.0,
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.symmetric(
                        horizontal: 50.0,
                      ),
                      child: ListView.builder(
                        itemCount: _aboutItems.length,
                        itemBuilder:(context, index){
                          return _aboutItem(_aboutItems[index]);
                        }
                      ),
                    ),
                  ),

                Container(
                  alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 30.0),
                child: leftArrowBackButton(context: context),
                      )
                    ],
                  ),
                Container(
                  alignment: Alignment.center,
                  child: Icon(MountCarmelIcons.logo, 
                    color: Color.fromARGB(0x80, 0x3E, 0x27, 0x23), 
                    size: 150.0,),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void close(){
    print("about screen close");
    this.dispose();
  }

  Widget _aboutItem(_AboutItem aboutItem){    
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text("${aboutItem.label()} :",
                      style: AppConstants.OPTION_STYLE2,
                      textAlign: TextAlign.start,
                    ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                child: Text("${aboutItem._value}",
                      style: AppConstants.OPTION_STYLE2,
                      textAlign: TextAlign.left,
                    ),
              ),
            ],
          ),
          lineWidget(),
        ],
      ),
    );
  }
}

class _AboutItem{

  String _label;
  String _value;

  _AboutItem(About about, String label){
    _label = label;
    switch(label){
      case AboutScreen.dateOfEstablishmentLabel:
        _value = about.date_of_establishment;
        break;
      case AboutScreen.feastDayLabel:
        _value = about.feast_Day;
        break;
      case AboutScreen.titularLabel:
        _value = about.titular;
        break;
      case AboutScreen.dioceseLabel:
        _value = about.diocese;
        break;
    }
  }

  String label(){
    return _label;
  }

  String value(){
    return _value;
  }

}