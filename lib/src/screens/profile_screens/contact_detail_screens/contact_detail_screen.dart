/*
*	 Filename		 :	 contact_detail_scree.dart
*	 Purpose		 :	 Displays the church contact details
*  Created		 :   2019-06-13 15:07:14 by Detective Conan
*  Updated     :   2019-07-25 08:23 by Detective conan
*  Changes     :   Add converter from html to string.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/contact.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:mt_carmel_app/src/widgets/failed_message.dart';
import 'package:mt_carmel_app/src/widgets/item_widget.dart';
import 'dart:async';
import 'dart:convert';
import 'package:html2md/html2md.dart' as html2md;

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';

class ContactDetailScreen extends StatefulWidget {
  ContactDetailScreen();

  @override
  _ContactDetailScreenState createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  ContactData _contactData;
  var _isLoading = true;
  var _isJsonFailed = false;

  @override
  void initState() {
    super.initState();
    this.getJasonData();
  }

  Future<void> getJasonData() async {
    final branchId = locator<BranchService>().branch.id;
    var response = await http.get(
        "${AppConstants.CONTACT_DETAILS_JSON_URL}?branch_id=$branchId&id=1");
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          final body = json.decode(response.body);
          _contactData = ContactData.fromJson(body);
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
                    ? failedMessage(context)
                    : Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Contact Details",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .title
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Divider(),
                            Expanded(
                              child: Container(
                                child: (_contactData == null)
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
    if (_contactData == null) return Container();

    final List<_ContactItem> contactItems = [
      _ContactItem("Church name", _contactData.name ?? ""),
      _ContactItem("Address",
          '''${_contactData.address1 ?? ""} ${_contactData.address2 ?? ""} 
              ${_contactData.cityName ?? ""} ${_contactData.provinceName ?? ""}
              ${_contactData.countryName ?? ""}
              '''),
      _ContactItem("Email", _contactData.email ?? ""),
//      _ContactItem("Social Media", _contactData.socialMedia ?? ""),
      _ContactItem("Landline", _contactData.landLine ?? ""),
      _ContactItem("Mobile", _contactData.mobile ?? ""),
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
      value: html2md.convert(contactItem.value),
    );
  }
}

class _ContactItem {
  _ContactItem(this.label, this.value);

  final String label;
  final String value;
}
