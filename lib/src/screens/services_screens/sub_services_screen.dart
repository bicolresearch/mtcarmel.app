/*
*   Filename    :   sub_services_screen.dart
*   Purpose     :
*   Created     :   11/09/2019 2:46 PM by Detective Conan
*	 Updated			:   25/09/2019 3:49 PM PM by Detective Conan
*	 Changes			:   Made Branch name dynamic
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/sub_services_bloc/sub_services_bloc.dart';
import 'package:mt_carmel_app/src/blocs/sub_services_bloc/sub_services_event.dart';
import 'package:mt_carmel_app/src/blocs/sub_services_bloc/sub_services_state.dart';
import 'package:mt_carmel_app/src/screens/services_screens/sub_services_list.dart';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class SubServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<SubServicesBloc, SubServicesState>(
              builder: (context, state) {
                if (state is SubServicesUninitialized ||
                    state is SubServicesLoading) {
                  return LoadingIndicator();
                }
                if (state is SubServicesLoaded) {
                  return SubServicesList();
                }
                if (state is NoSubServicesLoaded) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text("No Sub services loaded.")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Reload",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<SubServicesBloc>(context).dispatch(
                                FetchSubServices(state.moduleReference));
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is SubServicesError) {
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
                            "Retry",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<SubServicesBloc>(context).dispatch(
                                FetchSubServices(state.moduleReference));
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is SubServicesNoConnection) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text("No connection!")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Retry",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<SubServicesBloc>(context).dispatch(
                                FetchSubServices(state.moduleReference));
                          },
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
//          leftArrowBackButton(context: context),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              size: 50.0,
              color: Colors.brown,
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
