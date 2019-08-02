/*
*  Filename    :   module_screen.dart
*  Purpose     :	
*  Created     :   2019-08-01 16:31 by Detective Conan
*  Updated     :   2019-08-02 10:26 by Detective conan 
*  Changes     :   Implement sub modules gathering and displays
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_info/service_info_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_reference_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ModuleScreen extends StatefulWidget {
  @required
  final List<String> moduleApis;
  @required
  final ServiceItem serviceItem;

  const ModuleScreen({Key key, this.moduleApis, this.serviceItem})
      : super(key: key);

  @override
  _ModuleScreenState createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
  bool _isLoading = true;
  ChurchModule _churchModule;
  List<ChurchSubModule> _churchSubmodules = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 100,
                child: _isLoading
                    ? LoadingIndicator()
                    : Column(
                        children: <Widget>[
                          servicesHeader(context),
                          SizedBox(
                            height: 10.0,
                          ),
                          serviceReferenceTile(
                              context, _churchModule.moduleReference),
                          SizedBox(
                            height: 10.0,
                          ),
                          lineWidget(),
                          Expanded(
                            child: ListView.builder(
                              itemCount: _churchModule.churchSubModules.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ServiceInfoScreen(
                                                    churchServiceSubtype:
                                                        _churchModule
                                                                .churchSubModules[
                                                            index])));
                                    if (result) Navigator.pop(context);
                                  },
                                  child: serviceSpecific(
                                      context,
                                      _churchModule
                                          .churchSubModules[index].name),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
              leftArrowBackButton(context: context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getChurchModule(widget.serviceItem).then((result) {
      _churchModule = result;
      _isLoading = false;
      setState(() {});
    }).catchError((e) {
      print("ModuleScreen._initState: $e");
      _isLoading = false;
    });
  }

  Future _getSubModules() async {
    List<ChurchSubModule> churchSubmodules = [];
    for (var api in widget.moduleApis) {
      try {
        SubModuleAndFormFields subModuleAndFormFields =
            await _getSubModuleAndFormFields(api);
        churchSubmodules.add(_getChurchSubModule(subModuleAndFormFields, api));
      } catch (e) {
        print(e);
      }
    }

    if (churchSubmodules.isEmpty)
      throw "ModuleScreen._getSubModules: No SubModule retrieved";

    return churchSubmodules;
  }

  ChurchSubModule _getChurchSubModule(
      SubModuleAndFormFields subModuleAndFormFields, String urlApi) {
    return ChurchSubModule(
        name: subModuleAndFormFields.subModule.name,
        formFields: subModuleAndFormFields.formFields,
        acceptanceContent: subModuleAndFormFields.subModule.acceptanceContent,
        thankYouContent: subModuleAndFormFields.subModule.thankYouContent,
        url: "$urlApi/create");
  }

  Future<ChurchModule> _getChurchModule(ServiceItem moduleItem) async {
    final ModuleReference moduleReference = ModuleReference(
        moduleItem.id,
        moduleItem.branchId,
        moduleItem.name,
        moduleItem.description,
        moduleItem.coverPhoto);

    final churchSubModules = await _getSubModules();

    return ChurchModule(
        moduleReference: moduleReference, churchSubModules: churchSubModules);
  }

  Future<SubModuleAndFormFields> _getSubModuleAndFormFields(
      String confraternityUrl) async {
    final response = await http.get(confraternityUrl);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return SubModuleAndFormFields.fromJson(body);
    } else {
      throw "Error in SubModlueAndFormFields data gathering.";
    }
  }
}
