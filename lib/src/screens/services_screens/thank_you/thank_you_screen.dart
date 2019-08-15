/*
*  Filename    :   thank_you_screen.dart
*  Purpose     :   Displays thank you message after finishing service
*  Created     :   2019-07-17 12:09 by Detective Conan
*  Updated     :   2019-08-15 16:06 by Detective conan
*  Changes     :   changed the message to html view.
*/

import 'package:flutter/material.dart';
import 'package:flutter_html_textview_render/html_text_view.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/widgets/back_button.dart';

class ThankYouScreen extends StatelessWidget {
  final String thankYouText;

  ThankYouScreen({this.thankYouText});
  final GlobalKey _htmlKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Icon(
                  MountCarmelIcons.thankyou,
                  color: Colors.brown,
                  size: 120.0,
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: HtmlTextView(
                          data:
                          "<div style='color: #5d4037'>$thankYouText</div>",
                        ),
                        key: _htmlKey,
                      ),
                    ),
                  ),
                ),
              ),
              backButton(
                  context: context,
                  isNavigateFurtherToTheRoot: true,
                  label: "Finish"),
            ],
          ),
        ),
      ),
    );
  }
}
