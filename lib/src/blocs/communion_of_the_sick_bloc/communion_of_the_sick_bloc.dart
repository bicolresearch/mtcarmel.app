/*
*   Filename    :   communion_of_the_sick_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 9:57 AM by Detective Conan
*   Updated     :   22/11/2019 9:57 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/communion_of_the_sick_bloc/communion_of_the_sick_event.dart';
import 'package:mt_carmel_app/src/blocs/communion_of_the_sick_bloc/communion_of_the_sick_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/communion_of_the_sick_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class CommunionOfTheSickBloc
    extends Bloc<CommunionOfTheSickEvent, CommunionOfTheSickState> {
  @override
  CommunionOfTheSickState get initialState => CommunionOfTheSickUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<CommunionOfTheSickState> mapEventToState(
      CommunionOfTheSickEvent event) async* {
    if (event is FetchCommunionOfTheSick) {
      yield CommunionOfTheSickLoading();
      try {
        _moduleAndDataActions =
        await locator<CommunionOfTheSickService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoCommunionOfTheSickLoaded();
          return;
        }
        yield CommunionOfTheSickLoaded();
      } catch (e) {
        print(e);
        yield CommunionOfTheSickError(Exception(e));
      }
    }
  }
}
