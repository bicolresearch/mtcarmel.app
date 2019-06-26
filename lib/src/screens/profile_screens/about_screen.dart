/*
*	Filename		:	about_screen.dart
*	Purpose			:	Show the details about the church.
* Created			: 2019-06-13 12:37:11 by Detective Conan
*	Updated			: 2019-06-26 17:21:04 by jo 
*	Changes			: update variable names
*/

import 'package:flutter/material.dart';
import 'package:flutter_html_textview_render/html_text_view.dart';
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
  static const String historyLabel = "History";

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

  Future<void> getJasonData() async {
    var response = await http.get(AppConstants.ABOUT_JSON_URL);
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          _aboutList = (json.decode(response.body) as List)
              .map((data) => new About.fromJson(data))
              .toList();
          // get only the first in the list
          About about = _aboutList[0];

          if (_aboutList.isNotEmpty) {
            _aboutItems
                .add(_AboutItem(about, AboutScreen.dateOfEstablishmentLabel));
            _aboutItems.add(_AboutItem(about, AboutScreen.feastDayLabel));
            _aboutItems.add(_AboutItem(about, AboutScreen.titularLabel));
            _aboutItems.add(_AboutItem(about, AboutScreen.dioceseLabel));
//              _aboutItems.add(_AboutItem(about, AboutScreen.historyLabel));
          }
          _isLoading = false;
        } else {
          print(response.statusCode);
          _isJsonFailed = true;
          _isLoading = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
            children: <Widget>[
        Expanded(
        child: SingleChildScrollView(
            child: Column(
            children: <Widget>[
            Container(
            margin: EdgeInsets.only(top: 30.0),
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.brown[600],
          border: Border.all(width: 0.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Mount Carmel Church now a National Shrine",
            style: TextStyle(
                color: Colors.white, fontFamily: "Helvetica"),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: Image.asset("assets/images/mt_logo.png"),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "About the Church",
          style: AppConstants.OPTION_STYLE3,
          textAlign: TextAlign.center,
        ),
      ),
      ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(parent: ScrollPhysics()),
          itemCount: _aboutItems.length,
          itemBuilder: (context, index) {
            return _aboutItem(_aboutItems[index]);
          }),
      Divider(),
      _history(),
      ],
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
    ),
    );


  }


  Widget _history() {
    if (_aboutList[0].content == null
        || _aboutList[0].content.isEmpty)
      return Container();
    else {
      return Column(children: <Widget>[
        Text("History", style: AppConstants.OPTION_STYLE3,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HtmlTextView(
            data: "<div style='color: #5d4037'>${_aboutList[0].content}</div>",
            anchorColor: Color(0xFFFF0000),
          ),
        )
      ],);
    }
  }

  void close() {
    print("about screen close");
    this.dispose();
  }

  Widget _aboutItem(_AboutItem aboutItem) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  "${aboutItem.label()} :",
                  style: AppConstants.OPTION_STYLE2,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  "${aboutItem._value}",
                  style: AppConstants.OPTION_STYLE2,
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}

class _AboutItem {
  String _label;
  String _value;

  _AboutItem(About about, String label) {
    _label = label;
    switch (label) {
      case AboutScreen.dateOfEstablishmentLabel:
        _value = about.dateOfEstablishment;
        break;
      case AboutScreen.feastDayLabel:
        _value = about.feastDay;
        break;
      case AboutScreen.titularLabel:
        _value = about.titular;
        break;
      case AboutScreen.dioceseLabel:
        _value = about.diocese;
        break;
      case AboutScreen.historyLabel:
        _value = about.content;
        break;
    }
  }

  String label() {
    return _label;
  }

  String value() {
    return _value;
  }
}
