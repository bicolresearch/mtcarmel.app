/*
*  Filename    :   service_type_screen.dart
*  Purpose     :   Displays the subtypes of service selected
*  Created     :   2019-07-22 15:12 by Detective Conan
*  Updated     :   2019-07-22 15:12 by Detective Conan
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_info/service_info_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_reference_tile.dart';


class ServiceTypeScreen extends StatefulWidget {

  @required
  final ChurchModule churchModule;

  const ServiceTypeScreen({Key key, this.churchModule}) : super(key: key);

  @override
  _ServiceTypeScreenState createState() => _ServiceTypeScreenState();
}

class _ServiceTypeScreenState extends State<ServiceTypeScreen> {
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
              serviceReferenceTile(context, widget.churchModule?.moduleReference),
              SizedBox(
                height: 10.0,
              ),
              lineWidget(),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.churchModule.churchSubModules?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServiceInfoScreen(
                                    churchServiceSubtype: widget.churchModule
                                        .churchSubModules[index])));
                        if (result) Navigator.pop(context);
                      },
                      child: serviceSpecific(
                          context,
                          widget.churchModule
                              .churchSubModules[index].name),
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
