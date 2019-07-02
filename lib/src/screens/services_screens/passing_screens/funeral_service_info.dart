/*
*	Filename		:	funeral_service_info.dart
*	Purpose			:	funeral service info add form
* Created			: 2019-06-13 16:58:39 by Scarlet Witch
*	Updated			:	2019-06-13 16:58:39 by Scarlet Witch 
*	Changes			:
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/passing_screens/funeral_service_form.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class FuneralServiceInfo extends StatelessWidget {
  const FuneralServiceInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text("Funeral Service", 
            style: AppConstants.OPTION_STYLE3,
            textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: lineWidget()),
          SizedBox(height: 30.0),
          Expanded(
              child: SingleChildScrollView(
                child: Container(
                //width: 200.0,
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text("Funeral Service for blessing or conducting mass during the funeral.", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("Parishioner may give the officiating priest a donation after the service.", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),                
                Text("Exclusive for funerals conducted inside Our Lady of Mount Carmel premises.", style: AppConstants.OPTION_STYLE2,),
            ],
            ),
            ),
              ),
          ),        
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  color: Colors.brown,
                  child: Text("Accept", 
                  style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => 
                          FuneralServiceForm()
                        )
                      );
                      if(result)
                        Navigator.pop(context, true);
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
    );
  }
}