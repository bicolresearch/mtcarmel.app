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
import 'package:mt_carmel_app/src/core/services/profiles_api/crypt_lobby_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class CryptLobbyBloc extends Bloc<CryptLobbyEvent, CryptLobbyState> {
  @override
  CryptLobbyState get initialState => CryptLobbyUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<CryptLobbyState> mapEventToState(CryptLobbyEvent event) async* {
    if (event is FetchCryptLobby) {
      yield CryptLobbyLoading();
      try {
        _moduleAndDataActions =
            await locator<CryptLobbyService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoCryptLobbyLoaded();
          return;
        }
        yield CryptLobbyLoaded();
      } catch (e) {
        print(e);
        yield CryptLobbyError(Exception(e));
      }
    }
  }
}
