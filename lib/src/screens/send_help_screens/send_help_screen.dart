/*
*  Filename    :   send_help_screen.dart
*  Purpose     :	 Displays the different type of donations
*  Created     :   2019-06-02 09:10 by Detective Conan
*	 Updated			:   08/09/2019 4:02 AM PM by Detective Conan
*	 Changes			:   Temporarily cover the screen with container to disable the content,
*	                  while send help is not ready.
*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/user_authentication_api.dart';
import 'package:mt_carmel_app/src/models/send_help.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:mt_carmel_app/src/widgets/failed_message.dart';
import 'package:mt_carmel_app/src/widgets/login_screen.dart';
import 'send_help_detail_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';

class SendHelpScreen extends StatefulWidget {
  @override
  _SendHelpScreenState createState() => _SendHelpScreenState();
}

class _SendHelpScreenState extends State<SendHelpScreen> {
  bool _isLoggedIn = false;

  List<SendHelp> _sendHelpList = [];

  bool _isLoading = true;

  bool _isJsonFailed = false;

  Future<void> getJsonData() async {
    _isJsonFailed = false;
    _isLoading = true;
    var response =
        await http.get(AppConstants.SEND_HELP_JSON_URL).catchError((e) {
      throw Exception(e);
    });
    if (this.mounted) {
      setState(
        () {
          if (response.statusCode == 200) {
            _sendHelpList = (json.decode(response.body) as List)
                .map((data) => new SendHelp.fromJson(data))
                .toList();
          } else {
            _isJsonFailed = true;
            throw Exception("Failed on sendHelp fetching data");
          }
          _isLoading = false;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    print("initializing sendHelp screen...");
    _checkLoginStatus().then((_) {
      this.getJsonData();
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? LoadingIndicator()
            : _isJsonFailed
                ? failedMessage(context)
                : Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Primary Donation
                        Container(
                            height: MediaQuery.of(context).size.height / 2 - 50,
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
                                  List.generate(
                                _sendHelpList.length - 1,
                                (index) {
                                  try {
                                    return _donationItem(
                                        context: context,
                                        sendHelp: _sendHelpList[index + 1]);
                                  } catch (e) {
                                    print(e.toString());
                                    return Container();
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  @override
  void dispose() {
    print("disposing sendHelpScreen...");
    super.dispose();
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
            child: (sendHelp.coverPhoto == null)
                ? Container()
                : CachedNetworkImage(
                    key: Key(sendHelp.id),
                    imageUrl:
                        AppConstants.API_BASE_URL + sendHelp.coverPhoto ?? "",
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
                style: Theme.of(context)
                    .primaryTextTheme
                    .subhead
                    .copyWith(color: Colors.white),
              ),
              // Description for other than shrine donation else location
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: isPrimary
                    ? Text(
                        AppConstants.LOCATION_NAME,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subtitle
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    : Text(
                        sendHelp.description,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subtitle
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: isPrimary
                    ? const EdgeInsets.only(left: 60.0, right: 60.0)
                    : const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: RaisedButton(
                    onPressed: () async => {
                      print("${sendHelp.name} selected"),
                      if (!_isLoggedIn)
                        {
                          _isLoggedIn = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              )),
                        },
                      //after login form
                      if (_isLoggedIn)
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SendHelpDetails(sendHelp),
                            ),
                          )
                        }
                    },
                    color: Colors.white,
                    child: Text(
                      "Help Now",
                      style: Theme.of(context).primaryTextTheme.subhead,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //TODO Removed when SendHelp is ready
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color.fromRGBO(0, 0, 0, 0.7)
          ),
        ],
      ),
    );
  }

  Future _checkLoginStatus() async {
    await locator<AuthenticationService>().isLoggedIn().then((value) {
      _isLoggedIn = value;
    }).catchError((error) {
      print(error);
      _isLoggedIn = false;
    });
  }
}
