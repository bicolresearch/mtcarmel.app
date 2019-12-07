import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_bloc.dart';
import 'package:mt_carmel_app/src/models/adult_baptism.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/adult_baptism_screens/adult_baptism_detail_screen.dart';
import 'package:provider/provider.dart';

class AdultBaptismScreen extends StatefulWidget {
  @override
  _AdultBaptismScreenState createState() => _AdultBaptismScreenState();
}

class _AdultBaptismScreenState extends State<AdultBaptismScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdultBaptismBloc>(context);
    final serviceName = Provider.of<String>(context);
    List<AdultBaptism> _adultBaptismList = bloc.moduleAndDataActions.modules;

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
                    key: Key(_adultBaptismList[index].id),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiProvider(
                              providers: [
                                Provider.value(
                                  value: _adultBaptismList[index],
                                ),
                                Provider<String>.value(value: serviceName),
                              ],
                              child: AdultBaptismDetailScreen(),
                            ),
                          ),
                        );
                      },
                      // TODO  change the method name
                      child:
                          _adultBaptismItem(context, _adultBaptismList[index]),
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
                                          _adultBaptismList[index]);
                                      if (result)
                                        setState(() {
                                          _adultBaptismList.removeAt(index);
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
                    (_adultBaptismList != null) ? _adultBaptismList.length : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _adultBaptismItem(BuildContext context, AdultBaptism item) {
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

  _updateRequest(AdultBaptism adultBaptism) {
    // TODO implement code
  }
}
