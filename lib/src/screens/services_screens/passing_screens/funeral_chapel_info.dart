/*
*	Filename		:	funeral_chapel_info.dart
*	Purpose			:	funeral chapel info add form
* Created			: 2019-06-13 17:13:32 by Scarlet Witch
*	Updated			:	2019-06-27 18:25:30 by Scarlet Witch 
*	Changes			: added terms and conditions for the use of the chapel
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
                Text("Terms and Conditions for the Use of the Chapel", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.center),
                SizedBox(height: 10.0),  
                Text("1. Person using the Mount Carmel Chapel (hereinafter referred to as the User) shall reimburse the OCD Community any and all expenses to be incurred in the use thereof. Such expenses are inclusive of but not limited to the following:", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.center),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("a.) Use of the hall its own family room and comfort room", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("b.) Air-conditioners", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("c.) Refrigerator", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("d.) Water dispenser", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("e.) Microwave oven", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("f.) Furniture", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("g.) Security", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("h.) maintenance", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                SizedBox(height: 10.0), 
                Text("User agrees to deposit an amount equivalent to at least one day of their projected stay in the chapel. The balance thereof shall be due and payable by the user a day before the Funeral Mass of the deceased. In case of cancellation of the use of chapel, the said deposit is not refundable.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),  
                Text("2. Overnight vigil or wakes, except for the first and last night is discouraged. We encourage the family of the deceased to rest, for which reason; the room shall be closed at 1:00AM and re-opened at 7:00AM. The air-conditioners shall be turned off from 1:00AM to 7:00AM. If, for unavoidable circumstances, the room is required to remain open, the cost for the use of the air-conditioner shall be reimbursed at the separate rate of FIVE HUNDRED PESOS (500.00 Php) per hour.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),  
                Text("3. While security and maintenance are provided, additional security may be provided for the service of the user. The cost thereof shall be reimbursed at the separate rate of FOUR HUNDRED PESOS (400.00 Php) per 8-hour shift.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),  
                Text("4. The entire hall is strictly a NON-SMOKING AREA. Those who wish to smoke can only do so at the Crucified Christ Courtyard which is located outside the hall.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),  
                Text("5. GAMBLING of any nature, LIQUOR of any kind, PARKING IN COURTYARD is strictly prohibited.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),  
                Text("6. No cooking shall be allowed in the rooms. However, heating with the microwave oven is allowed. In case a caterer shall be employed by the family of the deceased to provide food in the premises, the office shall be informed prior to mobilization by the caterer.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),  
                Text("7. While food and drinks are allowed to be brought in and consumed in the hall, the user is responsible for keeping the premises clean.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),  
                Text("8. The number of flower arrangement inside the hall should be limited to maintain the desired coolness of the installed air-conditioners. Excess flower arrangements may be placed in the Crucified Christ Courtyard or in the hallway. We encourage the bereaved family members to advise their relatives and friends to the use of Mass Cards or contribution to their favorite charity as a means of expressing their love.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),  
                Text("9. Should the user schedule masses during the wake, said schedule must first be coordinated with the office. For this purpose, an altar table and mass kit is available for use. Priest of the parish, however, are available subject to their availability.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("10. The funeral mass may be celebrated at the hall anytime. Should the user desire to celebrate the funeral mass at the main altar of the church, they should make arrangements with the parish office beforehand, to ensure that the proposed schedule does not conflict with any other church activity. If the funeral mass is celebrated in the church, we encourage only two flower arrangements be placed near the casket so as not block the view of the priest and the congregation.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("11. In case of power failure, the office shall provide to power the lights, fans and some outlets, but not the air-conditioner.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("12. The water from the faucets in the facility has not been tested for human consumption. Drinking water in 5-Gallon bottles is available in the office for the use of the water dispenser at a reasonable price.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("13. Should there result in any damage to property within the hall, the cost thereof, or reasonable replacement cost shall be for the account of the user.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("14. The user shall hold the office free from any liability whatsoever for the use of the hall.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("15. Lighting of candles during wake is strictly prohibited except when having masses.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("There are three available chapels for conducting funeral rites and services.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),                
                Text("Chapels:", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Mt. Carmel Chapel", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("150 sitting capacity", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("15,000 php/day", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("650 php/excess hour", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("St. Joseph Chapel", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("40 sitting capacity", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("8,000 php/day", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("350 php/excess hour", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Holy Family Chapel", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("40 sitting capacity", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("8,000 php/day", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("350 php/excess hour", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                SizedBox(height: 10.0),                
                Text("Chapel Amenities:", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Daily Mass", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Fully air-conditioned", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Refrigerator", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hot and cold water dispenser", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Microwave oven", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Kitchen sink", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Single bed", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Family room", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Restroom", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("24 hour security services", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ample parking space", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                SizedBox(height: 10.0),
                Text("You may settle your bill using your debit card, credit card or cash.", style: Theme.of(context)
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