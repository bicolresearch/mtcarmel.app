/*
*	Filename		 :	confirmation.dart
*	Purpose			 :	Temporary
* Created			 : 2019-06-13 16:31:54 by Scarlet Witch
*  Updated     :   2019-07-22 13:18 by Detective conan
*  Changes     :   Temporary
*/

import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';

class Confirmation {

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

////////////////////////////// Confirmation
    final String confirmationInfoText =
    """
    <p>Applicant may only have 1 or 2 sponsors during confirmation.</p><br>
    <p>Fees:</p><br>
    <p>  Application Fee</p>
    <p>    500 php</p>
    <p>Upon submission, you may contact Catechetical Ministry office to schedule your catechesis.</p><br>
    <p>Call 727-94-32 local 411</p>
    <p>Tuesday to Saturdays</p>
    <p>9am-5pm</p><br>
    <p>You may settle your bill using your debit card, credit card or cash.</p>
    """;
    final String confirmationThankYouMessage =
    """
    Thank you for your application for Confirmation.
    
    Confirmation is subject for review and approval by the office.

    Finish transaction by rendering all necessary requirements including attendance for catechesis in your mailbox.

    You may view the status of your request in your mailbox.
    """;

    final ChurchFormField confirmationFormField1 = ChurchFormField(
      attribute: "name",
      labelText: "Name",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField confirmationFormField2 = ChurchFormField(
      attribute: "birthdate",
      labelText: "Date of Birth",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField confirmationFormField3 = ChurchFormField(
      attribute: "address",
      labelText: "Home Address",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField confirmationFormField4 = ChurchFormField(
      attribute: "baptism_date",
      labelText: "Date of Baptism",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField confirmationFormField5 = ChurchFormField(
      attribute: "name_of_father",
      labelText: "Name of Father",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField confirmationFormField6 = ChurchFormField(
      attribute: "name_of_mother",
      labelText: "Name of Mother",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField confirmationFormField7 = ChurchFormField(
      attribute: "contact_person",
      labelText: "Contact Person",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );

    final ChurchFormField confirmationFormField8 = ChurchFormField(
      attribute: "contact_number",
      labelText: "Contact Number",
      validators: validatorsPlainRequired,
      textFieldType: "plain_text",
    );


    final ChurchServiceSubtype confirmationServiceSubtype = ChurchServiceSubtype(
        subTypeName: "First Communion",
        formFields:
        [
          confirmationFormField1,
          confirmationFormField2,
          confirmationFormField3,
          confirmationFormField4,
          confirmationFormField5,
          confirmationFormField6,
          confirmationFormField7,
          confirmationFormField8,
        ],
        infoText: confirmationInfoText,
        thankYouText: confirmationThankYouMessage);


    /////////////////////////////////////

    return ChurchService(
      serviceReference: serviceReference,
      churchServiceSubtypes:
      [
        confirmationServiceSubtype
      ],
    );
  }
}