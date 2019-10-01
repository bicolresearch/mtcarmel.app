/*
*   Filename    :   home_screen.dart
*   Purpose     :
*   Created     :   02/09/2019 10:57 AM by Detective Conan
*	 Updated			:   01/10/2019 2:47 PM PM by Detective Conan
*	 Changes			:   Added method for error message display.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_state.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_bloc.dart';
import 'package:mt_carmel_app/src/blocs/profile_bloc/profile_bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_bloc.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab_bloc.dart';

//import 'package:mt_carmel_app/src/blocs/transparency_bloc/transparency_bloc.dart';
import 'package:mt_carmel_app/src/screens/home_bottom_navigator.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';

import 'package:mt_carmel_app/src/screens/start_page.dart';

class HomeScreen extends StatefulWidget {
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
            final branch = BlocProvider.of<BranchBloc>(context).branch;
            BlocProvider.of<TabBloc>(context).setBranch(branch);
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
//              BlocProvider<TransparencyBloc>(
//                builder: (context) => TransparencyBloc(),
//              ),
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
          } else if (state is BranchError) {
            return _errorMsgDisplay(context: context, branchId: state.branchId);
          } else if (state is BranchNoConnection) {
            return _errorMsgDisplay(
                context: context,
                branchId: state.branchId,
                err: "No connection!");
          } else
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
        content: Text("Do you want to close this app?"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
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

  _navigateToStartPage(context) async {
    await SharedPreferencesHelper.setBranchNameFlag(null);
    await SharedPreferencesHelper.setBranchIdFlag(null);
    await SharedPreferencesHelper.setResetBranch(true);
    locator<BranchService>().clearBranch();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return StartPage();
        },
      ),
    );
  }

  _errorMsgDisplay(
      {@required BuildContext context,
      @required String branchId,
      String err = "Something went wrong!",
      String buttonLabel = "Retry"}) {
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
              BlocProvider.of<BranchBloc>(context)
                  .dispatch(GetBranch(branchId));
            },
          ),
          OutlineButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.brown[500],
            child: Text(
              "Carmel locations",
              style: TextStyle(
                  color: Colors.brown[500], fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              _navigateToStartPage(context);
            },
          ),
        ],
      ),
    );
  }
}
