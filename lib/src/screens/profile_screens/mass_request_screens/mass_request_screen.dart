/*
*  Filename    :   prayer_request_screen.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:42 by Detective Conan
*  Updated     :   2019-08-23 10:35 by Detective conan
*  Changes     :   Added confirmation alert dialog upon confirmation.
*/

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/mass_request_bloc/mass_request_bloc.dart';
import 'package:mt_carmel_app/src/constants/api_constants.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/crud_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/mass_request_service.dart';
import 'package:mt_carmel_app/src/core/services/selection_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/mass_request.dart';
import 'package:mt_carmel_app/src/models/selection_api.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/mass_request_screens/mass_requested_detail_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class MassRequestScreen extends StatefulWidget {
  @override
  _MassRequestScreenState createState() => _MassRequestScreenState();
}

class _MassRequestScreenState extends State<MassRequestScreen> {
  static const String _MASS_REQUEST_SELECTION_API =
      "${AppConstants.API_BASE_URL}purpose_mass/";

  List<MassRequest> _massRequests = [];
  List<SelectionApi> _purposeMassTypes = [];

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MassRequestBloc>(context);
    final serviceName = Provider.of<String>(context);
    _massRequests = bloc.massRequest;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "$serviceName",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_massRequests[index].id),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MassRequestedDetailScreen(
                              massRequest: _massRequests[index],
                              massPurpose: _purposeMassValue(
                                  _massRequests[index].purposeMass ?? ""),
                            ),
                          ),
                        );
                      },
                      child: _massRequestItem(context, _massRequests[index]),
                    ),
                    background:
                        slideHorizontalBackground(DismissDirection.startToEnd),
                    secondaryBackground:
                        slideHorizontalBackground(DismissDirection.endToStart),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd ||
                          direction == DismissDirection.endToStart) {
                        final bool res = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                    "Are you sure you want to delete this ${_purposeMassValue(_massRequests[index].purposeMass ?? "")} request?"),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
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
                                      "Delete",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () async {
                                      final result = await _updateRequest(
                                          _massRequests[index]);
                                      if (result)
                                        setState(() {
                                          _massRequests.removeAt(index);
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
                },
                itemCount: (_massRequests != null) ? _massRequests.length : 0,
              ),
            ),
          ),
//          leftArrowBackButton(context: context),
//          SizedBox(
//            height: 20.0,
//          ),
        ],
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

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future _getPurposeMassTypes() async {
    try {
      _purposeMassTypes = await locator<SelectionService>()
          .getSelection(_MASS_REQUEST_SELECTION_API);
    } catch (e) {
      debugPrint(e);
    }
  }

  String _purposeMassValue(String purposeMassId) {
    String purposeMassValue = "";
    for (var item in _purposeMassTypes) {
      if (item.id == purposeMassId) {
        purposeMassValue = item.name;
        break;
      }
    }
    return purposeMassValue;
  }

  Widget _massRequestItem(BuildContext context, MassRequest massRequest) {
    return Card(
      child: Container(
//        margin: EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Status request: ${massRequest.statusName}",
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Requested by: ${massRequest.createdBy}",
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                _purposeMassValue(massRequest.purposeMass ?? ""),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).primaryTextTheme.title,
                maxLines: 1,
              ),
              Text(
                massRequest.name ?? "",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).primaryTextTheme.title,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _updateRequest(MassRequest massRequest) async {
    final userId =
        await locator<AuthenticationService>().getUserId().catchError((e) {
//      throw Exception("Retrieving user id error. $e");
      debugPrint("Retrieving user id error. $e");
    });

    if (userId == null || userId == "") {
      debugPrint("Retrieving user id error.");
      return false;
    }

    var success = false;
    Map<String, String> fieldsValue = {
      "id": "${massRequest.id}",
      "name": "${massRequest.name}",
      "purpose_mass": "${massRequest.purposeMass}",
      "dt_offered": "${massRequest.dtOffered}",
      "time_offered": massRequest.timeOffered,
      "status": "3",
    };
    fieldsValue.putIfAbsent("user_id", () => userId);
    Map<String, String> casted = fieldsValue.cast();
    final url =
        "https://api.mountcarmel.ph/mass_request/update/id/${massRequest.id}";
    final headers = APIConstants.HEADERS;
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
