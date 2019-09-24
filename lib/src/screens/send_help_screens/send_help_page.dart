/*
*   Filename    :   send_help_page.dart
*   Purpose     :
*   Created     :   12/09/2019 1:12 PM by Detective Conan
*	 Updated			:   24/09/2019 12:50 PM PM by Detective Conan
*	 Changes			:   Handles displaying the previous data if error encountered after refreshing
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_event.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_state.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab_bloc.dart';
import 'package:mt_carmel_app/src/screens/send_help_screens/send_help_screen.dart';

import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class SendHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabBloc = BlocProvider.of<TabBloc>(context);
    return BlocBuilder<SendHelpBloc, SendHelpState>(
      builder: (context, state) {
        if (state is SendHelpLoading) return LoadingIndicator();
        if (state is SendHelpLoaded) {
          tabBloc.setSendHelpDataList(state.sendHelpDataList);
          return SendHelpScreen();
        }
        if (state is NoSendHelpLoaded) {
          if (tabBloc.sendHelpDataList != null &&
              tabBloc.sendHelpDataList.isNotEmpty) {
            return SendHelpScreen();
          }
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
          if (tabBloc.sendHelpDataList != null &&
              tabBloc.sendHelpDataList.isNotEmpty) {
            return SendHelpScreen();
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
          if (tabBloc.sendHelpDataList != null &&
              tabBloc.sendHelpDataList.isNotEmpty) {
            return SendHelpScreen();
          }
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
