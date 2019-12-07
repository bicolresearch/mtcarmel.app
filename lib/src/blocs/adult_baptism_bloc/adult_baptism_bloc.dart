/*
*   Filename    :   adult_baptism_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 9:41 AM by Detective Conan
*   Updated     :   22/11/2019 9:41 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_event.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/adult_baptism_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class AdultBaptismBloc extends Bloc<AdultBaptismEvent, AdultBaptismState> {
  @override
  AdultBaptismState get initialState => AdultBaptismUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<AdultBaptismState> mapEventToState(AdultBaptismEvent event) async* {
    if (event is FetchAdultBaptism) {
      yield AdultBaptismLoading();
      try {
        _moduleAndDataActions =
            await locator<AdultBaptismService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoAdultBaptismLoaded();
          return;
        }
        yield AdultBaptismLoaded();
      } catch (e) {
        print(e);
        yield AdultBaptismError(Exception(e));
      }
    }
  }
}
