import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/certificate_bloc/certificate_bloc.dart';
import 'package:mt_carmel_app/src/models/certificate.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/certificate_screens/certificate_detail_screen.dart';
import 'package:provider/provider.dart';

class CertificateScreen extends StatefulWidget {
  @override
  _CertificateScreenState createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CertificateBloc>(context);
    final serviceName = Provider.of<String>(context);
    List<Certificate> _certificateList = bloc.moduleAndDataActions.modules;

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
                    key: Key(_certificateList[index].id),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiProvider(
                              providers: [
                                Provider.value(
                                  value: _certificateList[index],
                                ),
                                Provider<String>.value(value: serviceName),
                              ],
                              child: CertificateDetailScreen(),
                            ),
                          ),
                        );
                      },
                      // TODO  change the method name
                      child: _certificateItem(context, _certificateList[index]),
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
                                          _certificateList[index]);
                                      if (result)
                                        setState(() {
                                          _certificateList.removeAt(index);
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
                    (_certificateList != null) ? _certificateList.length : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _certificateItem(BuildContext context, Certificate item) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              Text(
//                "Submitted by:${item.createdBy}",
//                style: Theme.of(context)
//                    .primaryTextTheme
//                    .subtitle
//                    .copyWith(fontWeight: FontWeight.bold),
//              ),
              Text(
                "Name in certificate: ${item.name ?? ""}",
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Certificate type: ${item.certificateName}",
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle
                    .copyWith(fontWeight: FontWeight.bold),
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

  _updateRequest(Certificate certificate) {
    // TODO implement code
  }
}
