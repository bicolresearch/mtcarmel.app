/*
*	 Filename		 :   communion.dart
*	 Purpose		 :    Temporary
*  Created		 :   2019-06-13 16:34:11 by Scarlet Witch
*  Updated     :   2019-07-22 10:54 by Detective conan
*  Changes     :   temporary
*/

import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';

class Communion {

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

////////////////////////////// First Communion
    final String firstCommunionInfoText =
    """
    <p>Applicant may only have 1 or 2 sponsors during first communion.</p><br>
    <p>Fees:</p><br>
    <p>  Application Fee</p>
    <p>    500 php</p><br>
    <p>Upon submission, you may contact Catechetical Ministry office to schedule your catechesis.</p><br>
    <p>Call 727-94-32 local 411</p>
    <p>Tuesday to Saturdays</p>
    <p>9am-5pm</p><br>
    <p>You may settle your bill using your debit card, credit card or cash.</p>
    """;
    final String firstCommunionThankYouMessage =
    """
    Thank you for your application for First Communion.
    
    First Communion is subject for review and approval by the office.

    Finish transaction by rendering all necessary requirements including attendance for catechesis in your mailbox.

    You may view the status of your request in your mailbox.
    """;

    final ChurchFormField firstCommunionFormField1 = ChurchFormField(
      attribute: "name",
      labelText: "Name",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField firstCommunionFormField2 = ChurchFormField(
      attribute: "birthdate",
      labelText: "Date of Birth",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField firstCommunionFormField3 = ChurchFormField(
      attribute: "home_address",
      labelText: "Home Address",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField firstCommunionFormField4 = ChurchFormField(
      attribute: "date_of_baptism",
      labelText: "Date of Baptism",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField firstCommunionFormField5 = ChurchFormField(
      attribute: "church_of_baptism",
      labelText: "Church of Baptism",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField firstCommunionFormField6 = ChurchFormField(
      attribute: "name_of_father",
      labelText: "Name of Father",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField firstCommunionFormField7 = ChurchFormField(
      attribute: "name_of_mother",
      labelText: "Name of Mother",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField firstCommunionFormField8 = ChurchFormField(
      attribute: "contact_person",
      labelText: "Contact Person",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField firstCommunionFormField9 = ChurchFormField(
      attribute: "contact_number",
      labelText: "Contact Number",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );


    final ChurchServiceSubtype firstCommunionServiceSubtype = ChurchServiceSubtype(
        subTypeName: "First Communion",
        formFields:
        [
          firstCommunionFormField1,
          firstCommunionFormField2,
          firstCommunionFormField3,
          firstCommunionFormField4,
          firstCommunionFormField5,
          firstCommunionFormField6,
          firstCommunionFormField7,
          firstCommunionFormField8,
          firstCommunionFormField9,
        ],
        infoText: firstCommunionInfoText,
        thankYouText: firstCommunionThankYouMessage);

    ////////// Communion of the Sick
    final String communionOfTheSickInfoText =
    """
    <p>Preferred time of visit will only serve as guide and may not always be accurate.</p><br>
    <p>Communion of the Sick is free of charge</p><br>
    <p>Exclusive for parishioners of Our Lady of Mount Carmel</p>
    """;
    final String communionOfTheSickThankYouMessage =
    """
    Thank you for requesting a communion for the sick. We will review your request, please wait for the approval of the office and the Extraordinary Ministers of the Holy Communion.
    
    You may view the status of your request in your mailbox.
    """;

    final ChurchFormField communionOfTheSickFormField1 = ChurchFormField(
      attribute: "name_of_communicant",
      labelText: "Name of Communicant",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField communionOfTheSickFormField2 = ChurchFormField(
      attribute: "birthdate_of_communicant",
      labelText: "Communicant's Date of Birth",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField communionOfTheSickFormField3 = ChurchFormField(
      attribute: "spouse_of_communicant",
      labelText: "Spouse of Communicant",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField communionOfTheSickFormField4 = ChurchFormField(
      attribute: "spouse_birthdate",
      labelText: "Spuse Date of Birth",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField communionOfTheSickFormField5 = ChurchFormField(
      attribute: "communicant_address",
      labelText: "Home Address of  Communicant",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField communionOfTheSickFormField6 = ChurchFormField(
      attribute: "church_marriage_date",
      labelText: "Date of Church Marriage",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField communionOfTheSickFormField7 = ChurchFormField(
      attribute: "last_confession",
      labelText: "Date of Last Confession",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField communionOfTheSickFormField8 = ChurchFormField(
      attribute: "preferred_time_of_visit",
      labelText: "Preferred Time of Visit",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField communionOfTheSickFormField9 = ChurchFormField(
      attribute: "contact_person",
      labelText: "Contact Person",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField communionOfTheSickFormField10 = ChurchFormField(
      attribute: "contact_number",
      labelText: "Contact Number",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchServiceSubtype communionOfTheSickServiceSubtype = ChurchServiceSubtype(
        subTypeName: "Communion of the sick",
        formFields:
        [
          communionOfTheSickFormField1,
          communionOfTheSickFormField2,
          communionOfTheSickFormField3,
          communionOfTheSickFormField4,
          communionOfTheSickFormField5,
          communionOfTheSickFormField6,
          communionOfTheSickFormField7,
          communionOfTheSickFormField8,
          communionOfTheSickFormField9,
          communionOfTheSickFormField10,
        ],
        infoText: communionOfTheSickInfoText,
        thankYouText: communionOfTheSickThankYouMessage);


    /////////////////////////////////////

    return ChurchService(
      serviceReference: serviceReference,
      churchServiceSubtypes:
      [
        firstCommunionServiceSubtype,
        communionOfTheSickServiceSubtype
      ],
    );
  }
}
