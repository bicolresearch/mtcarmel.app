/*
*	 Filename		 :	 priest_screen.dart
*	 Purpose		 :	 Shows the Carmelites Priests
*  Created		 :   2019-06-11 14:14:18 by Detective Conan
*  Updated     :   2019-08-27 15:01 by Detective conan
*  Changes     :   Changed api's url.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/data_priest.dart';
import 'package:mt_carmel_app/src/models/priest.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';

class PriestsScreen extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  PriestsScreen(BuildContext context);

  @override
  _PriestsScreenState createState() => _PriestsScreenState();
}

class _PriestsScreenState extends State<PriestsScreen> {
  static const String _TYPE_ID = "107";

  List<Priest> _priestList = [];
  var _isLoading = true;

  //TODO handle different screen states
  var _isJsonFailed = false;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<void> getJsonData() async {
    final branchId = locator<BranchService>().branchId;
    var response =
        await http.get("${AppConstants.PRIESTS_JSON_URL}?branch_id=$branchId");
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          final body = json.decode(response.body);
          _priestList = DataPriest.fromJson(body).data.where((priest) {
            return priest.typeId == _TYPE_ID;
          }).toList();
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
        resizeToAvoidBottomPadding: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: (this._isLoading || _priestList.isEmpty)
                    ? LoadingIndicator()
                    : Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 50.0),
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.brown[600],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                AppConstants.COMPANY_NAME,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subhead
                                    .copyWith(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Carmelite Priests",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .title
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                child: GridView.count(
                              physics: ScrollPhysics(parent: ScrollPhysics()),
                              shrinkWrap: true,
                              primary: true,
                              crossAxisCount: 2,
                              children:
                                  List.generate(_priestList.length, (index) {
                                try {
                                  return getStructuredGridCell(
                                      _priestList[index]);
                                } catch (e) {
                                  print(e.toString());
                                  return Container();
                                }
                              }),
                            )),
                          ),
                        ],
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: leftArrowBackButton(context: context),
            ),
          ],
        ));
  }

  Card getStructuredGridCell(Priest priest) {
    String url = AppConstants.API_BASE_URL + priest.mediaPath;
    return Card(
      elevation: 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            width: 88.0,
            height: 88.0,
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(url),
              backgroundColor: Colors.brown,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  priest.name,
                  style: Theme.of(context).primaryTextTheme.caption.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                (priest.position != null)
                    ? Text(
                        priest.position,
                        style: Theme.of(context).primaryTextTheme.caption,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }

  void close() {
    this.dispose();
  }
}
