/*
*   Filename    :   first_communion_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 9:53 AM by Detective Conan
*   Updated     :   22/11/2019 9:53 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_event.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/first_communion_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class FirstCommunionBloc
    extends Bloc<FirstCommunionEvent, FirstCommunionState> {
  @override
  FirstCommunionState get initialState => FirstCommunionUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<FirstCommunionState> mapEventToState(
      FirstCommunionEvent event) async* {
    if (event is FetchFirstCommunion) {
      yield FirstCommunionLoading();
      try {
        _moduleAndDataActions =
            await locator<FirstCommunionService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoFirstCommunionLoaded();
          return;
        }
        yield FirstCommunionLoaded();
      } catch (e) {
        print(e);
        yield FirstCommunionError(Exception(e));
      }
    }
  }
}
