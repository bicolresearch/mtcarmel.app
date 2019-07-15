/*
*	 Filename		 :	 community_info.dart
*	 Purpose		 :	 community info add form
*  Created		 :   2019-06-13 19:14:36 by Scarlet Witch
*  Updated     :   2019-07-15 09:51 by Detective conan
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/screens/services_screens/baptism_screens/community_form.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class CommunityInfo extends StatelessWidget {
  const CommunityInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text("Community Baptism", 
            style: Theme.of(context)
                      .primaryTextTheme
                      .title.copyWith(fontWeight : FontWeight.bold),
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
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),  
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Sundays", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("02:00 PM", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                SizedBox(height: 10.0),
                Text("Additional Requirements:", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Child's Birth Certificate", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Parent's Marriage Contract", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Permission Letter (if needed)", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                SizedBox(height: 10.0),
                Text("Fees:", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0), 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("For every Sponsor", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("100 php", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Registration, Panyal, Certificate, Candle for the Parents, 2 Candles in glass for the Sponsors (candles for additional sponsors are not included)", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("400 php", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                SizedBox(height: 10.0),
                Text("For non-parishioners, permission letter from your parish must be submitted in Mt. Carmel office.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("All sponsors must be catholic and 18 years old or above.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("Requirements and fees must be accomplished a week before the baptism.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("You may settle your bill using your debit card, credit card or cash.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("Be punctual, only an hour is alloted for the whole baptism.", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
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
                          CommunityForm()
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