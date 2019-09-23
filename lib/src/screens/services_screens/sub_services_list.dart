/*
*   Filename    :   sub_services_list.dart
*   Purpose     :
*   Created     :   11/09/2019 2:48 PM by Detective Conan
*   Updated     :   11/09/2019 2:48 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/sub_services_bloc/sub_services_bloc.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_info/service_info_screen.dart';

import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/module_reference_tile.dart';
import 'package:mt_carmel_app/src/widgets/service_header.dart';
import 'package:provider/provider.dart';

class SubServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SubServicesBloc>(context);
    final churchModule = bloc.churchModule;
    final moduleReference =
        BlocProvider.of<SubServicesBloc>(context).moduleReference;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        child: Container(
//              height: MediaQuery.of(context).size.height - 100,
          child: Column(
            children: <Widget>[
              ServiceHeader(),
              SizedBox(
                height: 10.0,
              ),
              ModuleReferenceTile(
                  context: context, moduleReference: moduleReference),
              SizedBox(
                height: 10.0,
              ),
              lineWidget(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: churchModule.churchSubModules.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Provider<ChurchSubModule>.value(
                                value: churchModule.churchSubModules[index],
                                child: ServiceInfoScreen(),
                              );
                            },
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
                              churchModule.churchSubModules[index].name,
                              style: Theme.of(context).primaryTextTheme.subhead,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
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
      ),
    );
  }
}
