/*
*   Filename    :   november_mass_bloc.dart
*   Purpose     :
*   Created     :   28/11/2019 10:29 AM by Detective Conan
*   Updated     :   28/11/2019 10:29 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/november_mass_bloc/november_mass_event.dart';
import 'package:mt_carmel_app/src/blocs/november_mass_bloc/november_mass_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/november_mass_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class NovemberMassBloc extends Bloc<NovemberMassEvent, NovemberMassState> {
  @override
  NovemberMassState get initialState => NovemberMassUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<NovemberMassState> mapEventToState(NovemberMassEvent event) async* {
    if (event is FetchNovemberMass) {
      yield NovemberMassLoading();
      try {
        _moduleAndDataActions =
            await locator<NovemberMassService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoNovemberMassLoaded();
          return;
        }
        yield NovemberMassLoaded();
      } catch (e) {
        print(e);
        yield NovemberMassError(Exception(e));
      }
    }
  }
}
