/*
*  Filename    :   send_help_detail_screen.dart
*  Purpose     :   Displays the details of a selected donation.
*  Created     :   2019-07-10 15:30 by Detective Conan
*  Updated     :   2019-07-11 09:10 by Detective conan
*  Changes     :   Fixed the overflowing of details box.
*                  Hides the details box when textEditing.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mt_carmel_app/src/models/send_help.dart';
import 'package:mt_carmel_app/src/utils/payment_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import '../../constants/app_constants.dart';

class SendHelpDetails extends StatefulWidget {
  SendHelpDetails(this.sendHelp);

  final SendHelp sendHelp;

  @override
  _SendHelpDetailsState createState() => _SendHelpDetailsState();
}

class _SendHelpDetailsState extends State<SendHelpDetails>
    with TickerProviderStateMixin {
  TextEditingController _textControllerAmount;
  bool _isTextEditing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              child: CachedNetworkImage(
                  key: Key(widget.sendHelp.coverPhoto.replaceAll("/", "")),
                  imageUrl:
                      AppConstants.API_BASE_URL + widget.sendHelp.coverPhoto,
                  placeholder: (context, url) => LoadingIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  fit: BoxFit.cover),
            ),
            Column(
              children: <Widget>[
                _isTextEditing
                    ? Container(
                        height: 100.0,
                      )
                    : Expanded(
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _detailsBox(context),
                        )),
                      ),
                _buttonsAndFields(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonsAndFields() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
            child: SizedBox(
              height: 40.0,
              child: TextField(
                onTap: () {
                  _isTextEditing = true;
                },
                onSubmitted: (_) {
                  _isTextEditing = false;
                },
                controller: _textControllerAmount,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Amount",
                ),
              ),
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.brown,
            child: Text(
              "Send help",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(),
                ),
              );
            },
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Back",
                style:
                    TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailsBox(context) {
    return _slider(
      children: [
        _firstItem(),
      ],
    );
  }

  Widget _firstItem() {
    return Container(
      color: Color.fromARGB(100, 255, 255, 255),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(AppConstants.MT_CARMEL_LOGO_PATH, height: 120),
              SizedBox(
                height: 20.0,
              ),
              Text(
                widget.sendHelp.description,
                style: Theme.of(context)
                      .primaryTextTheme
                      .title.copyWith(fontWeight : FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Divider(color: Colors.brown),
              Text(
                AppConstants.sample_message + AppConstants.sample_message,
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _textControllerAmount = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textControllerAmount.dispose();
    super.dispose();
  }

  Widget _second_item() {
    return Container(
      child: Icon(
        Icons.access_alarm,
        size: 200,
      ),
    );
  }

  Widget _third_item() {
    return Container(
      child: Icon(
        Icons.ac_unit,
        size: 200,
      ),
    );
  }

  Widget _slider({
    @required List<Widget> children,
  }) {
    var imagesController = TabController(length: children.length, vsync: this);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
//        height: 250.0,
        child: Center(
          child: DefaultTabController(
            length: children.length,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: children,
                ),
                Container(
                  alignment: FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
