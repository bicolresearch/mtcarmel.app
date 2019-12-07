/*
*   Filename    :   marriage_bloc.dart
*   Purpose     :
*   Created     :   28/11/2019 8:34 AM by Detective Conan
*   Updated     :   28/11/2019 8:34 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/marriage_bloc/marriage_event.dart';
import 'package:mt_carmel_app/src/blocs/marriage_bloc/marriage_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/marriage_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class MarriageBloc extends Bloc<MarriageEvent, MarriageState> {
  @override
  MarriageState get initialState => MarriageUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<MarriageState> mapEventToState(MarriageEvent event) async* {
    if (event is FetchMarriage) {
      yield MarriageLoading();
      try {
        _moduleAndDataActions =
            await locator<MarriageService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoMarriageLoaded();
          return;
        }
        yield MarriageLoaded();
      } catch (e) {
        print(e);
        yield MarriageError(Exception(e));
      }
    }
  }
}
