/*
*   Filename    :   module_model_screen.dart
*   Purpose     :
*   Created     :   04/12/2019 3:24 PM by Detective Conan
*   Updated     :   04/12/2019 3:24 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mt_carmel_app/src/blocs/module_model_bloc/module_model_bloc.dart';
import 'package:mt_carmel_app/src/blocs/prayer_request_bloc/prayer_request_bloc.dart';
import 'package:mt_carmel_app/src/blocs/prayer_request_bloc/prayer_request_event.dart';
import 'package:mt_carmel_app/src/constants/action_constants.dart';
import 'package:mt_carmel_app/src/constants/api_constants.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/constants/status_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/crud_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/module_model.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/module_model_reference.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/prayer_request_screens/prayer_request_page.dart';
import 'package:provider/provider.dart';

enum _SwipedEnum { LeftSwiped, RightSwiped, NotSwiped }

class ModuleModelScreen extends StatefulWidget {
  @override
  _ModuleModelScreenState createState() => _ModuleModelScreenState();
}

class _ModuleModelScreenState extends State<ModuleModelScreen> {
  List<ModuleModel> _moduleModels = [];
  bool _isDeleteEnable = false;
  bool _isApprovalEnable = false;
  bool _isReviewEnable = false;
  bool _isOfferEnable = false;
  Icon _leftSwipeActionIcon;
  Icon _rightSwipeActionIcon;
  String _leftSwipeActionText = "";
  String _rightSwipeActionText = "";
  _SwipedEnum _swipedEnum = _SwipedEnum.NotSwiped;
  ModuleModelReference _moduleModelReference;

  String _serviceName;

  static GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    _moduleModelReference = Provider.of<ModuleModelReference>(context);
    _serviceName = _moduleModelReference.serviceName;

    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Text(
              "$_serviceName",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: _moduleModels.isEmpty
                    ? Text(
                        "No prayer requests",
                        style: Theme.of(context).primaryTextTheme.title,
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return _moduleModelItem(context, index);
                        },
                        itemCount: _moduleModels.length,
                      ),
              ),
            ),
          ),
//          leftArrowBackButton(context: context),
        ],
      ),
    );
  }

  Widget _moduleModelItem(BuildContext context, int index) {
    if (_moduleModels[index].statusName == "On-going") {
      return Dismissible(
        key: Key(_moduleModels[index].id),
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
                      _moduleModels[index].createdBy,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _moduleModels[index].prayer ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.title,
                      maxLines: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            _moduleModels[index].statusName ?? "",
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
            // TODO implement navigation to detail screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MultiProvider(
                  providers: [
                    BlocProvider(
                      builder: (context) => PrayerRequestBloc()
                        ..dispatch(FetchPrayerRequest(_moduleModels[index].id)),
                    ),
                    Provider<String>.value(value: _moduleModels[index].id)
                  ],
                  child: PrayerRequestPage(),
                ),
              ),
            );
          },
        ),
        direction: (_rightSwipeActionText == "")
            ? DismissDirection.endToStart
            : DismissDirection.horizontal,
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
          }
          return false;
        },
      );
    } else {
      return InkWell(
        child: Container(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _moduleModels[index].createdBy,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _moduleModels[index].prayer ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).primaryTextTheme.title,
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          _moduleModels[index].statusName ?? "",
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
          // TODO implement navigation to detail screen
//          MultiProvider(
//            providers: [
//              BlocProvider(
//                builder: (context) => PrayerRequestBloc()
//                  ..dispatch(
//                      FetchPrayerRequest(_moduleModelReference.moduleByIdDir)),
//              ),
//              Provider<String>.value(value: _moduleModels[index].id)
//            ],
//            child: PrayerRequestPage(),
//          );
        },
      );
    }
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
                _rightSwipeActionIcon ?? Container(),
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

  _updateRequest(ModuleModel moduleModel, remarks) async {
    final userId =
        await locator<AuthenticationService>().getUserId().catchError((e) {
      debugPrint("Retrieving user id error. $e");
      throw Exception("Retrieving user id error. $e");
    });

    if (userId == null || userId == "") {
      debugPrint("Retrieving user id error.");
      return false;
    }

    final roleId = await locator<AuthenticationService>().getRoleId();
//    final branchId = await locator<BranchService>().branch.id;

    var success = false;
    Map<String, String> fieldsValue = {
//      "id": "${moduleModel.id}",
      "remarks": remarks,
      "status_id": "${_getNewStatusId()}",
    };

//    id, status_id, remarks, user_id
    fieldsValue.putIfAbsent("user_id", () => userId);
    Map<String, String> casted = fieldsValue.cast();
    final url =
        "${AppConstants.API_BASE_URL}${_moduleModelReference.moduleGetAllDir}/update/id/${moduleModel.id}/role_id/$roleId";

    final headers = APIConstants.HEADERS;
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
        throw e;
      },
    );
    return success;
  }

  _showDialog(BuildContext context, int index) {
    return AlertDialog(
      title: Text("$_serviceName"),
      content: FormBuilder(
        key: _fbKey,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${_moduleModels[index].prayer ?? ""}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                ),
                _swipedEnum == _SwipedEnum.LeftSwiped
                    ? FormBuilderTextField(
                        attribute: "remarks",
                        decoration: InputDecoration(labelText: "Remarks"),
//                onChanged: (_){},
                        validators: [FormBuilderValidators.required()],
                      )
                    : Container(),
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
            Navigator.of(context).pop(false);
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
            _fbKey.currentState.save();
            if (_fbKey.currentState.validate()) {
              try {
                final result = await _updateRequest(_moduleModels[index],
                    _fbKey.currentState.value["remarks"] ?? "");
                setState(() {
                  _moduleModels.removeAt(index);
                });
                _showSnackBar();
                Navigator.of(context).pop(result);
              } catch (e) {
                print(e);
                _showSnackBar(msg: "Problem updating request.");
                Navigator.of(context).pop();
              }
            }
          },
        ),
      ],
    );
  }

  void _initialize() {
    final bloc = BlocProvider.of<ModuleModelBloc>(context);
    _moduleModels = bloc.dataActionModuleModel.data.data;
    final actions = bloc.dataActionModuleModel.actions;
    _isDeleteEnable = actions.keys.contains(ActionConstants.DELETE_ID);
    _isApprovalEnable = actions.keys.contains(ActionConstants.APPROVAL_ID);
    _isReviewEnable = actions.keys.contains(ActionConstants.REVIEW_ID);
    _isOfferEnable = actions.keys.contains(ActionConstants.OFFER_ID);
    _leftSwipeActionIcon = _isApprovalEnable
        ? Icon(
            Icons.thumb_down,
            color: Colors.white,
          )
        : Icon(
            Icons.delete,
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
            : null;

    _leftSwipeActionText =
        _isApprovalEnable ? "Deny" : _isOfferEnable ? "Decline" : "Delete";
    _rightSwipeActionText =
        _isApprovalEnable ? "Approve" : _isOfferEnable ? "Offer" : "";
    setState(() {});
  }

  String _getNewStatusId() {
    if (_swipedEnum == _SwipedEnum.RightSwiped) {
      if (_isApprovalEnable) {
        return StatusConstants.APPROVED_ID;
      } else if (_isOfferEnable) {
        return StatusConstants.OFFERED_ID;
      } else // Reviewed
      {
        return StatusConstants.REVIEWED_ID;
      }
    } else {
      if (_isApprovalEnable) {
        return StatusConstants.DENIED_ID;
      } else if (_isOfferEnable) {
        return StatusConstants.DECLINED_ID;
      } else // Reviewed
      {
        return StatusConstants.DELETED_ID;
      }
    }
  }

  _showSnackBar({String msg}) {
    if (msg == null || msg == "") {
      if (_swipedEnum == _SwipedEnum.RightSwiped) {
        if (_isApprovalEnable)
          msg = "Request has been approved.";
        else if (_isOfferEnable)
          msg = "Prayer has been offered.";
        else
          msg = "Request has been reviewed.";
      } else {
        if (_isApprovalEnable)
          msg = "Request has been denied.";
        else if (_isOfferEnable)
          msg = "Prayer has been declined.";
        else
          msg = "Request has been deleted.";
      }
    }
    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "$msg",
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
