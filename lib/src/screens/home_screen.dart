/*
*   Filename    :   home_screen.dart
*   Purpose     :
*   Created     :   02/09/2019 10:57 AM by Detective Conan
*	 Updated			:   04/09/2019 3:41 PM PM by Detective Conan
*	 Changes			:   Added blocProvider for tabBloc
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_state.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab.dart';
import 'package:mt_carmel_app/src/screens/home_bottom_navigator.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  @required
  final branchRepo;

  const HomeScreen({Key key, this.branchRepo}) : super(key: key);

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
            return Center(
              child: LoadingIndicator(),
            );
          } else if (state is BranchLoaded) {
            print(BranchLoaded);
            return BlocProvider(
                builder: (context) => TabBloc(),
                child: HomeBottomNavigator());
          } else if (state is BranchLoading) {
            return Scaffold(
              body: Center(
                child: LoadingIndicator(),
              ),
            );
          } else
            print("Else");
          return Container();
        },
      ),
      onWillPop:() {return _exitDialog(context);},
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
//              final bloc = BlocProvider.of<BranchBloc>(context);
              Navigator.pop(context, true);
//              bloc.dispatch(CloseApp());
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
