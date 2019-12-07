/*
*   Filename    :   funeral_service_bloc.dart
*   Purpose     :
*   Created     :   28/11/2019 10:17 AM by Detective Conan
*   Updated     :   28/11/2019 10:17 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/funeral_service_bloc/funeral_service_event.dart';
import 'package:mt_carmel_app/src/blocs/funeral_service_bloc/funeral_service_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/funeral_service_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class FuneralServiceBloc
    extends Bloc<FuneralServiceEvent, FuneralServiceState> {
  @override
  FuneralServiceState get initialState => FuneralServiceUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<FuneralServiceState> mapEventToState(
      FuneralServiceEvent event) async* {
    if (event is FetchFuneralService) {
      yield FuneralServiceLoading();
      try {
        _moduleAndDataActions =
            await locator<FuneralServiceService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoFuneralServiceLoaded();
          return;
        }
        yield FuneralServiceLoaded();
      } catch (e) {
        print(e);
        yield FuneralServiceError(Exception(e));
      }
    }
  }
}
