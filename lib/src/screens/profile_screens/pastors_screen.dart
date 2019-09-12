/*
*	 Filename		 :	 pastor_screen.dart
*	 Purpose		 :	 Displays the list of pastors
*  Created	 	 :   2019-06-11 15:56:33 by Detective Conan
*	 Updated			:   11/09/2019 3:45 PM PM by Detective Conan
*	 Changes			:   Added fetching current branchId to to filter pastors with branch
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/data_pastor.dart';
import 'package:mt_carmel_app/src/models/data_priest.dart';
import 'package:mt_carmel_app/src/models/pastor.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/models/priest.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
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
  static const _TYPE_ID = "108";

  List<Priest> _pastorList = [];

  var _isLoading = true;

  var _isJsonFailed = false;

  @override
  void initState() {
    super.initState();
    this.getJasonData();
  }

  Future<void> getJasonData() async {
    // url the same with priest. they shared api. to be identified by type_id
    final branchId = locator<BranchService>().branchId;
    var response = await http.get(
        "${AppConstants.PRIESTS_JSON_URL}/?branch_id=$branchId&?type_id=$_TYPE_ID");
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          final body = json.decode(response.body);
          _pastorList = DataPriest
              .fromJson(body)
              .data
              .where((priest) {
            return priest.typeId == _TYPE_ID;
          }).toList();
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
      body: Container(
        margin: EdgeInsets.only(top: 50.0, bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: (_isLoading)
                  ? Center(child: LoadingIndicator())
                  : _isJsonFailed
                  ? failedMessage(context)
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
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppConstants.COMPANY_NAME,
                          style: Theme
                              .of(context)
                              .primaryTextTheme
                              .subhead
                              .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Pastors",
                        style: Theme
                            .of(context)
                            .primaryTextTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold),
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

  Widget _pastorItem(context, Priest pastor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: Text(
            '${pastor.name}',
            style: Theme
                .of(context)
                .primaryTextTheme
                .subhead,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            '${pastor.position ?? ""}\n${pastor.congregation}',
            style: Theme
                .of(context)
                .primaryTextTheme
                .caption,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
