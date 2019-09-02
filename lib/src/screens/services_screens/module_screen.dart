/*
*  Filename    :   module_screen.dart
*  Purpose     :	
*  Created     :   2019-08-01 16:31 by Detective Conan
*	 Updated			:   02/09/2019 9:30 AM PM by Detective Conan
*	 Changes			:   Margins set to const.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_info/service_info_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:mt_carmel_app/src/widgets/service_header.dart';
import 'package:mt_carmel_app/src/widgets/module_reference_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ModuleScreen extends StatefulWidget {
  @required
  final ModuleReference moduleReference;

  const ModuleScreen({Key key, this.moduleReference}) : super(key: key);

  @override
  _ModuleScreenState createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
  bool _isLoading = true;
  ChurchModule _churchModule;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          ServiceHeader(),
                          SizedBox(
                            height: 10.0,
                          ),
                          ModuleReferenceTile(
                              context: context,
                              moduleReference: _churchModule.moduleReference),
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
                                        builder: (context) => ServiceInfoScreen(
                                            churchServiceSubtype: _churchModule
                                                .churchSubModules[index]),
                                      ),
                                    );
                                    if (result) Navigator.pop(context);
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 70.0),
                                        child: Text(
                                          _churchModule
                                              .churchSubModules[index].name,
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subhead,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 50.0),
                                          child: lineWidget()),
                                    ],
                                  ),
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getChurchModule().then(
      (result) {
        _churchModule = result;
        _isLoading = false;
        setState(() {});
      },
    ).catchError(
      (e) {
        print("ModuleScreen._initState: $e");
        _isLoading = false;
        if (e.toString().contains("No SubModule")) {
          Navigator.pop(context, "No sub-services for ${widget.moduleReference.name}");
        }
      },
    );
  }

  Future _getSubModules() async {
    final List<String> subModules =
        widget.moduleReference.subModules.split(",");

    List<ChurchSubModule> churchSubmodules = [];

    for (var api in subModules) {
      try {
        SubModuleAndFormFields subModuleAndFormFields =
            await _getSubModuleAndFormFields(api);
        churchSubmodules.add(_getChurchSubModule(subModuleAndFormFields, api));
      } catch (e) {
        print("ModuleScreen._getSubModules: $e");
      }
    }

    if (churchSubmodules.isEmpty)
      throw Exception("ModuleScreen._getSubModules: No SubModule retrieved");

    return churchSubmodules;
  }

  ChurchSubModule _getChurchSubModule(
      SubModuleAndFormFields subModuleAndFormFields, String urlApi) {
    return ChurchSubModule(
        name: subModuleAndFormFields.subModule.name,
        formFields: subModuleAndFormFields.formFields,
        acceptanceContent: subModuleAndFormFields.subModule.acceptanceContent,
        thankYouContent: subModuleAndFormFields.subModule.thankYouContent,
        url: subModuleAndFormFields.subModule.url);
  }

  Future<ChurchModule> _getChurchModule() async {
    final churchSubModules = await _getSubModules();

    return ChurchModule(
        moduleReference: widget.moduleReference,
        churchSubModules: churchSubModules);
  }

  Future<SubModuleAndFormFields> _getSubModuleAndFormFields(
      String confraternityUrl) async {
    final response = await http.get(confraternityUrl);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return SubModuleAndFormFields.fromJson(body);
    } else {
      throw Exception("Error in SubModlueAndFormFields data gathering.");
    }
  }
}
