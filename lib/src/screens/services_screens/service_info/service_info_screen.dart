import 'package:flutter/material.dart';
import 'package:flutter_html_textview_render/html_text_view.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class ServiceInfoScreen extends StatelessWidget {
  @required
  final ChurchServiceSubtype churchServiceSubtype;

  const ServiceInfoScreen({Key key, this.churchServiceSubtype})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  churchServiceSubtype.subTypeName,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              lineWidget(),
              SizedBox(height: 30.0),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: HtmlTextView(
                    data:
                        "<div style='color: #5d4037'>${churchServiceSubtype.infoText}</div>",
                    anchorColor: Color(0xFFFF0000),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.brown,
                      child: Text(
                        "Accept",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServiceFormScreen(
                                    serviceSubType: churchServiceSubtype)));
                        if (result) Navigator.pop(context, true);
                      },
                    ),
                    leftArrowBackButton(context: context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
