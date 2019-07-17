import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_html_textview_render/html_text_view.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_field.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';

class ServiceInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO temporary replace with actual data
    final ChurchServiceSubtype _churchServiceSubtype = ChurchServiceSubtype(
        infoText: "<p>This is the infotext</p><p>sample message</p>",
        subTypeName: "Test subTypeName",
        formFields: [
          ChurchFormField(
            attribute: "plain_text",
            textFieldType: "plain_text",
            labelText: "First name",
            validators: ChurchFormValidators(
                isRequired: "true", errorText: "must not empty"),
          ),
          ChurchFormField(
              attribute: "gender",
              textFieldType: "gender_selection",
              hint: "Select gender",
              labelText: "Gender",
              validators: ChurchFormValidators(errorText: "choose gender"),
              selections: ["male", "female"]),
        ]);

    return Material(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  _churchServiceSubtype.subTypeName,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Divider()),
              SizedBox(height: 30.0),
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: HtmlTextView(
                      data:
                          "<div style='color: #5d4037'>${_churchServiceSubtype.infoText}</div>",
                      anchorColor: Color(0xFFFF0000),
                    )),
//              SingleChildScrollView(
//                child: Container(
//                  //width: 200.0,
//                  margin: EdgeInsets.symmetric(horizontal: 40.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text("Mass for the Dead will be offered every 06:00 AM of November.",
//                        style: Theme.of(context)
//                            .primaryTextTheme
//                            .subhead,
//                        textAlign: TextAlign.left,),
//                      SizedBox(height: 10.0),
//                      Text("After submission, you may donate any amount as an offering for your requested mass in your mailbox.", style: Theme.of(context)
//                          .primaryTextTheme
//                          .subhead,),
//                    ],
//                  ),
//                ),
//              ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
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
                                    formFields:
                                        _churchServiceSubtype.formFields)));
                        if (result) Navigator.pop(context, true);
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      child: leftArrowBackButton(context: context),
                    )
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
