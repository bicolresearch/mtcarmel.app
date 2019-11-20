/*
*  Filename    :   prayer_request_screen.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:42 by Detective Conan
*  Updated     :   2019-08-20 16:42 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/blocs/prayer_request_bloc/prayer_request_bloc.dart';
import 'package:mt_carmel_app/src/constants/action_constants.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/crud_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/prayer_request.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/prayer_request_screens/prayer_requested_detail_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';

enum _SwipedEnum { LeftSwiped, RightSwiped, NotSwiped }

class PrayerRequestScreen extends StatefulWidget {
  @override
  _PrayerRequestScreenState createState() => _PrayerRequestScreenState();
}

class _PrayerRequestScreenState extends State<PrayerRequestScreen> {
  List<PrayerRequest> _prayerRequests = [];
  bool _isDeleteEnable = false;
  bool _isApprovalEnable = false;
  bool _isReviewEnable = false;
  bool _isOfferEnable = false;
  String _newStatusId = "";
  Icon _leftSwipeActionIcon;
  Icon _rightSwipeActionIcon;
  String _leftSwipeActionText = "";
  String _rightSwipeActionText = "";
  _SwipedEnum _swipedEnum = _SwipedEnum.NotSwiped;

  static GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

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
              "Prayer Requests",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: _prayerRequests.isEmpty
                    ? Text(
                        "No prayer requests",
                        style: Theme.of(context).primaryTextTheme.title,
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return _prayerRequestItem(context, index);
                        },
                        itemCount: _prayerRequests.length,
                      ),
              ),
            ),
          ),
          leftArrowBackButton(context: context),
        ],
      ),
    );
  }

  Widget _prayerRequestItem(BuildContext context, int index) {
    return Dismissible(
      key: Key(_prayerRequests[index].id),
      child: InkWell(
        child: Container(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _prayerRequests[index].createdBy,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _prayerRequests[index].prayer,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).primaryTextTheme.title,
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          _prayerRequests[index].statusName,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).primaryTextTheme.caption,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PrayerRequestedDetailScreen(
                  prayerRequest: _prayerRequests[index]),
            ),
          );
        },
      ),
      background: _slideRightBackground(),
      secondaryBackground: _slideLeftBackground(),
      confirmDismiss: (direction) async {
        direction == DismissDirection.startToEnd
            ? _swipedEnum = _SwipedEnum.RightSwiped
            : _swipedEnum = _SwipedEnum.LeftSwiped;
        if (direction == DismissDirection.startToEnd ||
            direction == DismissDirection.endToStart) {
          final bool res = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return _showDialog(context, index);
              });
          return res;
        } else {
          // TODO: Navigate to edit page;
        }
        return false;
      },
    );
  }

  Widget _slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _leftSwipeActionIcon,
                Text(
                  "$_leftSwipeActionText",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
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

  Widget _slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _rightSwipeActionIcon,
                Text(
                  "$_rightSwipeActionText",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
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
//      "id": "${prayerRequest.id}",
      "remarks": "",
      "status_id": "$_newStatusId",
    };

//    id, status_id, remarks, user_id
    fieldsValue.putIfAbsent("user_id", () => userId);
    Map<String, String> casted = fieldsValue.cast();
    final url =
        "${AppConstants.API_BASE_URL}/prayer_requests/update/id/${prayerRequest.id}/role_id/$roleId";

    final headers = {"Content-type": "application/x-www-form-urlencoded"};
    debugPrint("$casted");
    debugPrint(url);
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

  _showDialog(BuildContext context, int index) {
    return AlertDialog(
      title: Text("Prayer request"),
      content: FormBuilder(
        key: _fbKey,
        child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${_prayerRequests[index].prayer}",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.start,
              ),
              FormBuilderTextField(
                attribute: "remarks",
                decoration: InputDecoration(labelText: "Remarks"),
//                onChanged: (_){},
                validators: [FormBuilderValidators.required()],
              ),
            ],
          ),
        ),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            _swipedEnum == _SwipedEnum.LeftSwiped
                ? _leftSwipeActionText
                : _rightSwipeActionText,
            style: TextStyle(
                color: _swipedEnum == _SwipedEnum.LeftSwiped
                    ? Colors.red
                    : Colors.green),
          ),
          onPressed: () async {
            final result = await _updateRequest(_prayerRequests[index]);
            if (result) print(result);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
//
//    return AlertDialog(
//      title: Text("Prayer request"),
//      content: Text(
//        "${_prayerRequests[index].prayer}",
//        overflow: TextOverflow.ellipsis,
//        maxLines: 3,
//      ),
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//      actions: <Widget>[
//        FlatButton(
//          child: Text(
//            "Cancel",
//            style: TextStyle(color: Colors.black),
//          ),
//          onPressed: () {
//            Navigator.of(context).pop();
//          },
//        ),
//        FlatButton(
//          child: Text(
//            _swipedEnum == _SwipedEnum.LeftSwiped
//                ? _leftSwipeActionText
//                : _rightSwipeActionText,
//            style: TextStyle(
//                color: _swipedEnum == _SwipedEnum.LeftSwiped
//                    ? Colors.red
//                    : Colors.green),
//          ),
//          onPressed: () async {
//            final result = await _updateRequest(_prayerRequests[index]);
//            if (result) print(result);
//            Navigator.of(context).pop();
//          },
//        ),
//      ],
//    );
  }

  void _initialize() {
    final bloc = BlocProvider.of<PrayerRequestBloc>(context);
    _prayerRequests = bloc.dataActionPrayerRequest.data.data;
    final actions = bloc.dataActionPrayerRequest.actions;
    _isDeleteEnable = actions.keys.contains(ActionConstants.DELETE_ID);
    _isApprovalEnable = actions.keys.contains(ActionConstants.APPROVAL_ID);
    _isReviewEnable = actions.keys.contains(ActionConstants.REVIEW_ID);
    _isOfferEnable = actions.keys.contains(ActionConstants.OFFER_ID);
    _leftSwipeActionIcon = _isDeleteEnable
        ? Icon(
            Icons.delete,
            color: Colors.white,
          )
        : Icon(
            Icons.thumb_down,
            color: Colors.white,
          );
    _rightSwipeActionIcon = _isApprovalEnable
        ? Icon(
            Icons.thumb_up,
            color: Colors.white,
          )
        : _isOfferEnable
            ? Icon(
                MountCarmelIcons.makearequest,
                color: Colors.white,
              )
            : Container();
    _leftSwipeActionText =
        _isDeleteEnable ? "Delete" : _isApprovalEnable ? "Reject" : "Decline";
    _rightSwipeActionText =
        _isApprovalEnable ? "Reject" : _isOfferEnable ? "Offered" : "";
  }

  _content(String prayer) {
    switch (_swipedEnum) {
      case _SwipedEnum.LeftSwiped:
        return "Are you sure you want to $_leftSwipeActionText this prayer\n$prayer";
      case _SwipedEnum.RightSwiped:
        return "Are you sure you want to $_rightSwipeActionText this prayer\n$prayer";
      case _SwipedEnum.NotSwiped:
        return "";
    }
  }
}
