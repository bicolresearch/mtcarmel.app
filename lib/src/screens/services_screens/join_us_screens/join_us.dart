/*
*	 Filename		 :	 join_us.dart
*	 Purpose		 :   TEMPORARY
*  Created		 :   2019-06-11 15:52:50 by Detective Conan
*  Updated     :   2019-07-12 16:50 by Detective conan
*  Changes     :   Tempoary
*/

import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';

class JoinUs {

  dynamic getChurchService(ServiceItem serviceItem) {
    final ServiceReference serviceReference = ServiceReference(
        serviceItem.id,
        serviceItem.branchId,
        serviceItem.name,
        serviceItem.description,
        serviceItem.coverPhoto);

    final String infoText =
        """<p>Application Fee, Scapular, Confraternity manual and Certificate of Confraternity</p>
      <br><p>    200 php</p>
      <p>You may settle your bill using your debit card, credit card or cash.</p>""";
    final String thankYouMessage = """
    Thank you for joining the Confraternity. Your application is subject for review, upon approval please settle the application fee.
    
    Please visit Mount Carmel Shrine head office to receive your Scapular, Confraternity Manual and Certificate of Confraternity.

    We will be reaching you through your provided contact details.

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

    final ChurchFormField churchFormField1 = ChurchFormField(
        attribute: "name",
        labelText: "Name",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchFormField churchFormField2 = ChurchFormField(
        attribute: "home_address",
        labelText: "Home Address",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchFormField churchFormField4 = ChurchFormField(
        attribute: "birthday",
        labelText: "Birthday",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");
    final ChurchFormField churchFormField3 = ChurchFormField(
        attribute: "contact_number",
        labelText: "Contact Number",
        validators: validatorsNumericNotRequired,
        textFieldType: "plain_text");

    final ChurchServiceSubtype churchServiceSubtype = ChurchServiceSubtype(
        subTypeName: "Confraternity of Our Lady of Mount Carmel",
        formFields: [
          churchFormField1,
          churchFormField2,
          churchFormField3,
          churchFormField4
        ],
        infoText: infoText,
        thankYouText: thankYouMessage);
    return ChurchService(
        serviceReference: serviceReference,
        churchServiceSubtypes: [churchServiceSubtype]);
  }
}
