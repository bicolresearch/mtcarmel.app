/*
*	 Filename		 :	 contact_detail_scree.dart
*	 Purpose		 :	 Displays the church contact details
*  Created		 :   2019-06-13 15:07:14 by Detective Conan
*  Updated     :   2019-07-11 15:37 by Detective conan
*  Changes     :   Removed tags on contact details.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/models/contact.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:mt_carmel_app/src/widgets/failed_message.dart';
import 'package:mt_carmel_app/src/widgets/item_widget.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';

class ContactDetailScreen extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  ContactDetailScreen();

  @override
  _ContactDetailScreenState createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  List<Contact> _contactList = [];
  var _isLoading = true;
  var _isJsonFailed = false;

  @override
  void initState() {
    super.initState();
    this.getJasonData();
  }

  Future<void> getJasonData() async {
    var response = await http.get(AppConstants.CONTACT_DETAILS_JSON_URL);
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          _contactList = (json.decode(response.body) as List)
              .map((data) => new Contact.fromJson(data))
              .toList();
        } else {
          print(response.statusCode);
          _isJsonFailed = true;
        }
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: (_isLoading)
                ? LoadingIndicator()
                : _isJsonFailed
                    ? failedMessage()
                    : Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Contact Details",
                              style: AppConstants.OPTION_STYLE3,
                              textAlign: TextAlign.center,
                            ),
                            Divider(),
                            Expanded(
                              child: Container(
                                child: _contactList.isEmpty
                                    ? Container()
                                    : _contactDetailContent(context),
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: leftArrowBackButton(context: context),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _contactDetailContent(BuildContext context) {
    if (_contactList.isEmpty) return Container();

    final List<_ContactItem> contactItems = [
      _ContactItem("Church name", _contactList[0].name ?? ""),
      _ContactItem("Address",
          "${_contactList[0].address1 ?? ""}\n${_contactList[0].address2 ?? ""}"),
      _ContactItem("Email", _contactList[0].email ?? ""),
      _ContactItem("Social Media", _contactList[0].socialMedia ?? ""),
      _ContactItem("Landline", _contactList[0].landline ?? ""),
      _ContactItem("Mobile", _contactList[0].mobile ?? ""),
    ];

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 50.0,
      ),
      child: ListView.builder(
          physics: ScrollPhysics(parent: ScrollPhysics()),
          shrinkWrap: true,
          itemCount: contactItems.length,
          itemBuilder: (context, index) {
            return _contactItem(context, contactItems[index]);
          }),
    );
  }

  Widget _contactItem(BuildContext context, _ContactItem contactItem) {
    if (contactItem.value == null || contactItem.value.isEmpty)
      return Container();
    return itemWidget(
        context: context,
        label: contactItem.label,
        value: noTags(contactItem.value));
  }

  String noTags(String text) {
    return text
        .replaceAll("<p>", "")
        .replaceAll("</p> ", "\n")
        .replaceAll("</p>", "")
        .replaceAll("/br", "\n");
  }
}

class _ContactItem {
  _ContactItem(this.label, this.value);

  final String label;
  final String value;
}
