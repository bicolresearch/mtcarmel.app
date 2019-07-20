/*
*	 Filename		 :	 baptism.dart
*	 Purpose		 :
*  Created		 :   2019-06-13 19:36:12 by Scarlet Witch
*  Updated     :   2019-07-15 09:42 by Detective conan
*  Changes     :   Replaced the textStyle constants with Inherited provider
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
import 'package:mt_carmel_app/src/screens/services_screens/baptism_screens/individual_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/baptism_screens/community_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/baptism_screens/adult_info.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';
////
class Baptism {
  const Baptism({this.serviceItem});

  final ServiceItem serviceItem;

  static dynamic getChurchService(ServiceItem serviceItem) {
    final ServiceReference serviceReference = ServiceReference(
        serviceItem.id,
        serviceItem.branchId,
        serviceItem.name,
        serviceItem.description,
        serviceItem.coverPhoto);

    final ChurchFormValidators validatorsPlainRequired =
    ChurchFormValidators(isRequired: "true", isNumeric: "false");
    final ChurchFormValidators validatorsPlainNotRequired =
    ChurchFormValidators(isRequired: "false");
    final ChurchFormValidators validatorsNumericRequired =
    ChurchFormValidators(isRequired: "true", isNumeric: "true");
    final ChurchFormValidators validatorsNumericNotRequired =
    ChurchFormValidators(isRequired: "false", isNumeric: "true");

////////////////////////////// Individual Baptism
    final String individualBaptismInfoText =
    """
    <p>Schedule:</p>
    <p>Tuesday - Saturdays</p>
    <p>09:00 AM</p>
    <p>10:00 AM</p>
    <p>11:00 AM</p>
    <p>03:00 PM</p>
    <p>04:00 PM</p><br>
    <p>Sundays</p>
    <p>09:00 AM</p>
    <p>10:00 AM</p>
    <p>11:00 AM</p>
    <p>Additional Requirements:</p>
    <p>Child's Birth Certificate</p>
    <p>Parent's Marriage Contract</p>
    <p>Permission Letter (if needed)</p>
    <p>Fees:</p>
    <p>Venue</p>
    <p>1,000 php</p>
    <p>Stipend for the Priest</p>
    <p>1,000 php</p>
    <p>For every Sponsor</p>
    <p>100 php</p>
    <p>Panyal, Certificate, Candle for the Parents, 2 Candles in glass for the Sponsors (candles for additional sponsors are not included)</p>
    <p>300 php</p>
    <p>Reservation Fee (deductible)</p>
    <p>2,000 php</p>
    <p>Baptism will be held in Pilgrim Chapel, St. Joseph Bldg.</p>
    <p>For non-parishioners, permission letter from your parish must be submitted in Mt. Carmel office.</p>
    <p>All sponsors must be catholic and 18 years old or above.</p>
    <p>Requirements and fees must be accomplished a week before the baptism.</p>
    <p>You may settle your bill using your debit card, credit card or cash.</p>
    <p>Be punctual, only an hour is alloted for the whole baptism.</p>
    """;
    final String individualBaptismThankYouMessage =
    """
    Thank you for your application for individual baptism.
    
    Individual Baptism is subject for review and approval by the office and the chosen officiating priest.

    Finish transaction by rendering all necessary requirements in your mailbox.

    You may view the status of your request in your mailbox.
    """;

    final ChurchFormField baptismFormField1 = ChurchFormField(
      attribute: "name_of_child",
      labelText: "Name of Child",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField2 = ChurchFormField(
      attribute: "child_birthday",
      labelText: "Child's Date of Birth",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField3 = ChurchFormField(
      attribute: "child_birthplace",
      labelText: "Child's Place of Birth",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField4 = ChurchFormField(
      attribute: "father_of_child",
      labelText: "Name of Child's Father",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField5 = ChurchFormField(
      attribute: "religion_of_father",
      labelText: "Religion of Child's Father",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField6 = ChurchFormField(
      attribute: "birthdate_of_father",
      labelText: "Father's Date of Birth",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField7 = ChurchFormField(
      attribute: "birthplace_of_father",
      labelText: "Father's Place of Birth",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField8 = ChurchFormField(
      attribute: "mother_of_child",
      labelText: "Name of Child's Mother",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField9 = ChurchFormField(
      attribute: "religion_of_mother",
      labelText: "Religion of Child's Mother",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField10 = ChurchFormField(
      attribute: "birthdate_of_mother",
      labelText: "Mother's Date of Birth",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField11 = ChurchFormField(
      attribute: "birthplace_of_mother",
      labelText: "Mother's Place of Birth",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField12 = ChurchFormField(
      attribute: "child_address",
      labelText: "Present Address of Child",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField13 = ChurchFormField(
      attribute: "marriage_of_parents",
      labelText: "Marriage of Parents",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField14 = ChurchFormField(
      attribute: "place_of_marriage",
      labelText: "Place Marriage",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField15 = ChurchFormField(
      attribute: "contact_person",
      labelText: "Contact Person",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField baptismFormField16 = ChurchFormField(
      attribute: "contact_number",
      labelText: "Contact Number",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    List<ChurchFormField> baptismFormFields =
    [
      baptismFormField1,
      baptismFormField2,
      baptismFormField3,
      baptismFormField4,
      baptismFormField5,
      baptismFormField6,
      baptismFormField7,
      baptismFormField8,
      baptismFormField9,
      baptismFormField10,
      baptismFormField11,
      baptismFormField12,
      baptismFormField13,
      baptismFormField14,
      baptismFormField15,
      baptismFormField16,
    ];

    final ChurchServiceSubtype individualBaptismServiceSubtype = ChurchServiceSubtype(
        subTypeName: "Individual Baptism",
        formFields: baptismFormFields,
        infoText: individualBaptismInfoText,
        thankYouText: individualBaptismThankYouMessage);

    ////////// Community Baptism
    final String communityBaptismInfoText =
    """
    <p>Schedule:</p>
    <p>Sundays</p>
    <p>02:00 PM</p><br>
    <p>Additional Requirements:</p>
    <p>Child's Birth Certificate</p>
    <p>Parent's Marriage Contract</p>
    <p>Permission Letter (if needed)</p><br>
    <p>Fees:</p>
    <p>  For every Sponsor</p><br>
    <p>   100 php</p><br>
    <p>  Registration, Panyal, Certificate, Candle for the Parents, 2 Candles in glass for the Sponsors (candles for additional sponsors are not included)</p>
    <p>  400 php</p><br>
    <p>For non-parishioners, permission letter from your parish must be submitted in Mt. Carmel office.</p>
    <p>All sponsors must be catholic and 18 years old or above.</p>
    <p>Requirements and fees must be accomplished a week before the baptism.</p>
    <p>You may settle your bill using your debit card, credit card or cash.</p>
    <p>Be punctual, only an hour is alloted for the whole baptism.</p>
    """;
    final String communityBaptismThankYouMessage =
    """
    Thank you for your application for Community baptism.
    
    Community Baptism is subject for review and approval by the office.

    Finish transaction by rendering all necessary requirements in your mailbox.

    You may view the status of your request in your mailbox.
    """;
    final ChurchServiceSubtype communityBaptismServiceSubtype = ChurchServiceSubtype(
        subTypeName: "Community Baptism",
        formFields: baptismFormFields,
        infoText: communityBaptismInfoText,
        thankYouText: communityBaptismThankYouMessage);

    //////// Adult Baptism
    final String adultBaptismInfoText =
    """
    <p>Schedule:</p><br>
    <p>Tuesday - Saturdays</p>
    <p>09:00 AM</p>
    <p>10:00 AM</p>
    <p>11:00 AM</p>
    <p>03:00 PM</p>
    <p>04:00 PM</p><br>
    <p>Sundays</p>
    <p>10:00 AM</p>
    <p>11:00 AM</p><br>
    <P>Additional Requirements:</P><br>
    <p>Adult's Birth Certificate</p>
    <p>4 Session Catechesis</p>
    <p>Parent Catechesis</p>
    <p>Certification of No Records (from 3 parishes from the Vicariate of Holy Family)</p><br>
    <p>Fees:</p><br>
    <p>Venue</p><br>
    <p>1,000 php</p><br>
    <p>Stipend for the Priest</p><br>
    <p>1,000 php</p><br>
    <p>For every Sponsor</p>
    <p>100 php</p><br>
    <p>Panyal, Certificate, Candle for the Parents</p><br>
    <p>150 php</p><br>
    <p>Candle for every Sponsor</p><br>
    <p>10 php</p><br>
    <p>Upon submission,you maycontact Catechetical Ministry office to schedule your catethesis.</p><br>
    <p>Call 727-94-32 local 411</p>
    <p>Tuesdays to Saturdays</p>
    <p>9am-5pm</p><br>
    <p>All sponsors must be catholic and 18 years old or above.</p><br>
    <p>Requirements and fees must be accomplished a week before the baptism.</p><br>
    <p>You may settle your bill using your debit card, credit card or cash.</p><br>
    <p>Be punctual, only an hour is alloted for the whole baptism.</p>
    """;
    final String adultBaptismThankYouMessage =
    """
    Thank you for your application for Adult Baptism.
    
    Adult Baptism is subject for review and approval by the office.

    Finish transaction by rendering all necessary requirements including attendance for catechesis in your mailbox.

    You may view the status of your request in your mailbox.
    """;

    final ChurchServiceSubtype adultBaptismServiceSubtype = ChurchServiceSubtype(
        subTypeName: "Adult Baptism",
        formFields: baptismFormFields,
        infoText: adultBaptismInfoText,
        thankYouText: adultBaptismThankYouMessage);

    /////////////////////////////////////

    return ChurchService(
      serviceReference: serviceReference,
      churchServiceSubtypes:
      [
        individualBaptismServiceSubtype,
        communityBaptismServiceSubtype,
        adultBaptismServiceSubtype
      ],
    );
  }
}