/*
*   Filename    :   crypt_lobby_bloc.dart
*   Purpose     :
*   Created     :   28/11/2019 10:25 AM by Detective Conan
*   Updated     :   28/11/2019 10:25 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/crypt_lobby_bloc/crypt_lobby_event.dart';
import 'package:mt_carmel_app/src/blocs/crypt_lobby_bloc/crypt_lobby_state.dart';

class CryptLobbyBloc extends Bloc<CryptLobbyEvent, CryptLobbyState> {
  @override
  CryptLobbyState get initialState => CryptLobbyUninitialized();

  @override
  Stream<CryptLobbyState> mapEventToState(CryptLobbyEvent event) async* {
    if (event is FetchCryptLobby) {
      yield CryptLobbyLoading();
      try {
        // TODO implement code
        yield CryptLobbyLoaded();
      } catch (e) {
        print(e);
        yield CryptLobbyError(Exception(e));
      }
    }
  }
}
