/*
*	Filename		:	funeral_chapel_info.dart
*	Purpose			:	funeral chapel info add form
* Created			: 2019-06-13 17:13:32 by jo
*	Updated			:	2019-06-13 17:13:32 by jo 
*	Changes			:
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/passing_screens/funeral_chapel_form.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class FuneralChapelInfo extends StatelessWidget {
  const FuneralChapelInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text("Funeral Chapel", 
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
                Text("There are three available chapels for conducting funeral rites and services.", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),                
                Text("Chapels:", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Mt. Carmel Chapel", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("150 sitting capacity", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("15,000 php/day", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("650 php/excess hour", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("St. Joseph Chapel", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("40 sitting capacity", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("8,000 php/day", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("350 php/excess hour", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Holy Family Chapel", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("40 sitting capacity", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("8,000 php/day", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("350 php/excess hour", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),                
                Text("Chapel Amenities:", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Daily Mass", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Fully air-conditioned", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Refrigerator", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hot and cold water dispenser", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("MIcrowave oven", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Kitchen sink", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Single bed", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Family room", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Restroom", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("24 hour security services", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ample parking space", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Text("You may settle your bill using your debit card, credit card or cash.", style: AppConstants.OPTION_STYLE2,),
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
                          FuneralChapelForm()
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