/*
*	Filename		:	pastor_screen.dart
*	Purpose			:	Displays the list of pastors
* Created			: 2019-06-11 15:56:33 by Detective Conan
*	Updated			: 2019-07-01 11:45:23 by Detective Conan
*	Changes			: Replaced the import packagename model to models
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/pastor.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/widgets/failed_message.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';

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

  Future<void> getJasonData() async {
    var response = await http.get(AppConstants.PASTORS_JSON_URL);
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          _pastorList = (json.decode(response.body) as List)
              .map((data) => new Pastor.fromJson(data))
              .toList();
        } else {
          print(response.statusCode);
          _isJsonFailed = true;
        }
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(margin: EdgeInsets.only(top: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: (_isLoading)
                  ? Center(child: CircularProgressIndicator())
                  : _isJsonFailed
                  ? failedMessage()
                  : Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.0,
                      ),
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.brown[600],
                        border: Border.all(width: 0.8),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Mount Carmel Church now a National Shrine",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Helvetica"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Pastors",
                        style: AppConstants.OPTION_STYLE3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 50.0,
                        ),
                        child: ListView.builder(
                            physics: ScrollPhysics(
                                parent: ScrollPhysics()),
                            shrinkWrap: true,
                            reverse: true,
                            itemCount: _pastorList.length,
                            itemBuilder: (context, index) {
                              return _pastorItem(
                                  context, _pastorList[index]);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            leftArrowBackButton(context: context),
          ],
        ),
      ),
    );
  }

  Widget _pastorItem(context, Pastor pastor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: Text(
            '${pastor.name}',
            style: AppConstants.OPTION_STYLE2,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            '${pastor.position}',
            style: AppConstants.OPTION_STYLE1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
