import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_bloc.dart';
import 'package:mt_carmel_app/src/models/individual_baptism.dart';
import 'package:provider/provider.dart';

class IndividualBaptismScreen extends StatefulWidget {
  @override
  _IndividualBaptismScreenState createState() =>
      _IndividualBaptismScreenState();
}

class _IndividualBaptismScreenState extends State<IndividualBaptismScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<IndividualBaptismBloc>(context);
    final serviceName = Provider.of<String>(context);
    List<IndividualBaptism> _individualBaptismList = bloc.individualBaptismList;

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
                    key: Key(_individualBaptismList[index].id),
                    child: InkWell(
                      onTap: () {
                        // TODO implement navigation to the detail screen
                      },
                      // TODO  change the method name
                      child: _individualBaptismItem(
                          context, _individualBaptismList[index]),
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
                                          _individualBaptismList[index]);
                                      if (result)
                                        setState(() {
                                          _individualBaptismList
                                              .removeAt(index);
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
                itemCount: (_individualBaptismList != null)
                    ? _individualBaptismList.length
                    : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _individualBaptismItem(BuildContext context, IndividualBaptism item) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Status request: ${item.statusName}",
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Requested by:${item.createdBy}",
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                item.name ?? "",
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

  _updateRequest(IndividualBaptism individualBaptism) {
    // TODO implement code
  }
}
