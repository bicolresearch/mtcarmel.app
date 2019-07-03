/*
* Filename    : send_help_screen.dart
* Purpose     :	Displays the different type of donations
* Created     : 2019-06-02 09:10 by Detective Conan
*	Updated			: 2019-07-03 11:19 by Detective conan
*	Changes			: Added caching key.
*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/send_help.dart';
import 'package:mt_carmel_app/src/widgets/LoadingIndicator.dart';
import 'package:mt_carmel_app/src/widgets/failed_message.dart';
import 'package:mt_carmel_app/src/widgets/login_screen.dart';
import 'send_help_detail_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';

class SendHelpScreen extends StatefulWidget {
  static const TextStyle optionStyle = TextStyle(
      color: Colors.brown, fontSize: 13.0, fontWeight: FontWeight.bold);

  SendHelpScreen(BuildContext context);

  @override
  _SendHelpScreenState createState() => _SendHelpScreenState();
}

class _SendHelpScreenState extends State<SendHelpScreen> {
  final _isLoggedIn = true;

  List<SendHelp> _sendHelpList = [];

  bool _isLoading = true;

  bool _isJsonFailed = false;

  Future<void> getJsonData() async {
    _isJsonFailed = false;
    _isLoading = true;
    var response = await http.get(AppConstants.SEND_HELP_JSON_URL);
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          _sendHelpList = (json.decode(response.body) as List)
              .map((data) => new SendHelp.fromJson(data))
              .toList();
        } else {
          _isJsonFailed = true;
        }
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: _isLoading
                ? LoadingIndicator()
                : _isJsonFailed
                    ? failedMessage()
                    : Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // Primary Donation
                            Container(
                                height:
                                    MediaQuery.of(context).size.height / 2 - 50,
                                child: _donationItem(
                                    context: context,
                                    sendHelp: _sendHelpList[0],
                                    isPrimary: true)),

                            Expanded(
                              child: Container(
                                  child: GridView.count(
                                physics: ScrollPhysics(parent: ScrollPhysics()),
                                shrinkWrap: true,
                                primary: true,
                                crossAxisCount: 2,
                                children:
                                    // exclude the primary
                                    List.generate(_sendHelpList.length - 1,
                                        (index) {
                                  try {
                                    return _donationItem(
                                        context: context,
                                        sendHelp: _sendHelpList[index + 1]);
                                  } catch (e) {
                                    print(e.toString());
                                    return Container();
                                  }
                                }),
                              )),
                            ),
                          ],
                        ),
                      )));
  }

  Widget _donationItem(
      {BuildContext context,
      bool isPrimary = false,
      @required SendHelp sendHelp}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(2.0),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: CachedNetworkImage(
                key: Key(sendHelp.coverPhoto.replaceAll("/", "")),
                imageUrl: AppConstants.API_BASE_URL + sendHelp.coverPhoto,
                placeholder: (context, url) => LoadingIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Mount carmel logo in main donation type
              isPrimary
                  ? Image.asset(AppConstants.MT_CARMEL_LOGO_PATH, height: 120)
                  : Container(),
              //Name of donation
              Text(
                sendHelp.name,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Helvetica', fontSize: 16),
              ),
              // Description for other than shrine donation else location
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: isPrimary
                    ? Text(
                        AppConstants.LOCATION_NAME,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Helvetica',
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    : Text(
                        sendHelp.description,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Helvetica',
                            fontSize: 12),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: isPrimary
                    ? EdgeInsets.only(left: 60.0, right: 60.0)
                    : EdgeInsets.only(left: 8.0, right: 8.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: RaisedButton(
                    //TODO implement the onPress button
                    onPressed: () => {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => _isLoggedIn
//                                    ? SendHelpDetails()
//                                    : LoginScreen(),
//                              ))
                          print("${sendHelp.name} selected")
                        },
                    color: Colors.white,
                    child: Text(
                      "Send help",
                      style: TextStyle(
                          fontFamily: 'Helvetica', color: Colors.brown),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _sendHelpNavigation(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SendHelpDetails(),
        ));
  }
}
