/*
*  Filename    :   service_type_screen.dart
*  Purpose     :   Displays the subtypes of service selected
*  Created     :   2019-07-22 15:12 by Detective Conan
*  Updated     :   2019-07-22 15:12 by Detective Conan
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_info/service_info_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_reference_tile.dart';


class ServiceTypeScreen extends StatelessWidget {

  @required
  final ChurchService churchService;

  const ServiceTypeScreen({Key key, this.churchService}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
              serviceReferenceTile(context, churchService.serviceReference),
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
              leftArrowBackButton(context: context),
            ],
          ),
        ),
      ),
    );
  }
}
