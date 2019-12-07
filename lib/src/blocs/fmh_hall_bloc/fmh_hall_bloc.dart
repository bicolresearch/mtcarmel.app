/*
*   Filename    :   fmh_hall_bloc.dart
*   Purpose     :
*   Created     :   28/11/2019 10:36 AM by Detective Conan
*   Updated     :   28/11/2019 10:36 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/fmh_hall_bloc/fmh_hall_event.dart';
import 'package:mt_carmel_app/src/blocs/fmh_hall_bloc/fmh_hall_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/fmh_hall_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class FmhHallBloc extends Bloc<FmhHallEvent, FmhHallState> {
  @override
  FmhHallState get initialState => FmhHallUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<FmhHallState> mapEventToState(FmhHallEvent event) async* {
    if (event is FetchFmhHall) {
      yield FmhHallLoading();
      try {
        _moduleAndDataActions =
            await locator<FmhHallService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoFmhHallLoaded();
          return;
        }
        yield FmhHallLoaded();
      } catch (e) {
        print(e);
        yield FmhHallError(Exception(e));
      }
    }
  }
}
