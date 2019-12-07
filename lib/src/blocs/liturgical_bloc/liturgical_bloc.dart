/*
*   Filename    :   liturgical_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 8:57 AM by Detective Conan
*   Updated     :   22/11/2019 8:57 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_event.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/liturgical_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';
import 'package:mt_carmel_app/src/models/liturgical.dart';

class LiturgicalBloc extends Bloc<LiturgicalEvent, LiturgicalState> {
  @override
  LiturgicalState get initialState => LiturgicalUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;


  @override
  Stream<LiturgicalState> mapEventToState(LiturgicalEvent event) async* {
    if (event is FetchLiturgical) {
      yield LiturgicalLoading();
      try {
        _moduleAndDataActions =
            await locator<LiturgicalService>().getModuleAndDataActions();
        if(_moduleAndDataActions.modules.length == 0 ){
          yield NoLiturgicalLoaded();
          return;
        }
        yield LiturgicalLoaded();
      } catch (e) {
        print(e);
        yield LiturgicalError(Exception("$e"));
      }
    }
  }
}
