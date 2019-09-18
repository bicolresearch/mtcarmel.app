/*
*	 Filename		 :	 contact_detail_scree.dart
*	 Purpose		 :	 Displays the church contact details
*  Created		 :   2019-06-13 15:07:14 by Detective Conan
*	 Updated			:   18/09/2019 12:31 PM PM by Detective Conan
*	 Changes			:   Moved the fetching of data to bloc.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/contact_detail_bloc/contact_detail_bloc.dart';

import 'package:mt_carmel_app/src/models/contact.dart';
import 'package:mt_carmel_app/src/widgets/item_widget.dart';
import 'package:html2md/html2md.dart' as html2md;

class ContactDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ContactData contactData =
        BlocProvider.of<ContactDetailBloc>(context).contactData;
    debugPrint("$contactData");
    debugPrint("${contactData.name}");
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
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
                      child: (contactData == null)
                          ? Container()
                          : _contactDetailContent(context, contactData),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _contactDetailContent(BuildContext context, ContactData contactData) {
    if (contactData == null) return Container();

    final List<_ContactItem> contactItems = [
      _ContactItem("Church name", contactData.name ?? ""),
      _ContactItem("Address",
          '''${contactData.address1 ?? ""} ${contactData.address2 ?? ""} 
              ${contactData.cityName ?? ""} ${contactData.provinceName ?? ""}
              ${contactData.countryName ?? ""}
              '''),
      _ContactItem("Email", contactData.email ?? ""),
//      _ContactItem("Social Media", _contactData.socialMedia ?? ""),
      _ContactItem("Landline", contactData.landLine ?? ""),
      _ContactItem("Mobile", contactData.mobile ?? ""),
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
