/*
*   Filename    :   home_screen.dart
*   Purpose     :
*   Created     :   02/09/2019 10:57 AM by Detective Conan
*	 Updated			:   17/09/2019 1:09 PM PM by Detective Conan
*	 Changes			:   Moved the TabBloc provider to calling class.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_state.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_bloc.dart';
import 'package:mt_carmel_app/src/blocs/profile_bloc/profile_bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_bloc.dart';
import 'package:mt_carmel_app/src/blocs/transparency_bloc/transparency_bloc.dart';
import 'package:mt_carmel_app/src/screens/home_bottom_navigator.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class HomeScreen extends StatefulWidget {

  final branchId;

  const HomeScreen({Key key, this.branchId}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: BlocBuilder<BranchBloc, BranchState>(
        builder: (context, state) {
          if (state is BranchUninitialized) {
            return Scaffold(
              body: Center(
                child: LoadingIndicator(),
              ),
            );
          } else if (state is BranchLoaded) {
            return MultiBlocProvider(providers: [
              BlocProvider<NewsFeedBloc>(
                builder: (context) => NewsFeedBloc(),
              ),
              BlocProvider<ServicesBloc>(
                builder: (context) => ServicesBloc(),
              ),
              BlocProvider<SendHelpBloc>(
                builder: (context) => SendHelpBloc(),
              ),
              BlocProvider<TransparencyBloc>(
                builder: (context) => TransparencyBloc(),
              ),
              BlocProvider<ProfileBloc>(
                builder: (context) => ProfileBloc(),
              ),
            ], child: HomeBottomNavigator());
          } else if (state is BranchLoading) {
            return Scaffold(
              body: Center(
                child: LoadingIndicator(),
              ),
            );
          } else if (state is BranchError)
            return Scaffold(
              body: ErrorMessage.errMsg(errorMessage: "Something went wrong!"),
            );
          else
            print("Else");
          return Container();
        },
      ),
      onWillPop: () {
        return _exitDialog(context);
      },
    );
  }

  Future<bool> _exitDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: ListTile(
          title: Text("Would you like to close the app?"),
          leading: Icon(
            Icons.help,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      ),
    );
  }
}
