/*
*	Filename		:	church_event.dart
*	Purpose			:	
* Created			: 2019-06-11 15:52:50 by Detective Conan
*	Updated			:	2019-06-17 16:04:09 by Scarlet Witch  
*	Changes			: add services messages/content
*/

import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';

class ChurchEvent {

  dynamic getChurchService(ServiceItem serviceItem) {
    final ServiceReference serviceReference = ServiceReference(
        serviceItem.id,
        serviceItem.branchId,
        serviceItem.name,
        serviceItem.description,
        serviceItem.coverPhoto);

    final String infoText =
    """
    <p>Father Mark Horan Hall Service Agreement</p><br>
    <p>Version 1</p><br>
    <p>1. Event and Duration</p><br>
    <p>a. Father Mark Horan Hall is available for wedding reception, baptismal, birthday celebration and anniversary celebration.</p>
    <p>b. Client are given a maximum of 3 hours for the use of the Father Mark Horan Hall. Set up time is only 2 hours before the actual time of event.</p><br>
    <p>2. Reservation Fee and Full Payment</p><br>
    <p>a. Reservation fee of 50% will be accepted upon agreement of terms and conditions. Reservation fee is non-refundable but deductible on remaining balance.</p>
    <p>b. All fees should be settled 2 weeks before the event. Booking 1 week prior to the event, payment must be in full.</p><br>
    <p>Service package rates:</p><br>
    <p>Whole area package 1</p>
    <p>    300 tiffany chairs</p>
    <p>    30 tables</p>
    <p>    30,000 php</p>
    <p>    2,000 php/excess hour</p><br>
    <p>Whole area package 2</p>
    <p>    300 monoblock chairs</p>
    <p>    30 tables</p>
    <p>    27,500 php</p>
    <p>    2,000 php/excess hour</p><br>
    <p>Half area package 1</p>
    <p>    120 tiffany chairs</p>
    <p>    12 tables</p>
    <p>    23,000 php</p>
    <p>    1,000 php/excess hour</p><br>
    <p>Half area package 2</p>
    <p>    120 monoblock chairs</p>
    <p>    12 tables</p>
    <p>    20,000 php</p>
    <p>    1,000 php/excess hour</p><br>
    <p>Quarter area package 1</p>
    <p>    80 tiffany chairs</p>
    <p>    8 tables</p>
    <p>    15,000 php</p>
    <p>    500 php/excess hour</p><br>
    <p>Quarter area package 2</p>
    <p>    80 monoblock chairs</p>
    <p>    8 tables</p>
    <p>    10,000 php</p>
    <p>    500 php/excess hour</p><br>
    <p>All areas include the use of air conditioner, built-in sound system, ample parking space, clean toilet, LCD projector, and electricity for photo booth and maximum of 2 food carts.</p><br>
    <p>3. Reserved Date</p><br>
    <p>  a. Reserved date is non-movable</p>
    <p>  b. In the event wherein the client requests for a transfer of his/her reservation to another date or transfer his/her reservation to a member of his/her family, the client is requested to submit a letter of intent addressed to the superior of the shrine. If the superior allows the trasfer, the client will be charged for an additional 50% of the down payment made on his/her previous reservation as penalty.</p><br>
    <p>5. Safety and Security</p><br>
    <p>  a. The client has the full responsibility toward the safety and security of their guests.</p>
    <p>  b. The client and their guests are reminded to secure their valuables at all times. Management shall be free from any liability arising from any unforeseen events such as theft, robbery, accident, and any natural or man-made calamities that may cause harm to the client, their guests and their belongings before, during and after their function at the Father Mark Horan Hall.</p><br>
    <p>6. Damages</p><br>
    <p>  a. Should there result in any damage to property incurred by the client or guests within the Father Mark Horan Hall, the cost thereof, or reasonable replacement cost shall be accounted for by the client.</p><br>
    <p>7. Power Outage</p>
    <p>  a. In the event of power outage or brownout, there will be a stand-by generator which will provide power for lights, fans and some outlets but not the air conditioning units.</p><br>
    <p>There will be no refund if the Father Mark Horan Hall was booked with air conditioning.</p><br>
    <p>8. Catering Service</p><br>
    <p>  a. The client may bring in catering service provider of their choice, all accredited and unaccredited catering service providers must abide with the regulations and policies regarding the use of Father Mark Horan Hall.</p>
    <p>  b. The management shall be free from any legal suit and liability with regards to the services rendered by the catering service provider, including issues such as food poisoning and sanitation.</p><br>
    <p>9. Ground Rules</p><br>
    <p>  a. Doves and butterflies are not allowed inside the Father Mark Horan Hall.</p>
    <p>  b. Use of kerosene or gas torch is strictly prohibited inside Father Mark Horan Hall.</p>
    <p>  c. Swag and drape clothing are strictly prohibited.</p>
    <p>  d. Party poppers are not allowed inside the Father Mark Horan Hall.</p>
    <p>  e. Clients are allowed to bring a maximum of 6 cases of liquor such as Pale Pilsen, Red Horse, San Mig Light,or the same kind only.</p><br>
    <p>10. General Provision</p><br>
    <p>  a. The client shall hold the management free from any liability whatsoever for the use of the Father Mark Horan Hall.</p>
    <p>  b. The client's event coordinator must abide with all the rules and regulations. They shall inform the mamagement for any requests 2 weeks prior to the event. Any such requests may be declined without necessity of explanation.</p>
    """;
    final String thankYouMessage =
    """
    Thank you for requesting a venue. Scheudule your rental and settle your rental fee in your mailbox.
    
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

    final ChurchFormField churchFormField3 = ChurchFormField(
        attribute: "event_type",
        labelText: "Event Type",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField churchFormField4 = ChurchFormField(
        attribute: "contact_person",
        labelText: "Contact Person",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchFormField churchFormField5 = ChurchFormField(
        attribute: "contact_number",
        labelText: "Contact Number",
        validators: validatorsPlainRequired,
        textFieldType: "plain_text");

    final ChurchServiceSubtype churchServiceSubtype = ChurchServiceSubtype(
        subTypeName: "Father Mark Horan Hall - Venue",
        formFields: [
          churchFormField1,
          churchFormField2,
          churchFormField3,
          churchFormField4,
          churchFormField5,
        ],
        infoText: infoText,
        thankYouText: thankYouMessage);
    return ChurchService(
        serviceReference: serviceReference,
        churchServiceSubtypes: [churchServiceSubtype]);
  }
}