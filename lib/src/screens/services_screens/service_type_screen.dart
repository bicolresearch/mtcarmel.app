/*
*  Filename    :   service_type_screen.dart
*  Purpose     :   Displays the subtypes of service selected
*  Created     :   2019-07-22 15:12 by Detective Conan
*	 Updated			:   06/09/2019 3:28 PM PM by Detective Conan
*	 Changes			:   Changed the GestureDetector with InkWell
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_info/service_info_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_header.dart';
import 'package:mt_carmel_app/src/widgets/module_reference_tile.dart';

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
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Column(
            children: <Widget>[
              ServiceHeader(),
              SizedBox(
                height: 10.0,
              ),
              ModuleReferenceTile(
                  context: context,
                  moduleReference: widget.churchModule.moduleReference),
              SizedBox(
                height: 10.0,
              ),
              lineWidget(),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.churchModule.churchSubModules?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServiceInfoScreen(
                                    churchServiceSubtype: widget.churchModule
                                        .churchSubModules[index])));
                        if (result) Navigator.pop(context);
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 70.0),
                            child: Text(
                              widget.churchModule.churchSubModules[index].name,
                              style: Theme.of(context).primaryTextTheme.subhead,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 50.0),
                              child: lineWidget()),
                        ],
                      ),
                    );
                  },
                ),
              ),
              leftArrowBackButton(context: context),
            ],
          ),
        ),
    );
  }
}
