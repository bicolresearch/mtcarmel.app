/*
*	Filename		:	marriage_info.dart
*	Purpose			:	marriage info add form
* Created			: 2019-06-14 11:59:10 by Scarlet Witch
*	Updated			:	2019-06-14 11:59:10 by Scarlet Witch 
*	Changes			:
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/marriage_screens/marriage_form.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class MarriageInfo extends StatelessWidget {
  const MarriageInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                "Marriage",
                style: Theme.of(context)
                    .primaryTextTheme
                    .title
                    .copyWith(fontWeight: FontWeight.bold),
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
                      Text(
                        "Wedding Rules and Regulations Agreement",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Version 1",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "1. Reservation Fee and Full Payment",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. Wedding should be arranged and scheduled at least 6 months before the wedding date.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. Reserved date is non-movable and non-transferrable.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. Reservation fee of 10,000 php will be accepted upon agreement of contract and National Shrine of Our Lady of Mount Carmel Rules and Regulations. Reservation fee is non-refundable but deductible on remaining balance.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "d. All fees should be settled 2 months before the wedding date.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Wedding package includes use of the church, officiating priest, flowers with tulle, wedding candles or candles for secondary sponsors, wedding usherette, wedding commentator, altar server, red carpet, use of electricity for videos, pre-cana seminar and air conditioned holding area for the bride and choir.",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Wedding package rates:",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "January to November rate",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "29,000 php",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "December rate",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "34,000  php",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "2. Wedding Requirements",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. All requirements must be completed or accomplished at least 1 month before the wedding date exempting bride and groom under special cases which requires a permit from the Chancery Office of the Diocese of Cubao.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Wedding cases the need to secure a permit:",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "i. Mixed marriage (marriage between a Catholic and a non-Catholic or marriage between a Filipino or a foreigner)",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ii. Overseas Filipino working or living abroad for more than 2 years",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "iii. With previous marriage (civilly or in the Roman Catholic church)",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. We reserve the right to cancel a wedding if the requirements were not completed.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. Authorized representatives designated by the bride and groom are duty-bound to comply with the National Shrine of Our Lady of Mount Carmel Rules and Regulations Agreement and will be held responsible for the cancellation of the event for failure to submit all the needed requirements.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "d. National Shrine of Our Lady of Mount Carmel will not be responsible for any correction, fines and penalties that may be required on the marriage certificate already filed with the Quezon City Hall, Civil Registry after its entries were verified by the couple. Likewise, the Shrine is not liable if the couple fail to check their marriage contract as required.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "3. Cancellation",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. In case of cancellation, a written advice must be submitted, otherwise the couple will have to pay the balance due.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. Reservation fee, full-payment, and additional fees made will be forfeited.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. Unclaimed documents will be disposed by the National Shrine of Our Lady of Mount Carmel within 2 months from the day of notice or from the wedding date.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "4. Punctuality",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. The bride and groom, and the whole entourage including the soloist, singers and organist must be at the church premises 30 minutes before their wedding schedule.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. The allotted time for the wedding ceremony is 1 hour and 30 minutes only. Wedding ceremony are as follows, 15 minutes for the entrance procession of the wedding entourage; 45 minutes for the wedding liturgy; 15 minutes for pictorial, 15 minutes for the recessional of the wedding entourage. The wedding entourage should be exiting 15 minutes before the end of their time slot.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. If the bride, groom or the members of the entourage are late for 15 minutes, there will be no Prayers of the Faithful and Offertory Procession; if they are late for 30 minutes, there will be no Homily, Prayers of the Faithful and Offertory Procession; if they are late for 45 minutes, only the Wedding Rite outside the Mass will be celebrated.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "5. Wedding Entourage",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. Bearers and flower girls should be 5 years old and above since they will not need the assistance of parents or guardian when marching down the aisle, which is usually the reason behind the delay of the ceremony.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. Only 5 pairs of principal sponsors are normally allowed. An additional fee of 500 php per person will be charged in excess of the 5 pairs of sponsors.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. The bride and groom must assign persons for the First and Second Reading, Responsorial Psalm and Prayers of the Faithful. Commentator will be provided by the church.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "6. Officiating Priest",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. The bride and groom should inform the parish office 2 months before their wedding if they have their own officiating priest. If no advice was given, the invited priest will only be allowed to concelebrate with the assigned priest.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. For own priest, a photocopy of the priest Celebret ID, Certificate of Registration of Authority to Solemnize Marriage (CRASM) and appointment or endorsement letter from the Bishop is required.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. The Rector/Parish Priest has the right to approve or disapprove permission of the invited priest presider.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "d. In case of mixed marriages, the Shrine will not allow any form of rite, ceremony, or speeches to be conducted by other sects or religions.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "7. Solemnity and Wedding Dress Etiquette",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. To preserve the solemnity of the wedding ceremony, all electronic gadgets are requested to be turned off or set to silent mode. Bride and groom should advice their respective entourages to refrain from unnecessary conversations and movements.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. The attire of the entire marriage entourage should be proper for church decorum. Provocative dresses like strapless, backless, spaghetti strap, bare midriff and off-the-shoulder dresses must be covered by a shawl jacket. We discourage above-the-knee length or miniskirt dresses.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. The National Shrine of Our Lady of Mount Carmel has the right to refuse any member of the entourage who are not properly dressed to join the entrance entourage.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "8. Offertory",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. Recommended list of items to be offered during the wedding are basket of fruits, mass wine and pack of hosts only.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. The bride and groom should assign two persons for the cruets and ciborium which will be provided by the shrine.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. Offertory procession may be cancelled if time constraints to give priority to the more essential parts of the mass.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "9. Church Decoration",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. A simple yet elegant flower decoration in the aisle complete with tulle shall be provided by the shrine. All flower arrangement will be handled by the shrine’s in-house florist.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. For an additional floral arrangement, the bride and groom should submit a design arrangement for approval of the Rector/Parish Priest. Arrangement shall be done accordingly by the shrine’s in-house florist.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. During Lent, no flower decoration is allowed in the altar. The bride and groom are to be reminded that wedding events should respect the special nature of this liturgical season; they should refrain from much pomp or display.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "d. There will be no deduction in the wedding package rate for the flower arrangement if the bride and groom booked their wedding on Lenten season.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "10. Wedding Music",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. Music for the whole ceremony is included in the package.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. During mass, singing may be done only during entrance, offertory, our Father, communion, recessional and photo sessions.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. The invited singer or musician should only render songs and music approved by the Rector/Parish Priest.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "11. Photographers and Videographers",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. The bride and groom must properly endorse the photographers and videographers that will cover the whole wedding ceremony. The 2 photographers and 2 video personnel must be advised that they are required to attend the orientation seminar before their wedding coverage.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. Photographers and videographers not following the shrine’s instructions will be blacklisted.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. Guests of the couples who likewise want to take pictures or videos are allowed but they must remain in their seats.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "12. Church Assistance",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. The shrine coordinator shall assist during the wedding for further instructions for the entourage.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. The bride and groom may assign their wedding coordinators provided that they were properly endorsed and they have attended the shrine’s orientation for coordinators before the wedding.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. Wedding coordinators not following the shrine’s rules and regulations will be blacklisted.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "13. Wedding Missalette",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. The bride and groom my request a standard copy of wedding missalette in the parish office. Digital file or soft copy may be sent through email.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. No alterations or any addition to the approved liturgy should be made. Personal vows are not allowed.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. Draft of printed copy of the bride and groom’s wedding missalette must be submitted to the office for checking before making the final copies. Only checked and approved missalettes will be allowed for distribution during the wedding.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "14. Respect and Solemnity of the Holy Grounds",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. Pets are not allowed to join the wedding procession.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. Cleanliness must be strictly observed inside and outside the shrine. Releasing of doves may be done outside the shrine’s doors.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "c. Only flower petals are allowed as extended greetings; permitted to be showered outside the shrine’s main entrance. Other extended greetings like party poppers, confetti and rice throwing are not permitted.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "d. Fogging and bubbles effect are not allowed inside and outside the shrine.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "e. Closed doors are not allowed.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "15. General Provision",
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "a. Any damage incurred during the wedding by the wedding entourage or guests, the reasonable cost shall be accounted for by the bride and groom.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "b. We have read and signify our agreement on the above terms and conditions of the National Shrine of Our Lady of Mount Carmel Rules and Regulations concerning wedding events and that the National Shrine of Our Lady of Mount Carmel and its personnel will not be held liable to any damages as a result of the enforcement of the said rules and regulations.",
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
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
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.brown,
                    child: Text(
                      "Accept",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MarriageForm()));
                      if (result) Navigator.pop(context, true);
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
