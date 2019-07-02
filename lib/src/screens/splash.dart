/*
*	Filename		:	splash.dart
*	Purpose			:	Displays log and ads before the main screen.
* Created			: 2019-05-27 11:47:55 by Detective Conan
*	Updated			: 2019-07-01 11:45:23 by Detective Conan
*	Changes			: Replaced the import packagename model to models
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/ad.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import '../constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Ad> adList = List();
  bool isLoading = true;
  bool isJsonFailed = false;

  @override
  void initState() {
    super.initState();
//TODO Temporarily removed ads
//    this.getJasonData();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: <Widget>[
        Container(
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Image.asset(AppConstants.MT_CARMEL_LOGO_PATH, height: 160),
                  Text(AppConstants.COMPANY_NAME,
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      )),
                  Text(AppConstants.LOCATION_NAME,
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 15.0,
                      )),
                  SizedBox(height: 50.0,),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
//TODO Temporarily removed ads
//        Container(
//          alignment: Alignment.bottomCenter,
//          child: Container(
//            child: adList.isNotEmpty && !isLoading ? ads() : Container(),
//            height: AppConstants.AD_GROUP_HEIGHT,
//          ),
//        ),
      ]),
    );
  }

//TODO Temporarily remove ads
//  Future<void> getJasonData() async {
//    var response = await http.get(AppConstants.ADS_JSON_URL);
//    if (this.mounted) {
//      setState(() {
//        if (response.statusCode == 200) {
//          adList = (json.decode(response.body) as List)
//              .map((data) => new Ad.fromJson(data))
//              .toList();
//          isLoading = false;
//        } else {
//          //throw Exception('Failed to load photos');
//          isJsonFailed = true;
//          isLoading = false;
//        }
//      });
//    }
//  }


//  Container oneAd() {
//    return getOneAd(1);
//  }
//
//  Container twoAds(int firstItem) {
//    return getTwoAds(firstItem);
//  }
//
//  Container getTwoAds(int firstItem) {
//    return Container(
//      child: Row(
//        children: <Widget>[
//          Expanded(child: getOneAd(firstItem)),
//          Expanded(child: getOneAd(firstItem + 1)),
//        ],
//      ),
//      padding: EdgeInsets.all(5.0),
//    );
//  }
//
//  Container getOneAd(int index) {
//    return Container(
//      child: Image.network(AppConstants.API_BASE_URL + adList[index].coverPhoto),
//      padding: EdgeInsets.all(15.0),
//    );
//  }
//
//  Container threeAds(int firstItem) {
//    return Container(
//      child: Column(
//        children: <Widget>[
//          Expanded(child: getTwoAds(0)),
//          Expanded(child: getOneAd(2))
//        ],
//      ),
//    );
//  }
//
//  Container fourAds(int firstItem) {
//    return Container(
//      child: Column(children: <Widget>[
//        Expanded(child: getTwoAds(0)),
//        Expanded(child: getTwoAds(2)),
//      ]),
//    );
//  }
//
//  Container ads() {
//    var adCount = adList.length;
//    if (isJsonFailed) return Container();
//
//    //limits to 4 ads
//    if (adCount > 4) adCount = 4;
//
//    Container adContainer;
//
//    switch (adCount) {
//      case 1:
//        adContainer = oneAd();
//        break;
//      case 2:
//        adContainer = twoAds(0);
//        break;
//      case 3:
//        adContainer = threeAds(0);
//        break;
//      case 4:
//        adContainer = fourAds(0);
//        break;
//      default:
//        return Container();
//    }
//
//    return Container(
//        child: Stack(
//      children: <Widget>[
//        //line
//        lineWidget(),
//        Container(
//          child: adContainer,
//          padding: EdgeInsets.only(top: 20.0),
//        ),
//        Align(
//          alignment: Alignment.topCenter,
//          child: Container(
//            height: 20,
//            //color: Colors.white,
//            child: Material(
//              child: Text("Powered by",
//                  textAlign: TextAlign.center,
//                  style: TextStyle(
//                    color: Colors.brown,
//                    fontFamily: "Helvetica",
//                    fontSize: 12.0,
//                  )),
//            ),
//            padding: EdgeInsets.only(left: 20, right: 20),
//          ),
//        ),
//      ],
//    ));
//  }
}
