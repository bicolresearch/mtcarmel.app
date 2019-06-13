/*
*	Filename		:	contact_detail_scree.dart
*	Purpose			:	Displays the church contact details
* Created			: 2019-06-13 15:07:14 by Detective Conan
*	Updated			: 2019-06-13 15:07:14 by Detective Conan 
*	Changes			:
*/


import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/model/contact.dart';
import 'package:mt_carmel_app/src/widgets/item_widget.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';


class ContactDetailScreen extends StatefulWidget {

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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

  Future<void> getJasonData() async{
    var response = await http.get(AppConstants.CONTACT_DETAILS_JSON_URL); 
    if(this.mounted){
      setState(() 
        {
          if (response.statusCode == 200) {
              _contactList = (json.decode(response.body) as List)
            .map((data) => new Contact.fromJson(data))
            .toList();
            _isLoading = false;              
          } 
          else 
          {
            print(response.statusCode);
          _isJsonFailed = true;
          _isLoading = false;
          }
        }
      );
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Contact Details",
                style: AppConstants.OPTION_STYLE3,
                textAlign: TextAlign.center,
              ),
              lineWidget(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: 500.0,
                child: 
                  _contactList.isEmpty
                  ?Container()
                  :_contactDetailContent(context),
              ),
            Spacer(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: leftArrowBackButton(context: context),
              ),
            ),
            ],
          ),
        )        
      )
    );
  }

Widget _contactDetailContent(BuildContext context){
  return Column(children: <Widget>[
    // name of church
    _contactList[0].name.isNotEmpty
    ?itemWidget(
      context: context, 
      label: "Church name", 
      value: _contactList[0].name)
    :Container(),
    // address
    _contactList[0].address.isNotEmpty
    ?itemWidget(
      context: context, 
      label: "Address", 
      value: _contactList[0].address)
    :Container(),
    // email
    _contactList[0].email.isNotEmpty
    ?itemWidget(
      context: context, 
      label: "Email", 
      value: _contactList[0].email)
    :Container(),
    // Social media
    _contactList[0].social_media.isNotEmpty
    ?itemWidget(
      context: context, 
      label: "Social Media", 
      value: _contactList[0].social_media)
    :Container(),
    //landline
    _contactList[0].landline.isNotEmpty
    ?itemWidget(
      context: context, 
      label: "Landline", 
      value: _contactList[0].landline)
    :Container(),
    //mobile
    _contactList[0].mobile.isNotEmpty
    ?itemWidget(
      context: context, 
      label: "Mobile", 
      value: _contactList[0].mobile)
    :Container(),
  ],
  );
}

  
  void close(){    
    this.dispose();
  }    
}