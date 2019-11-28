/*
*   Filename    :   crypt_lobby_page.dart
*   Purpose     :
*   Created     :   28/11/2019 10:27 AM by Detective Conan
*   Updated     :   28/11/2019 10:27 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/crypt_lobby_bloc/crypt_lobby_bloc.dart';
import 'package:mt_carmel_app/src/blocs/crypt_lobby_bloc/crypt_lobby_event.dart';
import 'package:mt_carmel_app/src/blocs/crypt_lobby_bloc/crypt_lobby_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/crypt_lobby_srceens/crypt_lobby_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class CryptLobbyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: BlocBuilder<CryptLobbyBloc, CryptLobbyState>(
            builder: (context, state) {
              if (state is CryptLobbyLoading ||
                  state is CryptLobbyUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is CryptLobbyLoaded) {
                return CryptLobbyScreen();
              }
              if (state is CryptLobbyError) {
                return _errorDisplay(context);
              }
              if (state is NoCryptLobbyLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No CryptLobby Loaded", buttonLabel: "Reload");
              }
              if (state is CryptLobbyNoConnection) {
                return _errorDisplay(context, errorMsg: "No Connection");
              }
              return Container();
            },
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: leftArrowBackButton(context: context),
          ),
        ],
      ),
    );
  }

  Widget _errorDisplay(BuildContext context,
      {String errorMsg = "Something went wrong!",
      String buttonLabel = "Retry"}) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: Text("$errorMsg")),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.brown,
                  child: Text(
                    "$buttonLabel",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<CryptLobbyBloc>(context)
                        .dispatch(FetchCryptLobby());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
