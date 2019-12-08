import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_bloc.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_bloc.dart';
import 'package:mt_carmel_app/src/models/adult_baptism.dart';
import 'package:mt_carmel_app/src/models/first_communion.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/adult_baptism_screens/adult_baptism_detail_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/first_communion_screens/first_communion_detail_screen.dart';
import 'package:provider/provider.dart';

class FirstCommunionScreen extends StatefulWidget {
  @override
  _FirstCommunionScreenState createState() => _FirstCommunionScreenState();
}

class _FirstCommunionScreenState extends State<FirstCommunionScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FirstCommunionBloc>(context);
    final serviceName = Provider.of<String>(context);
    List<FirstCommunion> _firstCommunionList =
        bloc.moduleAndDataActions.modules;

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
                    key: Key(_firstCommunionList[index].id),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiProvider(
                              providers: [
                                Provider.value(
                                  value: _firstCommunionList[index],
                                ),
                                Provider<String>.value(value: serviceName),
                              ],
                              child: FirstCommunionDetailScreen(),
                            ),
                          ),
                        );
                      },
                      // TODO  change the method name
                      child: _firstCommunionItem(
                          context, _firstCommunionList[index]),
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
                                          _firstCommunionList[index]);
                                      if (result)
                                        setState(() {
                                          _firstCommunionList.removeAt(index);
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
                itemCount: (_firstCommunionList != null)
                    ? _firstCommunionList.length
                    : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _firstCommunionItem(BuildContext context, FirstCommunion item) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Submitted by:${item.createdBy}",
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
              Text(
                "Status: ${item.statusName}",
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle
                    .copyWith(fontWeight: FontWeight.bold),
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

  _updateRequest(FirstCommunion firstCommunion) {
    // TODO implement code
  }
}
