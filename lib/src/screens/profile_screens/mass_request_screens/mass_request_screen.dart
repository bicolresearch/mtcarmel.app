/*
*  Filename    :   prayer_request_screen.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:42 by Detective Conan
*  Updated     :   2019-08-23 10:35 by Detective conan
*  Changes     :   Added confirmation alert dialog upon confirmation.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/mass_request_service.dart';
import 'package:mt_carmel_app/src/core/services/selection_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/mass_request.dart';
import 'package:mt_carmel_app/src/models/selection_api.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/mass_request_screens/mass_requested_detail_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class MassRequestScreen extends StatefulWidget {
  @override
  _MassRequestScreenState createState() => _MassRequestScreenState();
}

class _MassRequestScreenState extends State<MassRequestScreen> {
  static const String _MASS_REQUEST_SELECTION_API =
      "${AppConstants.API_BASE_URL}purpose_mass/";

  List<MassRequest> _massRequests = [];
  List<SelectionApi> _purposeMassTypes = [];

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Mass Request",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: _massRequests.isEmpty
                  ? LoadingIndicator()
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(_massRequests[index].id),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MassRequestedDetailScreen(
                                          massRequest: _massRequests[index],
                                          massPurpose: _purposeMassValue(_massRequests[index].purposeMass ?? "")),
                                ),
                              );
                            },
                            child:
                                _massRequestItem(context, _massRequests[index]),
                          ),
                          background: slideHorizontalBackground(DismissDirection.startToEnd),
                          secondaryBackground: slideHorizontalBackground(DismissDirection.endToStart),
                          confirmDismiss: (direction) async {
                            if (direction == DismissDirection.startToEnd || direction == DismissDirection.endToStart) {
                              final bool res = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Text(
                                          "Are you sure you want to delete this ${_purposeMassValue(_massRequests[index].purposeMass ?? "")} request?"),
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
                                          onPressed: () {
                                            // TODO: Delete the item from DB etc..
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
                      itemCount: _massRequests.length,
                    ),
            ),
          ),
          leftArrowBackButton(context: context),
          SizedBox(
            height: 20.0,
          ),
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
      child: Align(
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
    _initializeList();
    super.initState();
  }

  _initializeList() async {
    await _getPurposeMassTypes();

    locator<MassRequestService>().getMassRequests().then(
      ((value) {
        if (this.mounted)
        setState(() {
          debugPrint(value.toString());
          _massRequests = value;
        });
      }),
    );
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
        margin: EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Text(
              massRequest.author,
              style: Theme.of(context)
                  .primaryTextTheme
                  .title
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
    );
  }
}
