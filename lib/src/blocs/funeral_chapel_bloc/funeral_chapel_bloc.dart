/*
*   Filename    :   funeral_chapel_bloc.dart
*   Purpose     :
*   Created     :   28/11/2019 10:21 AM by Detective Conan
*   Updated     :   28/11/2019 10:21 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/funeral_chapel_bloc/funeral_chapel_event.dart';
import 'package:mt_carmel_app/src/blocs/funeral_chapel_bloc/funeral_chapel_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/funeral_chapel_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class FuneralChapelBloc extends Bloc<FuneralChapelEvent, FuneralChapelState> {
  @override
  FuneralChapelState get initialState => FuneralChapelUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<FuneralChapelState> mapEventToState(FuneralChapelEvent event) async* {
    if (event is FetchFuneralChapel) {
      yield FuneralChapelLoading();
      try {
        _moduleAndDataActions =
            await locator<FuneralChapelService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoFuneralChapelLoaded();
          return;
        }
        yield FuneralChapelLoaded();
      } catch (e) {
        print(e);
        yield FuneralChapelError(Exception(e));
      }
    }
  }
}
