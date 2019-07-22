/*
*	 Filename		 :	 passing.dart
*	 Purpose		 :   Temporary
*  Created		 :   2019-06-13 18:22:25 by Scarlet Witch
*  Updated     :   2019-07-12 16:52 by Detective conan
*  Changes     :   Temporary
*/

import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';

////
class Passing {
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

////////////////////////////// Funeral Service
    final String funeralServiceInfoText = """
    <p>Funeral Service for blessing or conducting mass during the funeral.</p><br>
    <p>Parishioner may give the officiating priest a donation after the service.</p><br>
    <p>Exclusive for funerals conducted inside Our Lady of Mount Carmel premises.</p>
    """;
    final String funeralServiceThankYouMessage = """
    Thank you for requesting a funeral service. Choose your officiating priest in your mailbox and wait for an approval.
    
    You may view the status of your request in your mailbox.
    """;
    final ChurchFormField funeralServiceFormField1 = ChurchFormField(
        attribute: "name_of_deceased",
        labelText: "Name of Deceased",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralServiceFormField2 = ChurchFormField(
        attribute: "civil_status",
        labelText: "Civil Status",
        hint: "Select status",
        validators: validatorsPlainRequired,
        textFieldType: "civil_status");

    final ChurchFormField funeralServiceFormField3 = ChurchFormField(
        attribute: "birthdate",
        labelText: "Date of Birth",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralServiceFormField4 = ChurchFormField(
        attribute: "death_date",
        labelText: "Date of Death",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralServiceFormField5 = ChurchFormField(
        attribute: "cause_of_death",
        labelText: "Cause of Death",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralServiceFormField6 = ChurchFormField(
        attribute: "palce_of_funeral",
        labelText: "Place of Funeral service",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralServiceFormField7 = ChurchFormField(
        attribute: "type_of_service",
        labelText: "Type of Service",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralServiceFormField8 = ChurchFormField(
        attribute: "date_of_service",
        labelText: "Date of Service",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralServiceFormField9 = ChurchFormField(
        attribute: "time_of_service",
        labelText: "Time of Service",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralServiceFormField10 = ChurchFormField(
        attribute: "internment_date",
        labelText: "Date of Internment or Inurment",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralServiceFormField11 = ChurchFormField(
        attribute: "internment_place",
        labelText: "Place of Internment or Inurment",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralServiceFormField12 = ChurchFormField(
        attribute: "contact_person",
        labelText: "Contact Person",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralServiceFormField13 = ChurchFormField(
        attribute: "contact_number",
        labelText: "Contact Number",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchServiceSubtype funeralServiceSubtype = ChurchServiceSubtype(
        subTypeName: "Funeral Service",
        formFields: [
          funeralServiceFormField1,
          funeralServiceFormField2,
          funeralServiceFormField3,
          funeralServiceFormField4,
          funeralServiceFormField5,
          funeralServiceFormField6,
          funeralServiceFormField7,
          funeralServiceFormField8,
          funeralServiceFormField9,
          funeralServiceFormField10,
          funeralServiceFormField11,
          funeralServiceFormField12,
          funeralServiceFormField13,
        ],
        infoText: funeralServiceInfoText,
        thankYouText: funeralServiceThankYouMessage);

////////////////////////////// Funeral Service
    final String funeralChapelServiceInfoText = """
    <p>Terms and Conditions for the Use of the Chapel</p><br>
    <p>1. Person using the Mount Carmel Chapel (hereinafter referred to as the User) shall reimburse the OCD Community any and all expenses to be incurred in the use thereof. Such expenses are inclusive of but not limited to the following:</p><br>
    <p>a.) Use of the hall its own family room and comfort room</p>
    <p>b.) Air-conditioners</p>
    <p>c.) Refrigerator</p>
    <p>d.) Water dispenser</p>
    <p>e.) Microwave oven</p>
    <p>f.) Furniture</p>
    <p>g.) Security</p>
    <p>h.) maintenance</p><br>
    <p>User agrees to deposit an amount equivalent to at least one day of their projected stay in the chapel. The balance thereof shall be due and payable by the user a day before the Funeral Mass of the deceased. In case of cancellation of the use of chapel, the said deposit is not refundable.</p><br>
    <p>2. Overnight vigil or wakes, except for the first and last night is discouraged. We encourage the family of the deceased to rest, for which reason; the room shall be closed at 1:00AM and re-opened at 7:00AM. The air-conditioners shall be turned off from 1:00AM to 7:00AM. If, for unavoidable circumstances, the room is required to remain open, the cost for the use of the air-conditioner shall be reimbursed at the separate rate of FIVE HUNDRED PESOS (500.00 Php) per hour.</p><br>
    <p>3. While security and maintenance are provided, additional security may be provided for the service of the user. The cost thereof shall be reimbursed at the separate rate of FOUR HUNDRED PESOS (400.00 Php) per 8-hour shift.</p><br>
    <p>4. The entire hall is strictly a NON-SMOKING AREA. Those who wish to smoke can only do so at the Crucified Christ Courtyard which is located outside the hall.</p><br>
    <p>5. GAMBLING of any nature, LIQUOR of any kind, PARKING IN COURTYARD is strictly prohibited.</p><br>
    <p>6. No cooking shall be allowed in the rooms. However, heating with the microwave oven is allowed. In case a caterer shall be employed by the family of the deceased to provide food in the premises, the office shall be informed prior to mobilization by the caterer.</p><br>
    <p>7. While food and drinks are allowed to be brought in and consumed in the hall, the user is responsible for keeping the premises clean.</p><br>
    <p>8. The number of flower arrangement inside the hall should be limited to maintain the desired coolness of the installed air-conditioners. Excess flower arrangements may be placed in the Crucified Christ Courtyard or in the hallway. We encourage the bereaved family members to advise their relatives and friends to the use of Mass Cards or contribution to their favorite charity as a means of expressing their love.</p><br>
    <p>9. Should the user schedule masses during the wake, said schedule must first be coordinated with the office. For this purpose, an altar table and mass kit is available for use. Priest of the parish, however, are available subject to their availability.</p><br>
    <p>10. The funeral mass may be celebrated at the hall anytime. Should the user desire to celebrate the funeral mass at the main altar of the church, they should make arrangements with the parish office beforehand, to ensure that the proposed schedule does not conflict with any other church activity. If the funeral mass is celebrated in the church, we encourage only two flower arrangements be placed near the casket so as not block the view of the priest and the congregation.</p><br>
    <p>11. In case of power failure, the office shall provide to power the lights, fans and some outlets, but not the air-conditioner.</p><br>
    <p>12. The water from the faucets in the facility has not been tested for human consumption. Drinking water in 5-Gallon bottles is available in the office for the use of the water dispenser at a reasonable price.</p><br>
    <p>13. Should there result in any damage to property within the hall, the cost thereof, or reasonable replacement cost shall be for the account of the user.</p><br>
    <p>14. The user shall hold the office free from any liability whatsoever for the use of the hall.</p><br>
    <p>15. Lighting of candles during wake is strictly prohibited except when having masses.</p><br>
    <p>There are three available chapels for conducting funeral rites and services.</p><br>
    <p>Chapels:</p><br>
    <p>Mt. Carmel Chapel</p><br>
    <p>    150 sitting capacity</p>
    <p>    15,000 php/day</p>
    <p>    650 php/excess hour</p><br>
    <p>St. Joseph Chapel</p><br>
    <p>    40 sitting capacity</p>
    <p>    8,000 php/day</p>
    <p>    350 php/excess hour</p><br>
    <p>Holy Family Chapel</p><br>
    <p>    40 sitting capacity</p>
    <p>    8,000 php/day</p>
    <p>    350 php/excess hour</p><br>
    <p>Chapel Amenities:</p><br>
    <p>Daily Mass</p><br>
    <p>Fully air-conditioned</p>
    <p>Refrigerator</p>
    <p>Hot and cold water dispenser</p>
    <p>Microwave oven</p>
    <p>Kitchen sink</p>
    <p>Single bed</p>
    <p>Family room</p>
    <p>Restroom</p>
    <p>24 hour security services</p>
    <p>Ample parking space</p><br>
    <p>You may settle your bill using your debit card, credit card or cash.</p>
    """;
    final String funeralChapelServiceThankYouMessage = """
    Thank you for requesting a funeral chapel. Schedule your rental and settle your rental fee in your mailbox.
    
    You may view the status of your request in your mailbox.
    """;
    final ChurchFormField funeralChapelFormField1 = ChurchFormField(
        attribute: "name_of_deceased",
        labelText: "Name of Deceased",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField2 = ChurchFormField(
        attribute: "age",
        labelText: "Age",
        validators: validatorsNumericRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField3 = ChurchFormField(
        attribute: "marital_status",
        labelText: "Marital Status",
        hint: "Select marital status",
        validators: validatorsPlainRequired,
        textFieldType: "civil_status");

    final ChurchFormField funeralChapelFormField4 = ChurchFormField(
        attribute: "address",
        labelText: "Address",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField5 = ChurchFormField(
        attribute: "birthdate",
        labelText: "Date of Birth",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField6 = ChurchFormField(
        attribute: "death_date",
        labelText: "Date of Death",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField7 = ChurchFormField(
        attribute: "cause_of_death",
        labelText: "Cause of Death",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField8 = ChurchFormField(
        attribute: "burial_date",
        labelText: "Date of Burial",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField9 = ChurchFormField(
        attribute: "burial_place",
        labelText: "Place of Burial",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField10 = ChurchFormField(
        attribute: "contact_person",
        labelText: "Contact Person",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField11 = ChurchFormField(
        attribute: "relationship_with_the_deceased",
        labelText: "Relationship with the Deceased",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField12 = ChurchFormField(
        attribute: "mobile_number",
        labelText: "Mobile number",
        validators: validatorsNumericNotRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField13 = ChurchFormField(
        attribute: "landline_number",
        labelText: "Landline Number",
        validators: validatorsNumericNotRequired,
        textFieldType: "plain_text");

    final ChurchFormField funeralChapelFormField14 = ChurchFormField(
        attribute: "email",
        labelText: "Email",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchServiceSubtype funeralChapelServiceSubtype =
        ChurchServiceSubtype(
            subTypeName: "Funeral Chapel",
            formFields: [
              funeralChapelFormField1,
              funeralChapelFormField2,
              funeralChapelFormField3,
              funeralChapelFormField4,
              funeralChapelFormField5,
              funeralChapelFormField6,
              funeralChapelFormField7,
              funeralChapelFormField8,
              funeralChapelFormField9,
              funeralChapelFormField10,
              funeralChapelFormField11,
              funeralChapelFormField12,
              funeralChapelFormField13,
              funeralChapelFormField14,
            ],
            infoText: funeralChapelServiceInfoText,
            thankYouText: funeralChapelServiceThankYouMessage);

    ////////////////////////////// Crypt Lobby
    final String cryptLobbyServiceInfoText = """
    <p>Crypt Lobby is available for conducting mass for the dead.</p><br>
    <p>Fees:</p><br>
    <p>Crypt Lobby</p><br>
    <p>    20 sitting capacity</p>
    <p>    500 php/hour</p><br>
    <p>You may settle your bill using your debit card, credit card or cash.</p>
    """;
    final String cryptLobbyServiceThankYouMessage = """
    Thank you for requesting a mass for the dead at the crypt lobby. Schedule your rental and settle your rental fee in your mailbox
    
    You may view the status of your request in your mailbox.
    """;
    final ChurchFormField cryptLobbyFormField1 = ChurchFormField(
        attribute: "name_of_deceased",
        labelText: "Name of Deceased",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField cryptLobbyFormField2 = ChurchFormField(
        attribute: "contact_person",
        labelText: "Contact Person",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField cryptLobbyFormField3 = ChurchFormField(
        attribute: "contact_number",
        labelText: "Contact Number",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchServiceSubtype cryptLobbyServiceSubtype = ChurchServiceSubtype(
        subTypeName: "Crypt Lobby",
        formFields:
        [
          cryptLobbyFormField1,
          cryptLobbyFormField2,
          cryptLobbyFormField3,
        ],
        infoText: cryptLobbyServiceInfoText,
        thankYouText: cryptLobbyServiceThankYouMessage);

    ////////////////////////////// November Mass
    final String novemberMassServiceInfoText =
    """
    <p>Mass for the Dead will be offered every 06:00 AM of November.</p><br>
    <p>After submission, you may donate any amount as an offering for your requested mass in your mailbox.</p>
    """;
    final String novemberMassServiceThankYouMessage =
    """
    Thank you for  sending your mass request. We will be offering your masses for the dead on November after completing the process in your mailbox.
    
    You may view the status of your request in your mailbox.
    """;
    final ChurchFormField novemberMassFormField1 = ChurchFormField(
        attribute: "name_of_deceased",
        labelText: "Name of Deceased",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField novemberMassFormField2 = ChurchFormField(
        attribute: "name",
        labelText: "Name",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField novemberMassFormField3 = ChurchFormField(
        attribute: "home_address",
        labelText: "Home Address",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchServiceSubtype novemberMassServiceSubtype = ChurchServiceSubtype(
        subTypeName: "November Masses for the Dead",
        formFields:
        [
          novemberMassFormField1,
          novemberMassFormField2,
          novemberMassFormField3,
        ],
        infoText: novemberMassServiceInfoText,
        thankYouText: novemberMassServiceThankYouMessage);

    /////////////////////////////////////

    return ChurchService(
      serviceReference: serviceReference,
      churchServiceSubtypes: [
        funeralServiceSubtype,
        funeralChapelServiceSubtype,
        cryptLobbyServiceSubtype,
        novemberMassServiceSubtype,
      ],
    );
  }
}
