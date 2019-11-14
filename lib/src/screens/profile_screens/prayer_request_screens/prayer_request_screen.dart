/*
*  Filename    :   prayer_request_screen.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:42 by Detective Conan
*  Updated     :   2019-08-20 16:42 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/crud_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/prayer_request_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/models/prayer_request.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/prayer_request_screens/prayer_requested_detail_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class PrayerRequestScreen extends StatefulWidget {
  @override
  _PrayerRequestScreenState createState() => _PrayerRequestScreenState();
}

class _PrayerRequestScreenState extends State<PrayerRequestScreen> {
  List<PrayerRequest> _prayerRequests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Prayer Request",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: _prayerRequests.isEmpty
                  ? LoadingIndicator()
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return _prayerRequestItem(
                            context, _prayerRequests[index + 1]);
                      },
                      itemCount: _prayerRequests.length - 1,
                    ),
            ),
          ),
          leftArrowBackButton(context: context),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    locator<PrayerRequestService>().getPrayerRequests().then(
      ((value) {
        if (this.mounted)
          setState(() {
            debugPrint(value.toString());
            _prayerRequests = value;
          });
      }),
    );
    super.initState();
  }

  Widget _prayerRequestItem(BuildContext context, PrayerRequest prayerRequest) {
    return Dismissible(
      key: Key(prayerRequest.id),
      child: Card(
        child: ListTile(
          title: Text(
            prayerRequest.createdBy,
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            prayerRequest.prayer,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).primaryTextTheme.title,
            maxLines: 1,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PrayerRequestedDetailScreen(prayerRequest: prayerRequest),
              ),
            );
          },
        ),
      ),
      background: slideHorizontalBackground(
          DismissDirection.startToEnd),
      secondaryBackground: slideHorizontalBackground(
          DismissDirection.endToStart),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd ||
            direction == DismissDirection.endToStart) {
          final bool res = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(
                      "Are you sure you want to delete this ${
                          prayerRequest.prayer ??
                              ""} request?"),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(20.0)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        "Cancel",
                        style:
                        TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () async {
                        final result = await _updateRequest(
                            prayerRequest);
                        if (result)
                          setState(() {
//                            _prayerRequests.removeAt(index);
                          });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
          return res;
        } else {
          // TODO: Navigate to edit page;
        }
        return false;
      },
    );
  }

  Widget slideHorizontalBackground(DismissDirection direction) {
    return Container(
      color: Colors.red,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: (direction == DismissDirection.endToStart)
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  _updateRequest(PrayerRequest prayerRequest) async {
    final userId =
    await locator<AuthenticationService>().getUserId().catchError((e) {
//      throw Exception("Retrieving user id error. $e");
      debugPrint("Retrieving user id error. $e");
    });

    if (userId == null || userId == "") {
      debugPrint("Retrieving user id error.");
      return false;
    }

    final roleId = await locator<AuthenticationService>().getRoleId();
    final branchId = await locator<BranchService>().branch.id;

    var success = false;
    Map<String, String> fieldsValue = {
      "id": "${prayerRequest.id}",
      "name": "${prayerRequest.createdBy}",
      "prayer": "${prayerRequest.prayer}",
      "updated_by": "$userId",
      "status_id": "9",
    };
    fieldsValue.putIfAbsent("user_id", () => userId);
    Map<String, String> casted = fieldsValue.cast();
    final url =
        "https://api.mountcarmel.ph/prayer_request/update/id/${prayerRequest.id}&role_id=$roleId";
    final headers = {"Content-type": "application/x-www-form-urlencoded"};
    debugPrint("$casted");
    debugPrint(url);
    //TODO implement when ready
    locator<CrudService>().put(url, body: casted, headers: headers).then(
      ((value) {
        debugPrint("$value");
        success = value;
      }),
    ).catchError(
          (e) {
        debugPrint("$e");
        success = false;
      },
    );
    return success;
  }
}
