/*
*	Filename		:	adult_info.dart
*	Purpose			:	adult info add form
* Created			: 2019-06-13 19:28:41 by Scarlet Witch
*	Updated			:	2019-06-13 19:28:41 by Scarlet Witch 
*	Changes			:
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/baptism_screens/adult_form.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class AdultInfo extends StatelessWidget {
  const AdultInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text("Adult Baptism", 
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
                Text("Schedule:", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Tuesday - Saturdays", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("09:00 AM", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("10:00 AM", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("11:00 AM", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("03:00 PM", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("04:00 PM", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Sundays", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("09:00 AM", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("10:00 AM", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("11:00 AM", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Text("Additional Requirements:", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Adult's Birth Certificate", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("4 Session Catechesis", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Parent Catechesis", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Certification of No Records (from 3 parishes from the Vicariate of Holy Family)", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Text("Fees:", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Venue", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("1,000 php", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Stipend for the Priest", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("1,000 php", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("For every Sponsor", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("100 php", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Panyal, Certificate, Candle for the Parents", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("150 php", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Candle for every Sponsor", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("10 php", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Text("Upon submission,you maycontact Catechetical Ministry office to schedule your catethesis.", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),  
                Text("Call 727-94-32 local 411", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                Text("Tuesdays to Saturdays", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,),
                Text("9am-5pm", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,),  
                SizedBox(height: 10.0),
                Text("All sponsors must be catholic and 18 years old or above.", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("Requirements and fees must be accomplished a week before the baptism.", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("You may settle your bill using your debit card, credit card or cash.", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("Be punctual, only an hour is alloted for the whole baptism.", style: AppConstants.OPTION_STYLE2,),
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
                          AdultForm()
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