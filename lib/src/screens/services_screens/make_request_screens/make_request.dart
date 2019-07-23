/*
*	 Filename		 :	 make_request.dart
*	 Purpose		 :  Temporary
*  Created		 :   2019-06-13 16:31:23 by Scarlet Witch
*  Updated     :   2019-07-18 16:51 by Detective conan
*  Changes     :   Static
*/

import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';

class MakeRequest {

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

////////////////////////////// Prayer request
    final String prayerRequestInfoText =
        """<p>Prayer Request is free of charge.</p>""";
    final String prayerRequestThankYouMessage = """
    Thank you for sending your prayer request. We will be offering your requests and petitions.
    
    You may view the status of your request in your mailbox.
    """;
    final ChurchFormField prayerRequestFormField1 = ChurchFormField(
      attribute: "write",
      labelText: "Write here...",
      validators: validatorsPlainRequired,
      textFieldType: "multiline",
    );
    final ChurchServiceSubtype prayerRequestServiceSubtype =
        ChurchServiceSubtype(
            subTypeName: "Prayer Request",
            formFields: [
              prayerRequestFormField1,
            ],
            infoText: prayerRequestInfoText,
            thankYouText: prayerRequestThankYouMessage);

    ////////// Mass Request
    final String massRequestInfoText =
        """<p>After submission, you may donate any amount as an offering for your requested mass in your mailbox.</p>""";
    final String massRequestThankYouMessage = """
    Thank you for for sending your mass request. We will be offering your prayer intentions after completing the process in your mailbox.
    
    You may view the status of your request in your mailbox.
    """;
    final ChurchFormField massRequestFormField1 = ChurchFormField(
        attribute: "prayer_intention",
        labelText: "Prayer Intension for",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchFormField massRequestFormField2 = ChurchFormField(
        attribute: "purpose",
        labelText: "Purpose",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchFormField massRequestFormField3 = ChurchFormField(
        attribute: "date_to_offered",
        labelText: "Date to be offered",
        validators: validatorsPlainRequired,
        textFieldType: "date");
    final ChurchFormField massRequestFormField4 = ChurchFormField(
        attribute: "time_of_mass",
        labelText: "Time of Mass",
        validators: validatorsPlainRequired,
        textFieldType: "time");
    final ChurchServiceSubtype massRequestServiceSubtype = ChurchServiceSubtype(
        subTypeName: "Mass Request",
        formFields: [
          massRequestFormField1,
          massRequestFormField2,
          massRequestFormField3,
          massRequestFormField4,
        ],
        infoText: massRequestInfoText,
        thankYouText: massRequestThankYouMessage);

    //////// Liturgical Service
    final String liturgicalInfoText =
        """<p>Liturgical Service for blessing of houses, businesses and cars, as well as annointing of the sickor for other purposes.</p>
        <p>Parishioner may give the officiating priest a donation after the service.</p>
        <p>Exclusive for parishioners of Our Lady of Mount Carmel.</p>""";
    final String liturgicalThankYouMessage = """
    Thank you for requesting a liturgical service. Choose your officiating priest in your mailbox and wait for an approval.
    
    Upon approval, please pick up the officiating priest 30 minutes before the time of event or earlier.

    You may view the status of your request in your mailbox.
    """;
    // TODO change to date field
    final ChurchFormField liturgicalFormField1 = ChurchFormField(
        attribute: "date",
        labelText: "Date",
        validators: validatorsPlainRequired,
        textFieldType: "date");
    // TODO change to time field
    final ChurchFormField liturgicalFormField2 = ChurchFormField(
        attribute: "time",
        labelText: "Time",
        validators: validatorsPlainRequired,
        textFieldType: "time");
    final ChurchFormField liturgicalFormField3 = ChurchFormField(
        attribute: "venue",
        labelText: "Venue Address",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchFormField liturgicalFormField4 = ChurchFormField(
        attribute: "occasion",
        labelText: "Occasion",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchFormField liturgicalFormField5 = ChurchFormField(
        attribute: "contact_person",
        labelText: "Contact Person",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchFormField liturgicalFormField6 = ChurchFormField(
        attribute: "contact_number",
        labelText: "Contact Number",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchServiceSubtype liturgicalServiceSubtype = ChurchServiceSubtype(
        subTypeName: "Liturgical Service",
        formFields: [
          liturgicalFormField1,
          liturgicalFormField2,
          liturgicalFormField3,
          liturgicalFormField4,
          liturgicalFormField5,
          liturgicalFormField6,
        ],
        infoText: liturgicalInfoText,
        thankYouText: liturgicalThankYouMessage);
////////////////////////////  Certification
    final String certificateInfoText =
        """<p>We furnish baptismal certificate and confirmation certificate for parishioners.</p>
        <p>For Purposes such as for Personal file, School, Confirmation, First Communion, Legal documents, SSS requirement, Travel documents, Issuance of Birth Certificate and Marriage.</p>
        <p>Fees:</p>
        <p>Printing Service</p>
        <p>50 php</p>
        <p>You may settle your bill using your debit card, credit card or cash.</p>""";
    final String certificateThankYouMessage = """
    Thank you for your application for Certification. Your application is subject for review, upon approval please settle the application fee.
    
    Please visit Mount Carmel Shrine Head Office to receive your Certificate.

    You may view the status of your request in your mailbox.
    """;
    final ChurchFormField certificateFormField1 = ChurchFormField(
        attribute: "name",
        labelText: "Name",
        validators: validatorsPlainRequired,
        textFieldType: "date");
    final ChurchFormField certificateFormField2 = ChurchFormField(
        attribute: "certificate",
        labelText: "certificate",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchFormField certificateFormField3 = ChurchFormField(
        attribute: "purpose",
        labelText: "Purpose",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchFormField certificateFormField4 = ChurchFormField(
        attribute: "contact_person",
        labelText: "Contact Person",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchFormField certificateFormField5 = ChurchFormField(
        attribute: "contact_number",
        labelText: "Contact Number",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchServiceSubtype certificateServiceSubtype = ChurchServiceSubtype(
        subTypeName: "Certification",
        formFields: [
          certificateFormField1,
          certificateFormField2,
          certificateFormField3,
          certificateFormField4,
          certificateFormField5,
        ],
        infoText: certificateInfoText,
        thankYouText: certificateThankYouMessage);

    /////////////////////////////////////

    return ChurchService(
      serviceReference: serviceReference,
      churchServiceSubtypes: [
        prayerRequestServiceSubtype,
        massRequestServiceSubtype,
        liturgicalServiceSubtype,
        certificateServiceSubtype
      ],
    );
  }
}
