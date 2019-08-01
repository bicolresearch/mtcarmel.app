/*
*  Filename    :   marriage.dart
*  Purpose     :    Temporary
*  Created     :   2019-07-12 16:52 by Detective Conan
*  Updated     :   2019-07-12 16:52 by Detective Conan
*  Changes     :   Temporary
*/

import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
////
class Marriage {

  dynamic getChurchService(ServiceItem serviceItem) {
    final ModuleReference serviceReference = ModuleReference(
        serviceItem.id,
        serviceItem.branchId,
        serviceItem.name,
        serviceItem.description,
        serviceItem.coverPhoto);

    final String infoText =
    """
    <p>Wedding Rules and Regulations Agreement</p><br>
    <p>Version 1</p><br>
    <p>1. Reservation Fee and Full Payment</p><br>
    <p>a. Wedding should be arranged and scheduled at least 6 months before the wedding date.</p>
    <p>b. Reserved date is non-movable and non-transferrable.</p>
    <p>c. Reservation fee of 10,000 php will be accepted upon agreement of contract and National Shrine of Our Lady of Mount Carmel Rules and Regulations. Reservation fee is non-refundable but deductible on remaining balance.</p>
    <p>d. All fees should be settled 2 months before the wedding date.</p><br>
    <p>Wedding package includes use of the church, officiating priest, flowers with tulle, wedding candles or candles for secondary sponsors, wedding usherette, wedding commentator, altar server, red carpet, use of electricity for videos, pre-cana seminar and air conditioned holding area for the bride and choir.</p><br>
    <p>Wedding package rates:</p><br>
    <p>January to November rate</p>
    <p>    29,000 php</p><br>
    <p>December rate</p>
    <p>34,000  php</p><br>
    <p>2. Wedding Requirements</p><br>
    <p>a. All requirements must be completed or accomplished at least 1 month before the wedding date exempting bride and groom under special cases which requires a permit from the Chancery Office of the Diocese of Cubao.</p><br>
    <p>Wedding cases the need to secure a permit:</p><br>
    <p>i. Mixed marriage (marriage between a Catholic and a non-Catholic or marriage between a Filipino or a foreigner)</p><br>
    <p>ii. Overseas Filipino working or living abroad for more than 2 years</p><br>
    <p>iii. With previous marriage (civilly or in the Roman Catholic church)</p><br>
    <p>b. We reserve the right to cancel a wedding if the requirements were not completed.</p><br>
    <p>c. Authorized representatives designated by the bride and groom are duty-bound to comply with the National Shrine of Our Lady of Mount Carmel Rules and Regulations Agreement and will be held responsible for the cancellation of the event for failure to submit all the needed requirements.</p><br>
    <p>d. National Shrine of Our Lady of Mount Carmel will not be responsible for any correction, fines and penalties that may be required on the marriage certificate already filed with the Quezon City Hall, Civil Registry after its entries were verified by the couple. Likewise, the Shrine is not liable if the couple fail to check their marriage contract as required.</p><br>
    <p>3. Cancellation</p><br>
    <p>a. In case of cancellation, a written advice must be submitted, otherwise the couple will have to pay the balance due.</p><br>
    <p>b. Reservation fee, full-payment, and additional fees made will be forfeited.</p><br>
    <p>c. Unclaimed documents will be disposed by the National Shrine of Our Lady of Mount Carmel within 2 months from the day of notice or from the wedding date.</p><br>
    <p>4. Punctuality</p><br>
    <p>a. The bride and groom, and the whole entourage including the soloist, singers and organist must be at the church premises 30 minutes before their wedding schedule.</p><br>
    <p>b. The allotted time for the wedding ceremony is 1 hour and 30 minutes only. Wedding ceremony are as follows, 15 minutes for the entrance procession of the wedding entourage; 45 minutes for the wedding liturgy; 15 minutes for pictorial, 15 minutes for the recessional of the wedding entourage. The wedding entourage should be exiting 15 minutes before the end of their time slot.</p><br>
    <p>c. If the bride, groom or the members of the entourage are late for 15 minutes, there will be no Prayers of the Faithful and Offertory Procession; if they are late for 30 minutes, there will be no Homily, Prayers of the Faithful and Offertory Procession; if they are late for 45 minutes, only the Wedding Rite outside the Mass will be celebrated.</p><br>
    <p>5. Wedding Entourage</p><br>
    <p>a. Bearers and flower girls should be 5 years old and above since they will not need the assistance of parents or guardian when marching down the aisle, which is usually the reason behind the delay of the ceremony.</p><br>
    <p>b. Only 5 pairs of principal sponsors are normally allowed. An additional fee of 500 php per person will be charged in excess of the 5 pairs of sponsors.</p><br>
    <p>c. The bride and groom must assign persons for the First and Second Reading, Responsorial Psalm and Prayers of the Faithful. Commentator will be provided by the church.</p><br>
    <p>6. Officiating Priest</p><br>
    <p>a. The bride and groom should inform the parish office 2 months before their wedding if they have their own officiating priest. If no advice was given, the invited priest will only be allowed to concelebrate with the assigned priest.</p><br>
    <p>b. For own priest, a photocopy of the priest Celebret ID, Certificate of Registration of Authority to Solemnize Marriage (CRASM) and appointment or endorsement letter from the Bishop is required.</p><br>
    <p>c. The Rector/Parish Priest has the right to approve or disapprove permission of the invited priest presider.</p><br>
    <p>d. In case of mixed marriages, the Shrine will not allow any form of rite, ceremony, or speeches to be conducted by other sects or religions.</p><br>
    <p>7. Solemnity and Wedding Dress Etiquette</p><br>
    <p>a. To preserve the solemnity of the wedding ceremony, all electronic gadgets are requested to be turned off or set to silent mode. Bride and groom should advice their respective entourages to refrain from unnecessary conversations and movements.</p><br>
    <p>b. The attire of the entire marriage entourage should be proper for church decorum. Provocative dresses like strapless, backless, spaghetti strap, bare midriff and off-the-shoulder dresses must be covered by a shawl jacket. We discourage above-the-knee length or miniskirt dresses.</p><br>
    <p>c. The National Shrine of Our Lady of Mount Carmel has the right to refuse any member of the entourage who are not properly dressed to join the entrance entourage.</p><br>
    <p>8. Offertory</p><br>
    <p>a. Recommended list of items to be offered during the wedding are basket of fruits, mass wine and pack of hosts only.</p><br>
    <p>b. The bride and groom should assign two persons for the cruets and ciborium which will be provided by the shrine.</p><br>
    <p>c. Offertory procession may be cancelled if time constraints to give priority to the more essential parts of the mass.</p><br>
    <p>9. Church Decoration</p><br>
    <p>a. A simple yet elegant flower decoration in the aisle complete with tulle shall be provided by the shrine. All flower arrangement will be handled by the shrine’s in-house florist.</p><br>
    <p>b. For an additional floral arrangement, the bride and groom should submit a design arrangement for approval of the Rector/Parish Priest. Arrangement shall be done accordingly by the shrine’s in-house florist.</p><br>
    <p>c. During Lent, no flower decoration is allowed in the altar. The bride and groom are to be reminded that wedding events should respect the special nature of this liturgical season; they should refrain from much pomp or display.</p><br>
    <p>d. There will be no deduction in the wedding package rate for the flower arrangement if the bride and groom booked their wedding on Lenten season.</p><br>
    <p>10. Wedding Music</p><br>
    <p>a. Music for the whole ceremony is included in the package.</p><br>
    <p>b. During mass, singing may be done only during entrance, offertory, our Father, communion, recessional and photo sessions.</p><br>
    <p>c. The invited singer or musician should only render songs and music approved by the Rector/Parish Priest.</p><br>
    <p>11. Photographers and Videographers</p><br>
    <p>a. The bride and groom must properly endorse the photographers and videographers that will cover the whole wedding ceremony. The 2 photographers and 2 video personnel must be advised that they are required to attend the orientation seminar before their wedding coverage.</p><br>
    <p>b. Photographers and videographers not following the shrine’s instructions will be blacklisted.</p><br>
    <p>c. Guests of the couples who likewise want to take pictures or videos are allowed but they must remain in their seats.</p><br>
    <p>12. Church Assistance</p><br>
    <p>a. The shrine coordinator shall assist during the wedding for further instructions for the entourage.</p><br>
    <p>b. The bride and groom may assign their wedding coordinators provided that they were properly endorsed and they have attended the shrine’s orientation for coordinators before the wedding.</p><br>
    <p>c. Wedding coordinators not following the shrine’s rules and regulations will be blacklisted.</p><br>
    <p>13. Wedding Missalette</p><br>
    <p>a. The bride and groom my request a standard copy of wedding missalette in the parish office. Digital file or soft copy may be sent through email.</p><br>
    <p>b. No alterations or any addition to the approved liturgy should be made. Personal vows are not allowed.</p><br>
    <p>c. Draft of printed copy of the bride and groom’s wedding missalette must be submitted to the office for checking before making the final copies. Only checked and approved missalettes will be allowed for distribution during the wedding.</p><br>
    <p>14. Respect and Solemnity of the Holy Grounds</p><br>
    <p>a. Pets are not allowed to join the wedding procession.</p><br>
    <p>b. Cleanliness must be strictly observed inside and outside the shrine. Releasing of doves may be done outside the shrine’s doors.</p><br>
    <p>c. Only flower petals are allowed as extended greetings; permitted to be showered outside the shrine’s main entrance. Other extended greetings like party poppers, confetti and rice throwing are not permitted.</p><br>
    <p>d. Fogging and bubbles effect are not allowed inside and outside the shrine.</p><br>
    <p>e. Closed doors are not allowed.</p><br>
    <p>15. General Provision</p><br>
    <p>a. Any damage incurred during the wedding by the wedding entourage or guests, the reasonable cost shall be accounted for by the bride and groom.</p><br>
    <p>b. We have read and signify our agreement on the above terms and conditions of the National Shrine of Our Lady of Mount Carmel Rules and Regulations concerning wedding events and that the National Shrine of Our Lady of Mount Carmel and its personnel will not be held liable to any damages as a result of the enforcement of the said rules and regulations.</p><br>
    
    """;
    final String thankYouMessage =
    """
    Thank you for your application for marriage.
    
    Marriage is subject for review and approval by the office and the chosen officiating priest.

    Finish transaction by rendering all necessary requirements in your mailbox.

    You may view the status of your request in your mailbox.
    """;

    final ChurchFormValidators validatorsPlainRequired =
    ChurchFormValidators(isRequired: "true", isNumeric: "false");
    final ChurchFormValidators validatorsPlainNotRequired =
    ChurchFormValidators(isRequired: "false");
    final ChurchFormValidators validatorsNumericRequired =
    ChurchFormValidators(isRequired: "true", isNumeric: "true");
    final ChurchFormValidators validatorsNumericNotRequired =
    ChurchFormValidators(isRequired: "false", isNumeric: "true");

    final ChurchFormField formField1 = ChurchFormField(
        attribute: "are_married_civil",
        labelText: "Are both of you civil married?",
        validators: validatorsPlainRequired,
        textFieldType: "yes_no");

    final ChurchFormField formField2 = ChurchFormField(
        attribute: "with_previous_marriage",
        labelText: "Or with any previous marriage?",
        validators: validatorsPlainRequired,
        textFieldType: "yes_no");

    final ChurchFormField formField3 = ChurchFormField(
        attribute: "any_ofw",
        labelText: "Is anyone of you an OFW?",
        validators: validatorsPlainRequired,
        textFieldType: "yes_no");

    final ChurchFormField formField4 = ChurchFormField(
        attribute: "is_living_abroad_three_years",
        labelText: "Or living abroad for 3 years?",
        validators: validatorsPlainRequired,
        textFieldType: "yes_no");

    final ChurchFormField formField5 = ChurchFormField(
        attribute: "is_anyone_widower",
        labelText: "Is anyone of you a widower?",
        validators: validatorsPlainRequired,
        textFieldType: "yes_no");

    ///// groom

    final ChurchFormField formField6 = ChurchFormField(
        attribute: "name_of_groom",
        labelText: "Name of Groom",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField7 = ChurchFormField(
        attribute: "birthdate_of_groom",
        labelText: "Groom's Date of Birth",
        validators: validatorsPlainRequired,
        textFieldType: "date");

    final ChurchFormField formField8 = ChurchFormField(
        attribute: "birthplace_of_groom",
        labelText: "Groom's Birth of Place",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField9 = ChurchFormField(
        attribute: "religion_of_groom",
        labelText: "Religion of Groom",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField10 = ChurchFormField(
        attribute: "occupation_of_groom",
        labelText: "Occupation of Groom",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField11 = ChurchFormField(
        attribute: "name_of_bride",
        labelText: "Name of Bride",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField12 = ChurchFormField(
        attribute: "nationality_of_groom",
        labelText: "Nationality of Groom",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField13 = ChurchFormField(
        attribute: "contact_of_groom",
        labelText: "Contact Number of Groom",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField14 = ChurchFormField(
        attribute: "parish_name_of_groom",
        labelText: "Name of Groom's Parish",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField15 = ChurchFormField(
        attribute: "parish_address_of_groom",
        labelText: "Address of Groom's Parish",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField16 = ChurchFormField(
        attribute: "provincial_address_of_groom",
        labelText: "Provincial Address of Groom",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField17 = ChurchFormField(
        attribute: "father_of_groom",
        labelText: "Name of Groom's Father",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField18 = ChurchFormField(
        attribute: "father_nationality_of_groom",
        labelText: "Nationality of Groom's Father",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField19 = ChurchFormField(
        attribute: "mother_of_groom",
        labelText: "Name of Groom's Mother",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField20 = ChurchFormField(
        attribute: "mother_nationality_of_groom",
        labelText: "Nationality of Groom's Mother",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    /////// Bride
    final ChurchFormField formField21 = ChurchFormField(
        attribute: "name_of_bride",
        labelText: "Name of Bride",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField22 = ChurchFormField(
        attribute: "birthdate_of_bride",
        labelText: "Bride's Date of Birth",
        validators: validatorsPlainRequired,
        textFieldType: "date");

    final ChurchFormField formField23 = ChurchFormField(
        attribute: "birthplace_of_bride",
        labelText: "Bride's Birth of Place",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField24 = ChurchFormField(
        attribute: "religion_of_bride",
        labelText: "Religion of Bride",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField25 = ChurchFormField(
        attribute: "occupation_of_bride",
        labelText: "Occupation of Bride",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField26 = ChurchFormField(
        attribute: "nationality_of_bride",
        labelText: "Nationality of Bride",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField27 = ChurchFormField(
        attribute: "contact_of_bride",
        labelText: "Contact Number of Bride",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField28 = ChurchFormField(
        attribute: "parish_name_of_bride",
        labelText: "Name of Bride's Parish",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField29 = ChurchFormField(
        attribute: "parish_address_of_bride",
        labelText: "Address of Bride's Parish",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField30 = ChurchFormField(
        attribute: "provincial_address_of_bride",
        labelText: "Provincial Address of Groom",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField31 = ChurchFormField(
        attribute: "father_of_groom",
        labelText: "Name of Bride's Father",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField32 = ChurchFormField(
        attribute: "father_nationality_of_bride",
        labelText: "Nationality of Bride's Father",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField33 = ChurchFormField(
        attribute: "mother_of_bride",
        labelText: "Name of Bride's Mother",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField formField34 = ChurchFormField(
        attribute: "mother_nationality_of_bride",
        labelText: "Nationality of Bride's Mother",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");


    final ChurchSubModule churchServiceSubtype = ChurchSubModule(
        name: "Confraternity of Our Lady of Mount Carmel",
        formFields:
        [
          formField1,
          formField2,
          formField3,
          formField4,
          formField5,
          formField6,
          formField7,
          formField8,
          formField9,
          formField10,
          formField11,
          formField12,
          formField13,
          formField14,
          formField15,
          formField16,
          formField17,
          formField18,
          formField19,
          formField20,
          formField21,
          formField22,
          formField23,
          formField24,
          formField25,
          formField26,
          formField27,
          formField28,
          formField29,
          formField30,
          formField31,
          formField32,
          formField33,
          formField34,
        ],
        acceptanceContent: infoText,
        thankYouContent: thankYouMessage);
    return ChurchModule(
        moduleReference: serviceReference,
        churchSubModules: [churchServiceSubtype]);
  }
}