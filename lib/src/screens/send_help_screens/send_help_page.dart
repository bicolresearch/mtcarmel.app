/*
*   Filename    :   send_help_page.dart
*   Purpose     :
*   Created     :   12/09/2019 1:12 PM by Detective Conan
*	 Updated			:   23/09/2019 10:22 AM PM by Detective Conan
*	 Changes			:   Added message for no connectivity
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_event.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_state.dart';
import 'package:mt_carmel_app/src/screens/send_help_screens/send_help_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class SendHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendHelpBloc, SendHelpState>(
      builder: (context, state) {
        if (state is SendHelpLoading) return LoadingIndicator();
        if (state is SendHelpLoaded) {
          return SendHelpScreen();
        }
        if (state is NoSendHelpLoaded) {
         return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: Text("No type of donation at the moment.")),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.brown,
                  child: Text(
                    "Reload",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<SendHelpBloc>(context)
                        .dispatch(FetchSendHelp());
                  },
                ),
              ],
            ),
          );
        }
        if (state is SendHelpError) {
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
                    BlocProvider.of<SendHelpBloc>(context)
                        .dispatch(FetchSendHelp());
                  },
                ),
              ],
            ),
          );
        }
        if (state is SendHelpNoConnection) {
          return  Scaffold(
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
                    BlocProvider.of<SendHelpBloc>(context)
                        .dispatch(FetchSendHelp());
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
