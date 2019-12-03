/*
*   Filename    :   liturgical_screen.dart
*   Purpose     :
*   Created     :   22/11/2019 9:01 AM by Detective Conan
*	 Updated			:   03/12/2019 3:23 PM PM by Detective Conan
*	 Changes			:   The service name gets from provider.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_bloc.dart';
import 'package:mt_carmel_app/src/models/liturgical.dart';
import 'package:provider/provider.dart';

class LiturgicalScreen extends StatefulWidget {
  @override
  _LiturgicalScreenState createState() => _LiturgicalScreenState();
}

class _LiturgicalScreenState extends State<LiturgicalScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LiturgicalBloc>(context);
    final serviceName = Provider.of<String>(context);
    var _liturgicalList = bloc.liturgicalList;
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
                    key: Key(_liturgicalList[index].id),
                    child: InkWell(
                      onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => MassRequestedDetailScreen(
//                              massRequest: _massRequests[index],
//                              massPurpose: _purposeMassValue(
//                                  _massRequests[index].purposeMass ?? ""),
//                            ),
//                          ),
//                        );
                      },
                      child: _liturgicalRequestItem(context, _liturgicalList[index]),
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
                                    "Are you sure you want to delete this "),
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
                                          _liturgicalList[index]);
                                      if (result)
                                        setState(() {
                                          _liturgicalList.removeAt(index);
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
                itemCount:
                    (_liturgicalList != null) ? _liturgicalList.length : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _liturgicalRequestItem(BuildContext context, Liturgical liturgical) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Status request: ${liturgical.statusName}",
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Requested by: ${liturgical.createdBy}",
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                liturgical.name ?? "",
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

  _updateRequest(Liturgical liturgicalList) {
    // TODO implement code
  }
}
