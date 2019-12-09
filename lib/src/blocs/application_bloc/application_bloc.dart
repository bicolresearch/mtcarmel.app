/*
*   Filename    :   application_bloc.dart
*   Purpose     :
*   Created     :   09/12/2019 10:10 AM by Detective Conan
*   Updated     :   09/12/2019 10:10 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/application_bloc/application_event.dart';
import 'package:mt_carmel_app/src/blocs/application_bloc/application_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/application_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  @override
  ApplicationState get initialState => ApplicationUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is FetchApplication) {
      yield ApplicationLoading();
      try {
        _moduleAndDataActions =
            await locator<ApplicationService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoApplicationLoaded();
          return;
        }
        yield ApplicationLoaded();
      } catch (e) {
        print(e);
        yield ApplicationError(Exception(e));
      }
    }
  }
}
