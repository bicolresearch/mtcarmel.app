/*
*   Filename    :   contact_detail_page.dart
*   Purpose     :
*   Created     :   18/09/2019 12:19 PM by Detective Conan
*	 Updated			:   19/09/2019 10:27 AM PM by Detective Conan
*	 Changes			:   Added retry and reload buttons
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/contact_detail_bloc/contact_detail_bloc.dart';
import 'package:mt_carmel_app/src/blocs/contact_detail_bloc/contact_detail_event.dart';
import 'package:mt_carmel_app/src/blocs/contact_detail_bloc/contact_detail_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/contact_detail_screens/contact_detail_screen.dart';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class ContactDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<ContactDetailBloc, ContactDetailState>(
              builder: (context, state) {
                if(state is ContactDetailLoading || state is ContactDetailUninitialized)
                  return Scaffold(body: LoadingIndicator());
                if(state is ContactDetailLoaded){
                  return ContactDetailScreen();
                }
                if(state is ContactDetailError)
                  {
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
                              BlocProvider.of<ContactDetailBloc>(context)
                                  .dispatch(FetchContactDetail());
                            },
                          ),
                        ],
                      ),
                    );
                  }
                if(state is NoContactDetailLoaded)
                  {
                    return Scaffold(
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(child: Text("No contact details.")),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.brown,
                            child: Text(
                              "Reload",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              BlocProvider.of<ContactDetailBloc>(context)
                                  .dispatch(FetchContactDetail());
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
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: leftArrowBackButton(context: context),
          ),
        ],
      ),
    );
  }
}