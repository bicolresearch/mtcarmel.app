/*
*	Filename		:	father_mark_horan_hall_venue_info.dart
*	Purpose			:	father mark horan hall - venue add form
* Created			: 2019-06-13 15:15:58 by Constantina
*	Updated			:	2019-06-13 15:15:58 by Constantina 
*	Changes			: added form comment, update margins and buttons, remove widget GestureDetector
*/
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/event_screen/father_mark_horan_hall_venue_form.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class FatherMarkHoranHallVenueInfo extends StatelessWidget {
  const FatherMarkHoranHallVenueInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text("Father Mark Horan Hall - Venue", 
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
                Text("Father Mark Horan Hall Service Agreement", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.center,), 
                SizedBox(height: 10.0),
                Text("Version 1", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.center,), 
                SizedBox(height: 10.0),
                Text("1. Event and Duration", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("a. Father Mark Horan Hall is available for wedding reception, baptismal, birthday celebration and anniversary celebration.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("b. Client are given a maximum of 3 hours for the use of the Father Mark Horan Hall. Set up time is only 2 hours before the actual time of event.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Text("2. Reservation Fee and Full Payment", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("a. Reservation fee of 50% will be accepted upon agreement of terms and conditions. Reservation fee is non-refundable but deductible on remaining balance.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("b. All fees should be settled 2 weeks before the event. Booking 1 week prior to the event, payment must be in full.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Text("Service package rates:", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Whole area package 1", 
                style: AppConstants.OPTION_STYLE2,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("300 tiffany chairs", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("30 tables", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("30,000 php", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("2,000 php/excess hour", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Whole area package 2", 
                style: AppConstants.OPTION_STYLE2,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("300 monoblock chairs", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("30 tables", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("27,500 php", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("2,000 php/excess hour", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Half area package 1", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("120 tiffany chairs", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("12 tables", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("23,000 php", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("1,000 php/excess hour", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Half area package 2", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("120 monoblock chairs", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("12 tables", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("20,000 php", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("1,000 php/excess hour", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Quarter area package 1", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("80 tiffany chairs", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("8 tables", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("15,000 php", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("500 php/excess hour", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Quarter area package 2", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("80 monoblock chairs", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("8 tables", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("10,000 php", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("500 php/excess hour", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Text("All areas include the use of air conditioner, built-in sound system, ample parking space, clean toilet, LCD projector, and electricity for photo booth and maximum of 2 food carts.", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("3. Reserved Date", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("a. Reserved date is non-movable.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("b. In the event wherein the client requests for a transfer of his/her reservation to another date or transfer his/her reservation to a member of his/her family, the client is requested to submit a letter of intent addressed to the superior of the shrine. If the superior allows the trasfer, the client will be charged for an additional 50% of the down payment made on his/her previous reservation as penalty.", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Text("4. Lights and Sounds", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("a. The services provided by the management include the sound system and the lights for the Father Mark Horan Hall. Other use of electricity-consuming gadgets may be allowed only with the prior approval of the management, such as photo booth, use of LCD projector, lights of more than 1,000 watts. Corresponding fees are to be determined by the management.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("b. Clients may bring their own sound system but no fees will be deducted from the contract package. Live band may be allowed but without drums.", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Text("5. Safety and Security", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("a. The client has the full responsibility toward the safety and security of their guests.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("b. The client and their guests are reminded to secure their valuables at all times. Management shall be free from any liability arising from any unforeseen events such as theft, robbery, accident, and any natural or man-made calamities that may cause harm to the client, their guests and their belongings before, during and after their function at the Father Mark Horan Hall.", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Text("6. Damages", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("a. Should there result in any damage to property incurred by the client or guests within the Father Mark Horan Hall, the cost thereof, or reasonable replacement cost shall be accounted for by the client.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Text("7. Power Outage", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("a. In the event of power outage or brownout, there will be a stand-by generator which will provide power for lights, fans and some outlets but not the air conditioning units.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                SizedBox(height: 10.0),
                Text("There will be no refund if the Father Mark Horan Hall was booked with air conditioning.", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,),
                SizedBox(height: 10.0),
                Text("8. Catering Service", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("a. The client may bring in catering service provider of their choice, all accredited and unaccredited catering service providers must abide with the regulations and policies regarding the use of Father Mark Horan Hall.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("b. The management shall be free from any legal suit and liability with regards to the services rendered by the catering service provider, including issues such as food poisoning and sanitation.", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Text("9. Ground Rules", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("a. Doves and butterflies are not allowed inside the Father Mark Horan Hall.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("b. Use of kerosene or gas torch is strictly prohibited inside Father Mark Horan Hall.", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("c. Swag and drape clothing are strictly prohibited.", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("d. Party poppers are not allowed inside the Father Mark Horan Hall.", style: AppConstants.OPTION_STYLE2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("e. Clients are allowed to bring a maximum of 6 cases of liquor such as Pale Pilsen, Red Horse, San Mig Light,or the same kind only.", style: AppConstants.OPTION_STYLE2,),
                ),
                SizedBox(height: 10.0),
                Text("10. General Provision", 
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.left,),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("a. The client shall hold the management free from any liability whatsoever for the use of the Father Mark Horan Hall.", 
                  style: AppConstants.OPTION_STYLE2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("b. The client's event coordinator must abide with all the rules and regulations. They shall inform the mamagement for any requests 2 weeks prior to the event. Any such requests may be declined without necessity of explanation.", style: AppConstants.OPTION_STYLE2,),
                ),
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
                          FatherMarkHoranHallVenueForm()
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