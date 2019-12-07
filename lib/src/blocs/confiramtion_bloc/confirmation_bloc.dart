/*
*   Filename    :   confirmation_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 10:03 AM by Detective Conan
*   Updated     :   22/11/2019 10:03 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/confiramtion_bloc/confirmation_event.dart';
import 'package:mt_carmel_app/src/blocs/confiramtion_bloc/confirmation_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/confirmation_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  @override
  ConfirmationState get initialState => ConfirmationUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<ConfirmationState> mapEventToState(ConfirmationEvent event) async* {
    if (event is FetchConfirmation) {
      yield ConfirmationLoading();
      try {
        _moduleAndDataActions =
            await locator<ConfirmationService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoConfirmationLoaded();
          return;
        }
        yield ConfirmationLoaded();
      } catch (e) {
        print(e);
        yield ConfirmationError(Exception(e));
      }
    }
  }
}
