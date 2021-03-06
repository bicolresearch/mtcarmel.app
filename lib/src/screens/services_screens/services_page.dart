/*
*   Filename    :   services_page.dart
*   Purpose     :
*   Created     :   11/09/2019 10:02 AM by Detective Conan
*	 Updated			:   24/09/2019 10:59 AM PM by Detective Conan
*	 Changes			:   Handles displaying previous services if error encountered after refreshed
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_event.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_state.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab_bloc.dart';
import 'package:mt_carmel_app/src/screens/services_screens/services_screen.dart';

import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabBloc = BlocProvider.of<TabBloc>(context);
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        if (state is ServicesUninitialized || state is ServicesLoading) {
          return LoadingIndicator();
        }
        if (state is ServicesLoaded) {
          tabBloc.setModuleReferences(state.moduleReferences);
          return ServicesScreen();
        }
        if (state is ServicesError) {
          if (tabBloc.moduleReferences.isNotEmpty) {
            return ServicesScreen();
          }
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: Text("Something went wrong!")),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.brown,
                  child: Text(
                    "Reload",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<ServicesBloc>(context)
                        .dispatch(FetchServices());
                  },
                ),
              ],
            ),
          );
        }

        if (state is NoServicesLoad) {
          if (tabBloc.moduleReferences.isNotEmpty) {
            return ServicesScreen();
          }
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: Text("No services")),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.brown,
                  child: Text(
                    "Retry",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<ServicesBloc>(context)
                        .dispatch(FetchServices());
                  },
                ),
              ],
            ),
          );
        }
        if (state is ServicesNoConnection) {
          if (tabBloc.moduleReferences.isNotEmpty) {
            return ServicesScreen();
          }
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: Text("No connection")),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.brown,
                  child: Text(
                    "Retry",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<ServicesBloc>(context)
                        .dispatch(FetchServices());
                  },
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
