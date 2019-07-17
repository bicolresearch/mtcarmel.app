import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_info/service_info_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';

class ServiceTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO temporary replace with actual data
    final ServiceItem _serviceItem = ServiceItem(
        "1",
        "QC",
        "Prayer Request",
        "Be closer to God with the help of the church through prayers, holy masses and liturgy",
        "https://api.mountcarmel.ph/public/assets/images/icons/makearequest1.png");
    final ChurchServiceSubtype _makeRequest = ChurchServiceSubtype(
      infoText:
          "<p>Be closer to God with the help of the church through prayers, holy masses and liturgy</p>",
      subTypeName: "Make request",
      formFields: [
        ChurchFormField(
          attribute: "plain_text",
          textFieldType: "plain_text",
          labelText: "First name",
          validators: ChurchFormValidators(
              isRequired: "true", errorText: "must not empty"),
        ),
        ChurchFormField(
            attribute: "gender",
            textFieldType: "gender_selection",
            hint: "Select gender",
            labelText: "Gender",
            validators: ChurchFormValidators(errorText: "choose gender"),
            selections: ["male", "female"]),
      ],
    );

    final ChurchServiceSubtype _prayerRequest = ChurchServiceSubtype(
      infoText:
          "<p>Be closer to God with the help of the church through prayers, holy masses and liturgy</p>",
      subTypeName: "Prayer request",
      formFields: [
        ChurchFormField(
          attribute: "plain_text",
          textFieldType: "multiline",
          labelText: "Write here...",
          validators: ChurchFormValidators(
              isRequired: "true", errorText: "must not empty"),
        ),
        ChurchFormField(
            attribute: "gender",
            textFieldType: "gender_selection",
            hint: "Select gender",
            labelText: "Gender",
            validators: ChurchFormValidators(errorText: "choose gender"),
            selections: ["male", "female"]),
      ],
    );

    final ChurchService churchService = ChurchService(
      typeName: "Make request",
      description:
          "Be closer to God with the help of the church through prayers, holy masses and liturgy",
      churchServiceSubtypes: [_makeRequest, _prayerRequest],
    );
    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Column(
            children: <Widget>[
              servicesHeader(context),
              SizedBox(
                height: 10.0,
              ),
//                ////////
              serviceTile(context, _serviceItem),
              SizedBox(
                height: 10.0,
              ),
              lineWidget(),
              Expanded(
                child: ListView.builder(
                  itemCount: churchService.churchServiceSubtypes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServiceInfoScreen(
                                    churchServiceSubtype: churchService
                                        .churchServiceSubtypes[index])));
                        if (result) Navigator.pop(context, true);
                      },
                      child: serviceSpecific(
                          context,
                          churchService
                              .churchServiceSubtypes[index].subTypeName),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
                child: leftArrowBackButton(context: context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
